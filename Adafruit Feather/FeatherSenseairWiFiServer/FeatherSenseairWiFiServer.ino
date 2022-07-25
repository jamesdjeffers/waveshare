/* Adafruit Feather Senseair K96 with Modbus Interface

  Written by James D. Jeffers 2022/06/30
  Copyright (c) 2022 University of Oklahoma.  All right reserved.

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

#include "k96Modbus.h"
#include "Airlift.h"
#include "SimModem.h"
#include "DataLogger.h"
#include "GPSSerial.h"

#include <TinyGPS++.h>

#include <NTPClient.h>
#include <WiFiUdp.h>

String dataString = "";

int LoopDelay = 30000;
int LastRead = 0;
int fileDelay = 900000;
int LastFileUpload = 0;
int updateDelay = 180000;
int LastDataUpload = 0;

int statusWifi = -1;
SimModem modem;
int modemStatus = -1;
k96Modbus k96;
int GPSStatus = -1;
DataLogger logger;
int SDStatus = -1;
bool fileSizeLimit = false;
GPSSerial gpsSerial;

// GPS string conversion object
TinyGPSPlus gps;

// Time stamp updates
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP,"pool.ntp.org", 36000, 60000);
bool NTPEnabled = false;

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(115200);

  // Device 1: SD card, disable if using Feather WiFi (set status = -1)
  SDStatus = logger.init();
  
  // Device 2: Modem
  modemStatus = modem.init();

  // Optional internal clock if modem is not present
  if (modemStatus){
    timeClient.begin();
    if (!SDStatus) logger.fileAddCSV("Modem not present",2);
  }
  else{
    if (!SDStatus){
      logger.fileAddCSV((modem.readClock(0)+": modem initialized"),2);
    }
  }

  // Create open network. Change this line if you want to create an WEP network:
  statusWifi = airliftInit();
  if (!statusWifi){
    if (!SDStatus) logger.fileAddCSV((modem.readClock(0)+": WiFi server created"),2);
  }
  else{
    if (!SDStatus) logger.fileAddCSV((modem.readClock(0)+": WiFi not present"),2);
  }
    
  /* Initialise the sensor */
  k96.init();
  // Device 3: GPS sensor
  GPSStatus = gpsSerial.init();
  if (!GPSStatus){
    logger.fileAddCSV((modem.readClock(0)+": GPS sensor initialized"),2);
  }

  if (!SDStatus){
    logger.fileNewName(modem.readClock(1));
    logger.fileRemove(1);
    logger.fileAddCSV((modem.readClock(0)+": Data acquisition file = " + logger.fileNameString()),2);
  }

}

