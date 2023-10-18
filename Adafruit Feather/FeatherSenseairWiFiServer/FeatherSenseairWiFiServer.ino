/*  Adafruit Feather Senseair K96 with Modbus Interface
 *  
 *  Creates an external interface and stores data from serial sensor devices
 *  Currently works with Adalogger SD card, FeatherWing WiFi, and Simcom 7080G modem
 *  System has optional data acquisition from a serial GPS device
 *  1. Check for web page request
 *  2. Check for serial port input
 *  3. Data acquisition check
 *  3a. Check timer
 *  3b. Sensor data
 *  3c. GPS data
 *  3d. Clock data
 *  4. ONLY IF data acquired FTP check
 *  4a. Upload backup data file if timer check OR getting too large for transfer
 *  4b. Upload recent data file if timer check
 *  4c. Download settings file if timer check
 *  
 * Written by James D. Jeffers 2022/06/30
 * Copyright (c) 2022 University of Oklahoma.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#define SW_VER_NUM          "Firmware v0.9.1"
#include "secrets.h"

#include "k96Modbus.h"
#include "WifiData.h"
#include "SimModem.h"
#include "DataLogger.h"
#include "GPSSerial.h"

#define DEVICE_ENABLED      1
#define DEVICE_DISABLED     -1

#define INTERVAL_DATA_MAX   900000
#define INTERVAL_DATA_MIN   20000
#define INTERVAL_FTP_MAX    900000
#define INTERVAL_FTP_MIN    60000
#define INTERVAL_CFG_MAX    900000
#define INTERVAL_CFG_MIN    60000
#define INTERVAL_BACKUP_MAX 7200000
#define INTERVAL_BACKUP_MIN 600000
#define INTERVAL_LOG_MAX    3600000
#define INTERVAL_LOG_MIN    60000

#define SERIAL_BUFFER       1024

String dataString = "";

int intervalData = 1000;                 // Read data from sensor and GPS every 30 seconds
int timerLastRead = 0;                         // Millisecond timer value for last data read

int intervalFile = DEVICE_ENABLED;        // Status variable to enable/disable code options

int intervalUpdate = 0;                   // Write most recent data to FTP server every 3 minutes
int timerLastDataFile = 0;                // Millisecond timer value for last data upload
int countLastDataFile = 0;

int intervalCfg = 0;                      // Read timing configuration by FTP every 3 minutes
int timerLastCfg = 0;

int intervalBackup = 0;                   // Backup the data file every 15 minutes
int LastFileUpload = 0;
int lastFTPByteBackup = 0;

int intervalLog = 3600000;                // Update the system event log every 60 minutes
int timerLastLog = 0;                     // Timer value in milliseconds for last log FTP
int lastFTPByteLog = 0;                   // Number of bytes current log succussful FTP

SimModem modem;
int statusModem = DEVICE_ENABLED;         // Tracks current state of modem (0 = OK)
int statusFTP = -1;                       // Tracks the number of consectutive FTP errors (0 = OK)

k96Modbus k96;
int statusSensor = DEVICE_ENABLED;

DataLogger logger;
int statusSD = DEVICE_ENABLED;
bool fileSizeLimit = false;               // Number of bytes before a new file is created
bool dataSizeLimit = false;               // Number of bytes stored locally before modem is activated

GPSSerial gpsSerial;
int statusGPS = DEVICE_DISABLED;

int statusClock = 0;

// Serial port parser
char serialBuffer[SERIAL_BUFFER] = "";
/*********************************************************************************************
 *  Setup and Initializtion
 *  
 *  Serial port for debug
 *  SD card (can store text before/after other devices) 
 *  Modem for real-time data transfer
 *  
 */

