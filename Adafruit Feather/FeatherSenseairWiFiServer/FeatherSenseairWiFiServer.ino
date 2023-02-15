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
#include "secrets.h"

#include "k96Modbus.h"
#include "Airlift.h"
#include "SimModem.h"
#include "DataLogger.h"
#include "GPSSerial.h"

#include <TinyGPS++.h>

#include <NTPClient.h>
#include <WiFiUdp.h>

#define SW_VER_NUM          "0.6"

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

int intervalData = 0;           // Read data from sensor and GPS every 30 seconds
int LastRead = 0;                   // Millisecond timer value for last data read
int updateDelay = 0;          //120000          // Write most recent data to FTP server every 3 minutes
int LastDataUpload = 0;             // Millisecond timer value for last data upload
int intervalCfg = 0;                // Read timing configuration by FTP every 3 minutes
int timerLastCfg = 0;
int intervalBackup = 0;      // Backup the data file every 15 minutes
int LastFileUpload = 0;
int lastFTPByteBackup = 0;
int intervalLog = 0;                // Update the system event log every 60 minutes
int timerLastLog = 0;               // Timer value in milliseconds for last log FTP
int lastFTPByteLog = 0;             // Number of bytes current log succussful FTP

int statusWifi = -1;                // Tracks current state of WiFi (0 = OK)
SimModem modem;
int statusModem = -1;               // Tracks current state of modem (0 = OK)
int statusFTP = -1;                 // Tracks the number of consectutive FTP errors (0 = OK)
k96Modbus k96;
int statusSensor = -1;
DataLogger logger;
int statusSD = -1;
bool fileSizeLimit = false;
GPSSerial gpsSerial;
int statusGPS = -1;

// GPS string conversion object
TinyGPSPlus gps;

// Time stamp updates, requires WiFi connection can be used internal time clock
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP,"pool.ntp.org", 36000, 60000);
bool NTPEnabled = false;


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
  //Initialize serial and wait for port to open:
  Serial.begin(115200);

  // Device 3: GPS sensor
  statusGPS = gpsSerial.init();
  while (1){
    Serial.println(gpsSerial.readRaw());
  }

  /* Device 1: WiFi Server 1111111111111111111111111111111111111111111111111111111*/
  //statusWifi = airliftInit();
  
  if (!statusWifi){
    if (!statusSD) logger.fileAddCSV((modem.readClock(0)+": WiFi server created"),2);
  }
  else{
    if (!statusSD) logger.fileAddCSV((modem.readClock(0)+": WiFi not present"),2);
  }

  /* Device 2: Modem 2222222222222222222222222222222222222222222222222222222222222*/
  statusModem = modem.init();
  // Optional internal clock if modem is not present
  if (statusModem){
    //if (statusWifi) timeClient.begin();
    logger.fileAddCSV("Modem not present",2);
  }
  else{
    logger.fileAddCSV((modem.readClock(0)+": modem initialized"),2);
  }

  // Device 4: SD card, disable if using Feather WiFi (set status = -1)
  statusSD = logger.init();
  if (!statusSD){
    logger.fileRemove(1);
    logger.logNewName();
    logger.fileAddCSV("**********************************************",2);
    logger.fileAddCSV(("Firmware v0.3, Settings: " + settingsString()),2);
  }
  
  // Device 3: GPS sensor
  statusGPS = gpsSerial.init();
  if (!statusGPS){
    logger.fileAddCSV((modem.readClock(0)+": GPS sensor initialized"),2);
  }
  else {
    logger.fileAddCSV((modem.readClock(0)+": GPS sensor not found"),2);
  }

  // Create a data acquisition file based on the date
  if (!statusSD){
    logger.fileNewName(modem.readClock(1));
    logger.fileAddCSV((modem.readClock(0)+": Data acquisition file = " + logger.fileNameString()),2);
  }

  /* Device 1: Chemical sensor 11111111111111111111111111111111111111111111111111111111111111*/
  statusSensor = k96.init();
  if (!statusSensor){
    logger.fileAddCSV((modem.readClock(0)+": K96 Sensor = " + k96.readSensorID()+" Firmware = " + k96.readSensorFW()),2);
  }

  // Completed startup, with internet connection store system log with FTP
  if (!statusModem){
    File tempFile = logger.fileOpen(2);
    int currentFTP = modem.ftpPut(tempFile,2);
    if (!currentFTP){
      lastFTPByteLog = tempFile.size();
    }
    tempFile.close();
  }
}

/******************************************************************************************************
 *  Main program loop
 *  1. Check if WiFi client and serve web page
 *  2. Check serial port and handle I/O
 *  3. Loop timing, read sensor data
 *  4. Loop timing, Update timing, upload data
 *  5. Loop timing, file timing, upload data
 ******************************************************************************************************/

