/* Adafruit Feather Senseair K96 with Modbus Interface

  Written by James D. Jeffers 2022/06/30
  Copyright (c) 2022 Jeffers Emerging Technologies, LLC.  All right reserved.

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
#include "ClockTime.h"
#include "SimModem.h"
#include "GPSSerial.h"
#include "DataLogger.h"

String dataString = "";

int LoopDelay = 5000;
int LastRead = 0;

SimModem modem;
k96Modbus k96;
GPSSerial gps;
bool GPSEnabled = false;
DataLogger logger;
int SDStatus = -1;

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);
  Serial.println("Access Point Web Server");

  // print the network name (SSID);
  Serial.print("Creating access point named: ");
  Serial.println(ssid);

  // Create open network. Change this line if you want to create an WEP network:
  airliftInit();
  
  // wait 8 seconds for connection:
  delay(8000);

  // you're connected now, so print out the status
  printWifiStatus();
  Clock_init();
  
  /* Initialise the sensor */
  k96.init();
  gps.init();
  
  // Device 3: Modem
  // Can provide internet access and GPS
  Serial.print("Initializing Simcom 7070G Modem...");
  if (!modem.init()){
    Serial.println(" completed.");
  }
  else{
    Serial.println(" failed.");
  }

  // Device 4: SD card, disable if using Feather WiFi
  SDStatus = startSD();
}


void loop() {
  // compare the previous status to the current status
  if (status != WiFi.status()) {
    // it has changed update the variable
    Serial.println("Test");
    status = WiFi.status();

    if (status == WL_AP_CONNECTED) {
      
      // a device has connected to the AP
      Serial.print("Device connected to AP, MAC address: ");
    } else {
      // a device has disconnected from the AP, and we are back in listening mode
      Serial.println("Device disconnected from AP");
    }
  }
  //WiFiClient client = 0;
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
            client.print(gps.lat());
            client.print("<br>Longitude = ");
            client.print(gps.lng());
            client.print("<br>Time = ");
            client.print(gps.time());

            client.print("<br><br>Sim Modem <a href=\"/MODEMINIT\">ON</a> ");
            client.print("Click <a href=\"/MODEMOFF\">OFF</a><br>");
            
            client.print("<br><br>SD Card datalogger.txt Click <a href=\"/FILEON\">ON</a> ");
            client.print("Click <a href=\"/FILEOFF\">OFF</a><br>");

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
          GPSEnabled = true;               // GET /H turns the LED on
        }
        if (currentLine.endsWith("GET /GPSOFF")) {
          GPSEnabled = false;                // GET /L turns the LED off
        }
        if (currentLine.endsWith("GET /MODEMINIT")) {
          modem.init();                  // Entire start-up process for GPS session
        }
        // Check to see if the client request was "GET /H" or "GET /L":
        if (currentLine.endsWith("GET /FILEON")) {
          SDStatus = startSD();               // GET /H turns the LED on     
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

  if (Serial.available()){
    
    char serial_data = Serial.read();
    if (serial_data == 'd'){
      Serial.print(dataString);
    }
    else if (serial_data == 'f'){
      //logger.fileDump();
    }
    else if (serial_data == 'r'){
      logger.fileRemove();
    }
    else if (serial_data == 'a'){
      Serial.print("Simcom 7070G Device ID = ");
      Serial.println(modem.readVerify());
    }
    else if (serial_data == 'e'){
      Serial.print("Simcom 7070G Device Echo Off = ");
      Serial.println(modem.echoOff());
    }
    else if (serial_data == 'b'){
      Serial.println("Simcom 7070G Network Activated = ");
      Serial.println(modem.enableIP());
    }
    else if (serial_data == 't'){
      Serial.println("Serial Command = t");
      modem.powerToggle();

    }
    else if (serial_data == 'g'){
      Serial.print("Simcom 7070G 4G Signal = ");
      Serial.println(modem.readSignal());      
    }
    else if (serial_data == 'h'){
      Serial.print("Simcom 7070G RF Config = ");
      Serial.println(modem.readRFCfg());      
    }
    else if (serial_data == 'c'){
      Serial.print("Simcom 7070G Clock = ");
      Serial.println(modem.readClock());
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
   
  }

  if (NTPEnabled){
    timeClient.update();
  }
  
  if ((millis()-LastRead) > LoopDelay){
    Serial.println(timeClient.getFormattedTime());
    LastRead = millis();
    dataString = "";
    dataString += k96.readCSVString();
    dataString += gps.readResponse();

    if(GPSEnabled) GPSEnabled = modem.readGPS();

    dataString = timeClient.getFormattedTime()+','+dataString;
    if(SDStatus) SDStatus = logger.fileAddCSV(dataString);
  
  }  
}

void printWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
  // print where to go in a browser:
  Serial.print("To see this page in action, open a browser to http://");
  Serial.println(ip);

}

int startSD(){
  // Device 4: SD card
  // Two options: Feather and Wing set in heeader file
  Serial.print("Initializing SD card...");
  if (!logger.init()){
    Serial.print(" completed");
    return 0;
  }
  else{
    Serial.println("Card failed, or not present");
    return -11;
  }
}