void setup() {
  
  Serial.begin(115200);                   // Initialize serial port for USB connections
  pinMode(LED_BUILTIN, OUTPUT);           // Use builtin LED for status blinking
  delay(1000);

  /* Device 1: SD card 1111111111111111111111111111111111111111111111111111111111*/
  if (statusSD == DEVICE_ENABLED){
    statusSD = logger.init();
    if (!statusSD){
      logger.fileRemove(1);
      logger.logNewName();
      logger.fileAddCSV("**********************************************",2);
      logger.fileAddCSV(SW_VER_NUM,2);
      logger.fileAddCSV(("Settings: " + settingsString()),FILE_TYPE_LOG);

      if (!readStatus()){
        writeStatus();
      }
    }
  }
  
  /* Device 2: Modem 2222222222222222222222222222222222222222222222222222222222222*/
  if (statusModem == DEVICE_ENABLED){
    statusModem = modem.init();
    if (statusModem){
      logger.fileAddCSV("Modem not present",FILE_TYPE_LOG);
    }
    else{
      logger.fileAddCSV((modem.readClock(0)+": modem initialized"),FILE_TYPE_LOG);
    }
  }

  /* Device 3: Chemical sensor 11111111111111111111111111111111111111111111111111111111111111*/
  statusSensor = k96.init();
  if (!statusSensor){
    logger.fileAddCSV((modem.readClock(0)+": K96 Sensor = " + k96.getDeviceID()+" Firmware = " + k96.readSensorFW()),FILE_TYPE_LOG);
  }
  else {
    logger.fileAddCSV("Sensor Failed",FILE_TYPE_LOG);
  }

  // Create a data acquisition file based on the date
  if (!statusSD){
    logger.fileNewName();
    logger.fileAddCSV((modem.readClock(0)+": Data acquisition file = " + logger.fileNameString()),FILE_TYPE_LOG);
  }
  
  // Completed startup, with internet connection store system log with FTP
  if (!statusModem){
    Serial.println("Log File Upload Started");
    File tempFile = logger.fileOpen(FILE_TYPE_LOG);
    int currentFTP = modem.ftpPut(tempFile,FILE_TYPE_LOG);
    logger.fileAddCSV((modem.readClock(0)+": Log File Upload: " + String(currentFTP)),FILE_TYPE_LOG);
    if (!currentFTP){
      lastFTPByteLog = tempFile.size();
    }
    tempFile.close();
  }

}

/******************************************************************************************************
 *  Main program loop
 *  1. Check serial port and handle I/O
 *  2. Loop timing, read sensor data
 *  3. Loop timing, Update timing, upload data
 *  4. Loop timing, file timing, upload data
 ******************************************************************************************************/