void loop() {

  if (!statusWifi){
    // compare the previous status to the current status
    if (status != WiFi.status()) {
      // it has changed update the variable
      status = WiFi.status();
  
      if (status == WL_AP_CONNECTED) {
        // a device has connected to the AP
        logger.fileAddCSV((modem.readClock(0)+": Device connected to WiFi"),2);
      } else {
        // a device has disconnected from the AP, and we are back in listening mode
        logger.fileAddCSV((modem.readClock(0)+": Device disconnected from WiFi"),2);
      }
    }
    
    WiFiClient client = server.available();   // listen for incoming client
    if (client) {                             // if you get a client,
      Serial.println(client);
      String currentLine = "";                // make a String to hold incoming data from the client
      while (client.connected()) {            // loop while the client's connected
        if (client.available()) {             // if there's bytes to read from the client,
          char c = client.read();             // read a byte, then
          // Serial.write(c);                    // print it out the serial monitor
          if (c == '\n') {                    // if the byte is a newline character
  
            // if the current line is blank, you got two newline characters in a row.
            // that's the end of the client HTTP request, so send a response:
            if (currentLine.length() == 0) {
              // HTTP headers always start with a response code (e.g. HTTP/1.1 200 OK)
              // and a content-type so the client knows what's coming, then a blank line:
              client.println("HTTP/1.1 200 OK");
              client.println("Content-type:text/html");
              client.println();
  
              // the content of the HTTP response follows the header:
              client.print("Senseair K96 Sensor Click <a href=\"/H\">ON</a> ");
              client.print("Click <a href=\"/L\">OFF</a><br>");
              client.print("<br><br>Sensor Read Interval = ");
              client.print(intervalData/1000);
              client.print(" seconds<br>");
              client.print("Click <a href=\"/DELAY0\">1 second</a>, ");
              client.print("Click <a href=\"/DELAY1\">5 seconds</a><br>");
              client.print("Click <a href=\"/DELAY0\">10 seconds</a>, ");
              client.print("Click <a href=\"/DELAY1\">30 seconds</a><br>");
              for (int j=0; j<9; j++){
                client.print(k96.readByteString(j));
              }
  
              client.print("<br><br>GPS Serial Device <a href=\"/GPSON\">ON</a> ");
              client.print("Click <a href=\"/GPSOFF\">OFF</a><br>");
              client.print("<br>Latitude = ");
              client.print(String(gps.location.lat()));
              client.print("<br>Longitude = ");
              client.print(String(gps.location.lng()));
              client.print("<br>Time = ");
              client.print(String(gps.time.hour())+':'+String(gps.time.minute())+':'+String(gps.time.second()));
  
              client.print("<br><br>Sim Modem <a href=\"/MODEMINIT\">ON</a> ");
              client.print("Click <a href=\"/MODEMOFF\">OFF</a><br>");
              
              client.print("<br><br>SD Card datalogger.txt Click <a href=\"/FILEON\">ON</a> ");
              client.print("Click <a href=\"/FILEOFF\">OFF</a><br>");
  
              client.print("<br><br>Simcom Mode Clock: ");
              client.print(modem.readClock(0));
                
              client.print("<br><br>CSVString=");
              client.print(dataString);
  
              break;
            }
            else {      // if you got a newline, then clear currentLine:
              currentLine = "";
            }
          }
          else if (c != '\r') {    // if you got anything else but a carriage return character,
            currentLine += c;      // add it to the end of the currentLine
          }
  
          // Check to see if the client request was "GET /H" or "GET /L":
          if (currentLine.endsWith("GET /H")) {
            //DisplayInternalTemps = 1;               // GET /H turns the LED on
          }
          if (currentLine.endsWith("GET /L")) {
            //DisplayInternalTemps = 0;                // GET /L turns the LED off
          }
          // Check to see if the client request was "GET /H" or "GET /L":
          if (currentLine.endsWith("GET /DELAY0")) {
            intervalData = 1000;               // GET /H turns the LED on
          }
          if (currentLine.endsWith("GET /DELAY1")) {
            intervalData = 5000;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /DELAY2")) {
            intervalData = 10000;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /DELAY3")) {
            intervalData = 30000;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /NTP")) {
            timeClient.update();                // GET /L turns the LED off
          }
          // Check to see if the client request was GPS related
          if (currentLine.endsWith("GET /GPSON")) {
            if (statusGPS){
              statusGPS = gpsSerial.init();               // Check GPS status
            }
          }
          if (currentLine.endsWith("GET /GPSOFF")) {
            statusGPS = -1;                           // Set GPS status to error, disable
          }
          if (currentLine.endsWith("GET /MODEMINIT")) {
            modem.init();                  // Entire start-up process for GPS session
          }
          // Check to see if the client request was "GET /H" or "GET /L":
          if (currentLine.endsWith("GET /FILEON")) {
            statusSD = logger.init();               // GET /H turns the LED on     
          }
          if (currentLine.endsWith("GET /FILEOFF")) {
            statusSD = -1;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /RAW")) {
            
            client.print(dataString);
          }
        }
      }
      // close the connection:
      client.stop();
    }
  }

  // Check the serial port for user input, single letter codes
  if (Serial.available()){
    
    
    String serialCommand = "";
    int serialData = 0;
    int serialDataSize = Serial.readBytesUntil('\n',serialBuffer, SERIAL_BUFFER);
    serialCommand = String(serialBuffer);
    serialCommand = serialCommand.substring(0,serialDataSize);
    
    if (serialCommand == "d"){
      Serial.print(dataString);
    }
    else if (serialCommand.startsWith("d=")){
      intervalData = serialCommand.substring(2,serialDataSize).toInt();
      Serial.print("New data rate:");
      Serial.println(intervalData);
    }

    //********************************************************************************
    // SD Card commands
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
      updateDelay = serialCommand.substring(7,serialDataSize).toInt();
      Serial.print("New FTP upload rate: ");
      Serial.println(updateDelay);
      logger.fileAddCSV((modem.readClock(0)+": FTP Upload Delay = " + String(updateDelay)),2);
    }
    else if (serialCommand == "a"){
      Serial.print("Simcom 7070G FTP List = ");
      Serial.println(modem.ftpList());
    }
    else if (serialCommand == "u"){
      Serial.print("Simcom 7070G FTP Get = ");
      updateConfig();
      Serial.println(settingsString());
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
    else if (serialCommand == "e"){
      Serial.print("Simcom 7070G Device Echo Off = ");
      Serial.println(modem.echoOff());
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
    else if (serialCommand == "c"){
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
    
    else if (serialCommand == "i"){
      Serial.print("Simcom 7070G IP Address = ");
      Serial.println(modem.readIP());
    }
    else if (serialCommand == "p"){
      Serial.print("Simcom 7070G IP Ping = ");
      Serial.println(modem.readIPPing());
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
    else if (serialCommand == "5"){
      Serial.println("Simcom 7070G Network Deactivated = ");
      Serial.println(modem.disableIP());
    }
    else if (serialCommand == "6"){
      Serial.println("Simcom 7070G Network Activated = ");
      Serial.println(modem.enableIP());
    }
    else if (serialCommand == "7"){
      Serial.println("Simcom 7070G FTP Reset ");
      Serial.println(modem.startFTP());
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
      Serial.println(String(gps.time.hour())+':'+String(gps.time.minute())+':'+String(gps.time.second()));
    }
    
  }

  if (NTPEnabled){
    timeClient.update();
  }
  
  if ((millis()-LastRead) > intervalData){
    
    LastRead = millis();
    int option = (updateDelay != 0);
    if (statusModem){
      dataString = "99/12/31,"+ timeClient.getFormattedTime() + ',';
    }
    else{
      dataString = modem.readClock(0)+',';
    }
    
    dataString += k96.readCSVString();
    dataString += gpsSerial.readResponse();
  
    if(!statusSD){
      statusSD = logger.fileAddCSV(dataString, option);
      fileSizeLimit  = (logger.fileCheckSize() > LOG_MAX_SIZE);
    }
    //FTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTPFTP
    // Update the data file on the FTP server
    if (updateDelay && (millis()-LastDataUpload) > updateDelay){
      File tempFile = logger.fileOpen(1);
      int currentFTP = modem.ftpPut(tempFile,1);
      tempFile.close();
      if (!currentFTP){
        logger.fileAddCSV((modem.readClock(0)+": File append, recent data"),2);
        logger.fileRemove(1);         
        LastDataUpload = millis();
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
      else if (((intervalBackup && (millis()-LastFileUpload) > intervalBackup)) || fileSizeLimit){
        
        File tempFile = logger.fileOpen(0);
        tempFile.seek(lastFTPByteBackup);
        int currentFTP = modem.ftpPut(tempFile,0);
        if (!currentFTP){
          logger.fileAddCSV((modem.readClock(0)+": Backup file updated"),2);
          LastFileUpload = millis();
          statusFTP = 0;
          lastFTPByteBackup = tempFile.size();
          if (fileSizeLimit){
            logger.fileNewName(modem.readClock(1));
            logger.fileAddCSV((modem.readClock(0)+": File size limit. New file"),2);
            lastFTPByteBackup = 0;
          }
        }
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
        modem.powerToggle();
        Serial.println("PowerOFF");
        modem.powerToggle();
        Serial.println("PowerON");
      }
      //POWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWERPOWER
      // If sufficient delay until next modem action, disable network connection
      if (updateDelay >= 45000){
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
 *  intervalData, updateDelay, intervalBackup
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
    return -1;
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
    if (num != updateDelay){
      if (num && num > INTERVAL_FTP_MAX && num < INTERVAL_FTP_MIN) return -2;
      updateDelay = num;
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
 * Puts the system settings in a printable string
 */

 String settingsString(){
  return "intervalData=" + String(intervalData) + ",intervalFTP=" + String(updateDelay) + 
         ",intervalCfg=" + String(intervalCfg) + ",intervalLog=" + String(intervalLog)+ 
         ",intervalBackup=" + String(intervalBackup);
 }