/*
 *  Main program loop
 *  1. Check if WiFi client and serve web page
 *  2. Check serial port and handle I/O
 *  3. Loop timing, read sensor data
 *  4. Loop timing, Update timing, upload data
 *  5. Loop timing, file timing, upload data
 */

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
              client.print(LoopDelay/1000);
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
              client.print("<br><br>Simcom Mode Ping: ");
              client.print(modem.readIPPing());
  
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
            LoopDelay = 1000;               // GET /H turns the LED on
          }
          if (currentLine.endsWith("GET /DELAY1")) {
            LoopDelay = 5000;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /DELAY2")) {
            LoopDelay = 10000;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /DELAY3")) {
            LoopDelay = 30000;                // GET /L turns the LED off
          }
          if (currentLine.endsWith("GET /NTP")) {
            timeClient.update();                // GET /L turns the LED off
          }
          // Check to see if the client request was GPS related
          if (currentLine.endsWith("GET /GPSON")) {
            if (GPSStatus){
              GPSStatus = gps.init();               // Check GPS status
            }
          }
          if (currentLine.endsWith("GET /GPSOFF")) {
            GPSStatus = -1;                           // Set GPS status to error, disable
          }
          if (currentLine.endsWith("GET /MODEMINIT")) {
            modem.init();                  // Entire start-up process for GPS session
          }
          // Check to see if the client request was "GET /H" or "GET /L":
          if (currentLine.endsWith("GET /FILEON")) {
            SDStatus = logger.init();               // GET /H turns the LED on     
          }
          if (currentLine.endsWith("GET /FILEOFF")) {
            SDStatus = -1;                // GET /L turns the LED off
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
    
    char serial_data = Serial.read();
    if (serial_data == 'd'){
      Serial.print(dataString);
    }
    else if (serial_data == 'f'){
      logger.fileDump(0);
    }
    else if (serial_data == 'F'){
      logger.fileDump(2);
    }
    else if (serial_data == 'r'){
      logger.fileRemove(1);
    }
    else if (serial_data == 'a'){
      Serial.print("Simcom 7070G FTP List = ");
      Serial.println(modem.ftpList());
    }
    else if (serial_data == 'u'){
      Serial.print("Simcom 7070G FTP Get = ");
      updateConfig();
    }
    else if (serial_data == 's'){
      Serial.print("Simcom 7070G FTP Put File= ");
      File tempFile = logger.fileOpen(0);
      Serial.println(modem.ftpPut(tempFile));
      tempFile.close();
    }
    else if (serial_data == 'S'){
      Serial.print("Simcom 7070G FTP Put Append Data= ");
      Serial.println(modem.ftpPut(dataString));
    }
    else if (serial_data == 'e'){
      Serial.print("Simcom 7070G Device Echo Off = ");
      Serial.println(modem.echoOff());
    }
    
    else if (serial_data == 't'){
      Serial.println("Serial Command = t");
      modem.powerToggle();

    }
    else if (serial_data == 'q'){
      Serial.print("Simcom 7070G 4G Signal = ");
      Serial.println(modem.readSignal());      
    }
    else if (serial_data == 'g'){
      Serial.print("Simcom 7070G GPS Signal = ");
      Serial.println(modem.readGPS());      
    }
    else if (serial_data == 'h'){
      Serial.print("Simcom 7070G RF Config = ");
      Serial.println(modem.readRFCfg());      
    }
    else if (serial_data == 'c'){
      Serial.print("Simcom 7070G Date and Time = ");
      Serial.println(modem.readClock(0));
    }
    else if (serial_data == 'C'){
      Serial.print("Simcom 7070G NTP Server = ");
      Serial.println(modem.readClock(0));
    }
    else if (serial_data == 'z'){
      Serial.print("Simcom 7070G Reset ");
      Serial.println(modem.init());
    }
    else if (serial_data == 'o'){
      Serial.print("Simcom 7070G Power On ");
      Serial.println(modem.powerOn());
    }
    else if (serial_data == 'v'){
      Serial.print("Simcom 7070G NTP = ");
      Serial.println(modem.readClockID());
    }
    else if (serial_data == 'i'){
      Serial.print("Simcom 7070G IP Address = ");
      Serial.println(modem.readIP());
    }
    else if (serial_data == 'p'){
      Serial.print("Simcom 7070G IP Ping = ");
      Serial.println(modem.readIPPing());
    }
    else if (serial_data == 'w'){
      //gps.encode(modem.readGPS());
      Serial.print("GPS Serial Time = ");
      Serial.println(String(gps.time.hour())+':'+String(gps.time.minute())+':'+String(gps.time.second()));
    }
    else if (serial_data == '1'){
      Serial.print("Simcom 7070G Disabled = ");
      Serial.println(modem.GPSOff());
    }
    else if (serial_data == '2'){
      Serial.print("Simcom 7070G Enabled = ");
      Serial.println(modem.GPSOn());
    }
    else if (serial_data == '3'){
      Serial.print("Simcom 7070G Disabled = ");
      Serial.println(modem.RFOff());
    }
    else if (serial_data == '4'){
      Serial.print("Simcom 7070G Enabled = ");
      Serial.println(modem.RFOn());
    }
    else if (serial_data == '5'){
      Serial.println("Simcom 7070G Network Deactivated = ");
      Serial.println(modem.disableIP());
    }
    else if (serial_data == '6'){
      Serial.println("Simcom 7070G Network Activated = ");
      Serial.println(modem.enableIP());
    }
    else if (serial_data == '7'){
      Serial.println("Simcom 7070G FTP Reset ");
      Serial.println(modem.startFTP());
    }
    else if (serial_data == 'j'){
      Serial.println("Simcom 7070G SD Card Directory ");
      File root;
      root = SD.open("/");
      logger.fileDir(root,4);
      root.close();
    }
    else if (serial_data == '!'){
      Serial.println("Simcom 7070G SD Card Delete All ");
      logger.fileRemoveAll();
    }
    else if (serial_data == 'n'){
      Serial.print("Simcom 7070G Enabled = ");
      modem.GPSOff();
      modem.powerToggle();
      delay(1000);
      modem.startSession();
      modem.startFTP();
      delay(30000);
      
      Serial.println(modem.readIPPing());
      File tempFile = logger.fileOpen(0);
      modem.ftpPut(tempFile);
      tempFile.close();
    }
   
  }

  if (NTPEnabled){
    timeClient.update();
  }
  
  if ((millis()-LastRead) > LoopDelay){
    
    LastRead = millis();
    dataString = "";
    int option = (updateDelay != 0);
    logger.fileAddCSV((modem.readClock(0)+ ": reading sensor"),2);
    dataString += k96.readCSVString();
    
    //if(GPSStatus) dataString += modem.readGPS();
    dataString += gpsSerial.readResponse();

    if (modemStatus){
      dataString = timeClient.getFormattedTime()+','+dataString;
    }
    else{
      dataString = modem.readClock(0)+','+ dataString;
    }
    
    if(!SDStatus){
      SDStatus = logger.fileAddCSV(dataString, option);
      fileSizeLimit  = (logger.fileCheckSize() > LOG_MAX_SIZE);
    }
    
    if (((millis()-LastFileUpload) > fileDelay) || fileSizeLimit){
      LastFileUpload = millis();
      File tempFile = logger.fileOpen(0);
      modem.ftpPut(tempFile);
      int fileSize = tempFile.size();
      tempFile.close();
      logger.fileAddCSV((modem.readClock(0)+": File upload"),2);
      if (fileSizeLimit){
        logger.fileNewName(modem.readClock(1));
        logger.fileAddCSV((modem.readClock(0)+": File size limit. New file"),2);
      }
    }
    else{
      if (updateDelay && (millis()-LastDataUpload) > updateDelay){
        LastDataUpload = millis();
        File tempFile = logger.fileOpen(1);
        modem.ftpPut(tempFile);
        tempFile.close();
        logger.fileAddCSV((modem.readClock(0)+": File upload"),2);
        logger.fileRemove(1);
      }
      else{
        //updateConfig();
      }
    }
  }    
}

/*  updateConfig()
 * 
 *  Uses the modems FTP Get function to download a file: "config.json"
 *  Currently searches for tags for three variables
 *  LoopDelay, updateDelay, fileDelay
 *  
 *  Error: if file is not found, or tag is not present setting is not updated 
 */

int updateConfig(){

  String json;
  String result;
  int found;
  json = modem.ftpGet();
  found = json.indexOf("LoopDelay =");
  if (found >= 0){
     String result = json.substring(found+12,json.indexOf(";",found+12));
     LoopDelay = result.toInt();
  }
  found = json.indexOf("updateDelay =");
  if (found >= 0){
    String result = json.substring(found+14,json.indexOf(";",found+14));
    updateDelay = result.toInt();
  }
  found = json.indexOf("fileDelay =");
  if (found >= 0){
    String result = json.substring(found+12,json.indexOf(";",found+12));
    fileDelay = result.toInt();
    return 0;
  }
  return 1;
}