void loop() {

  // Check the serial port for user input, single letter codes
  if (Serial.available()){
    
    String serialCommand = "";
    int serialData = 0;
    int serialDataSize = Serial.readBytesUntil('\n',serialBuffer, SERIAL_BUFFER);
    serialCommand = String(serialBuffer);
    serialCommand = serialCommand.substring(0,serialDataSize);
    
    if (serialCommand == "status"){
      Serial.println("System Status");
      Serial.print("Modem = ");
      Serial.println(statusModem);
      Serial.print("SD Card = ");
      Serial.println(statusSD);
      Serial.print("GPS Sensor = ");
      Serial.println(statusGPS);
      Serial.print("Sensor = ");
      Serial.println(statusSensor);
    }
    else if (serialCommand == "d"){
      Serial.println(dataString);
    }
    else if (serialCommand.startsWith("d=")){
      intervalData = serialCommand.substring(2,serialDataSize).toInt();
      Serial.print("New data rate:");
      Serial.println(intervalData);
    }

    //********************************************************************************
    // SD Card commands
    else if (serialCommand == "filename"){
      Serial.println(logger.fileNameString());                 // Data file
    }
    else if (serialCommand == "f"){
      logger.fileDump(0);                 // Data file
    }
    else if (serialCommand == "F"){
      logger.fileDump(2);                 // Log file
    }
    else if (serialCommand == "r"){
      logger.fileRemove(1);
    }
    else if (serialCommand == "ls"){
      Serial.println("SD Card Directory ");
      File root;
      root = SD.open("/");
      logger.fileDir(root,4);
      root.close();
    }
    else if (serialCommand.indexOf("!") >= 0){
      Serial.println("SD Card Delete All ");
      logger.fileRemoveAll();
    }

    //*********************************************************************************
    // Modem Commands
    else if (serialCommand.startsWith("upload=")){
      intervalUpdate = serialCommand.substring(7,serialDataSize).toInt();
      Serial.print("New FTP upload rate: ");
      Serial.println(intervalUpdate);
      logger.fileAddCSV((modem.readClock(0)+": FTP Upload Delay = " + String(intervalUpdate)),2);
    }
    
    else if (serialCommand == "e"){
      Serial.print("Simcom 7070G Device Echo Off = ");
      Serial.println(modem.echoOff());
    }
    else if (serialCommand == "imei"){
      Serial.print("Simcom 7070G Device IMEI = ");
      Serial.println(modem.readIMEI());
    }
    
    else if (serialCommand == "q"){
      Serial.print("Simcom 7070G 4G Signal = ");
      Serial.println(modem.readSignal());      
    }
    else if (serialCommand == "g"){
      Serial.print("Simcom 7070G GPS Signal = ");
      Serial.println(modem.readGPS());      
    }
    else if (serialCommand == "h"){
      Serial.print("Simcom 7070G RF Config = ");
      Serial.println(modem.readRFCfg());      
    }
    else if (serialCommand == "c" || serialCommand == "time"){
      Serial.print("Simcom 7070G Date and Time = ");
      Serial.println(modem.readClock(0));
    }
    
    else if (serialCommand == "init"){
      Serial.print("Simcom 7070G Reset ");
      Serial.println(modem.init());
    }
    
    else if (serialCommand == "power"){
      Serial.println("Simcom 7070G Power Toggle");
      modem.powerToggle();
    }
    
     
    else if (serialCommand == "1"){
      Serial.print("Simcom 7070G Disabled = ");
      Serial.println(modem.GPSOff());
    }
    else if (serialCommand == "2"){
      Serial.print("Simcom 7070G Enabled = ");
      Serial.println(modem.GPSOn());
    }
    else if (serialCommand == "3"){
      Serial.print("Simcom 7070G Disabled = ");
      Serial.println(modem.RFOff());
    }
    else if (serialCommand == "4"){
      Serial.print("Simcom 7070G Enabled = ");
      Serial.println(modem.RFOn());
    }
    else if (serialCommand == "exit"){
      Serial.print("Simcom 7070G Device Exit ");
      logger.fileRemoveAll();
      while(1);
    }
    //********************************************************************************
    // Network Commands
    else if (serialCommand == "net off"){
      Serial.println("Simcom 7070G Network Deactivated = ");
      Serial.println(modem.disableIP());
    }
    else if (serialCommand == "net on"){
      Serial.println("Simcom 7070G Network Activated = ");
      Serial.println(modem.enableIP());
    }
    else if (serialCommand == "i"){
      Serial.print("Simcom 7070G IP Address = ");
      Serial.println(modem.readIP());
    }
    else if (serialCommand == "p"){
      Serial.print("Simcom 7070G IP Ping = ");
      Serial.println(modem.readIPPing());
    }
    else if (serialCommand == "clock"){
      Serial.print("Simcom 7070G Time Server = ");
      Serial.println(modem.readIPPing());
    }
    //********************************************************************************
    // FTP Commands
    else if (serialCommand == "ftp start"){
      Serial.println("Simcom 7070G FTP Reset ");
      Serial.println(modem.startFTP());
    }
    else if (serialCommand == "ftp un"){
      Serial.print("Simcom 7070G FTP Set Username = ");
      Serial.println(modem.ftpUsername());
    }
    else if (serialCommand == "ftp id"){
      Serial.print("Simcom 7070G FTP Set CID = ");
      Serial.println(modem.ftpCID());
    }
    else if (serialCommand == "ftp pwd"){
      Serial.print("Simcom 7070G FTP Set Password = ");
      Serial.println(modem.ftpPwd());
    }
    else if (serialCommand == "ftp server"){
      Serial.print("Simcom 7070G FTP Set Server = ");
      Serial.println(modem.ftpServer());
    }
    else if (serialCommand == "ftp filename"){
      Serial.print("Simcom 7070G FTP Set File Name = ");
      Serial.println(modem.ftpFile());
    }
    else if (serialCommand == "ftp status"){
      Serial.print("Simcom 7070G FTP Status:");
      Serial.println(modem.ftpStatus());
    }
    
    else if (serialCommand == "ftp ls"){
      Serial.print("Simcom 7070G FTP List = ");
      Serial.println(modem.ftpList());
    }
    else if (serialCommand == "ftp update"){
      Serial.print("Simcom 7070G FTP Get = ");
      if (updateConfig() >= 0){
        Serial.print("File downloaded");
        Serial.println(settingsString());
      }
      else {
        Serial.println("FTP Download Failed");
      }
    }
    else if (serialCommand == "s"){
      Serial.print("Simcom 7070G FTP Put File= ");
      File tempFile = logger.fileOpen(0);
      Serial.println(modem.ftpPut(tempFile,0));
      tempFile.close();
    }
    else if (serialCommand == "S"){
      Serial.print("Simcom 7070G FTP Put Append Data= ");
      Serial.println(modem.ftpPut(dataString));
    }

    //*********************************************************************************
    // GPS Commands
    else if (serialCommand == "gps"){
      Serial.print("GPS Serial Value = ");
      Serial.println(gpsSerial.readResponse());
    }
    else if (serialCommand == "gps_raw"){
      Serial.print("GPS Serial Value = ");
      Serial.println(gpsSerial.readRaw());
    }
    else if (serialCommand == "gps_time"){
      //gps.encode(modem.readGPS());
      Serial.print("GPS Serial Time = ");
      Serial.println(gpsSerial.time());
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    else{
      Serial.println("Unknown Command = " + serialCommand);
    }
    
  }

/*
 * Data processing loop - create comma separated value string
 * 
 * 1 - Date
 * 2 - Time
 * 3 - CH4 concentration
 * 4 - CO2 concentration
 * 5 - H2O concentration
 */
  
  if ((millis()-timerLastRead) > intervalData){
    
    timerLastRead = millis();
    int option = (intervalUpdate != 0);
    dataString = ',' + String(millis()/1000) + ',';
    int test = k96.readCSVString(dataString);                              // Sensor data
  
//SDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSDSD
// Store the data on local SD card (can be disabled)
// Check file size for disk management, change filename if necessary
// Display external error message using opCode
    if(intervalFile == DEVICE_ENABLED){
      statusSD = logger.fileAddCSV(dataString, option);
      fileSizeLimit = (logger.fileCheckSize() > FILE_MAX_SIZE);
      dataSizeLimit = ((logger.fileCheckSize() - lastFTPByteBackup) > DATA_MAX_SIZE) || fileSizeLimit;
      if (statusSD > 0){
        opCode(3);
      }
      else if (test != 0){
        opCode(2);
      }
      else {
        opCode(1);
      }
    }
    else{
      if (test != 0){
        opCode(1);
      }
      else if (statusSD > 0){
        opCode(2);
      }
    }
    
    //FTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTP
    // Update the data file on the FTP server
    if (intervalUpdate && (millis()-timerLastDataFile) > intervalUpdate){
      File tempFile = logger.fileOpen(1);
      int currentFTP = modem.ftpPut(tempFile,1);
      tempFile.close();
      if (!currentFTP){
        logger.fileAddCSV((modem.readClock(0)+": File append, recent data"),2);
        logger.fileRemove(1);         
        timerLastDataFile = millis();
        statusFTP = 0;
      }
      // Failed FTP, increment the consecutive failure counter
      else{
        statusFTP += 1;
        logger.fileAddCSV((modem.readClock(0)+": FTP ERROR append"),2);
      }
        
    }
      
      // LOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOGLOG
      // Update the system log, append only the bytes since the last successful FTP transfer
      else if (intervalLog && (millis()-timerLastLog) > intervalLog){
        File tempFile = logger.fileOpen(2);
        tempFile.seek(lastFTPByteLog);
        int currentFTP = modem.ftpPut(tempFile,2);
        // Successful FTP, record in log, set number bytes, reset timer 
        if (!currentFTP){
          logger.fileAddCSV((modem.readClock(0)+": Log file updated"),2);
          timerLastLog = millis();
          statusFTP = 0;
          lastFTPByteLog = tempFile.size();
        }
        else{
          logger.fileAddCSV((modem.readClock(0)+": Log file upload failed"),2);
          statusFTP += 1;
        }
        tempFile.close();
      }
      //CONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIGCONFIG
      // Not updating the data file
      else if (intervalCfg && (millis()-timerLastCfg) > intervalCfg){
        int currentFTP = updateConfig();
        if (currentFTP < -1){
          logger.fileAddCSV((modem.readClock(0)+": Invalid settings"),2);
          timerLastCfg = millis();
          statusFTP = 0;
        }
        else if (currentFTP == -1){
          logger.fileAddCSV((modem.readClock(0)+": Config Download: Invalid file"),2);
          statusFTP += 1;
        }
        else if (currentFTP >0){
          logger.fileAddCSV((modem.readClock(0)+": Settings Updated = " + settingsString()),2);
          timerLastCfg = millis();
          statusFTP = 0;
        }
        else{
          statusFTP = 0;
          timerLastCfg = millis();
        }
      }
      //BACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUPBACKUP
      // Upload the dated CSV file
      else if (((intervalBackup && (millis()-LastFileUpload) > intervalBackup)) || dataSizeLimit){
        
        File tempFile = logger.fileOpen(0);
        tempFile.seek(lastFTPByteBackup);
        int currentFTP = modem.ftpPut(tempFile,0);

        // Check if file was uploaded correctly
        if (!currentFTP){
          logger.fileAddCSV((modem.readClock(0)+": Backup file updated"),2);
          LastFileUpload = millis();
          statusFTP = 0;
          lastFTPByteBackup = tempFile.size();
          if (fileSizeLimit){
            logger.fileNewName();
            logger.fileAddCSV((modem.readClock(0)+": File size limit. New file"),2);
            lastFTPByteBackup = 0;
          }
          countLastDataFile++;
          writeStatus();
        }
        // File was not updated, do not increment counter but create new file
        else {
          logger.fileAddCSV((modem.readClock(0)+": File backup failed"),2);
          statusFTP += 1;
        }
        
        tempFile.close();
      }
      //ERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERROR
      // After 5 consecutive failures reset the power to the modem
      if (statusFTP >= 5){
        logger.fileAddCSV((modem.readClock(0)+": FTP ERRORS, Modem reset"),2);
        Serial.println("Modem reset");
        modem.disableIP();
        delay(1000);
        statusFTP = 0;
        modem.powerToggle();
      }
      //POWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWER
      // If sufficient delay until next modem action, disable network connection
      if (intervalUpdate >= 45000){
        Serial.println("File Updated");
        //modem.disableIP();
      }
  }    
}

/* *********************************************************************************************** 
 *   updateConfig()
 * 
 *  Uses the modems FTP Get function to download a file: "config.json"
 *  Currently searches for tags for three variables
 *  intervalData, intervalDelay, intervalBackup
 *  
 *  Return: error if file is not found, or tag is not present setting is not updated
 *  1  : file found, settings updated
 *  0  : file found, no change
 *  -1 : file not found
 *  -2 : file found, incorrect format
 ***********************************************************************************************/

int updateConfig(){

  String json;
  String result;
  int found;
  int num;
  int change = 0;
  
  json = modem.ftpGet();
  
  // Empty string indicates file not opened
  if (json.length() < 20){
    return 0;
  }
  found = json.indexOf("intervalData=");
  if (found >= 0){
    String result = json.substring(found+13,json.indexOf(";",found+13));
    num = result.toInt();
    if (num != intervalData){
      if (num && num > INTERVAL_DATA_MAX  && num < INTERVAL_DATA_MIN) return -2;
      intervalData = num;
      change = 1;
     }
     
  }
  found = json.indexOf("intervalFTP=");
  if (found >= 0){
    String result = json.substring(found+12,json.indexOf(";",found+12));
    num = result.toInt();
    if (num != intervalUpdate){
      if (num && num > INTERVAL_FTP_MAX && num < INTERVAL_FTP_MIN) return -2;
      intervalUpdate = num;
      change = 1;
     }
  }
  found = json.indexOf("intervalCfg=");
  if (found >= 0){
    String result = json.substring(found+12,json.indexOf(";",found+12));
    num = result.toInt();
    if (num != intervalCfg){
      if (num && num > INTERVAL_CFG_MAX && num < INTERVAL_CFG_MIN) return -2;
      intervalCfg = num;
      change = 1;
     }
  }
  found = json.indexOf("intervalLog=");
  if (found >= 0){
    String result = json.substring(found+12,json.indexOf(";",found+12));
    num = result.toInt();
    if (num != intervalLog){
      if (num && num > INTERVAL_LOG_MAX && num < INTERVAL_LOG_MIN) return -2;
      intervalLog = num;
      change = 1;
     }
  }
  found = json.indexOf("intervalBackup=");
  if (found >= 0){
    String result = json.substring(found+15,json.indexOf(";",found+15));
    num = result.toInt();
    if (num != intervalBackup){
      if (num > INTERVAL_BACKUP_MAX && num < INTERVAL_BACKUP_MIN) return -2;
      intervalBackup = num;
      change = 1;
    }
    return change;
  }
  return -2;
}

/*
 * Parse the status file
 */

int readStatus(){
  String json;
  File statusFile = logger.fileOpen(FILE_TYPE_STATUS);

  while(statusFile.available()){
    json+=statusFile.read();
  }
  
  int found = json.indexOf(STATUS_TAG_FILE);
  String result = json.substring(found+14,json.indexOf(";",found+14));
  countLastDataFile = result.toInt();
  statusFile.close();
  return 0;
}

int writeStatus(){
  String json = STATUS_TAG_FILE + String(countLastDataFile) + ";";
  logger.fileAddCSV(json,FILE_TYPE_STATUS);
  return 0;
}

/*
 * Puts the system settings in a printable string
 */

 String settingsString(){
  return "intervalData=" + String(intervalData) + ",intervalFTP=" + String(intervalUpdate) + 
         ",intervalCfg=" + String(intervalCfg) + ",intervalLog=" + String(intervalLog)+ 
         ",intervalBackup=" + String(intervalBackup);
 }

// Status LED
void opCode(int blinks){
  for (int i =0; i < blinks; i++){
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(50);                         // wait for a second
    digitalWrite(LED_BUILTIN, LOW);
    delay(50);
  }
}
