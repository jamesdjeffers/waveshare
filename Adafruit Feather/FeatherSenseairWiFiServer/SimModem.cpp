/*
  SimModem.cpp - Library for sending AT+ commans to the Simcom7070G modem
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

#include "SimModem.h"

Uart SimModemSerial (&sercom3, modemRX, modemTX, SERCOM_RX_PAD_1, UART_TX_PAD_0);
void SERCOM3_Handler()
{
  SimModemSerial.IrqHandler();
}

// Constructor
SimModem::SimModem()
{
}

/*
 *  initialization function for internal hardware and device operation
 *  Sets the serial port parameters
 *  Start or join active network connection
 *  Check the power status of device
 *  Check network status
 *  Configure NTP server
 *  Set internal clock
 *  Configure FTP
 */
int SimModem::init()
{
  
  SimModemSerial.begin(modemBaud);
  SimModemSerial.setTimeout(modemTimeout);
  pinPeripheral(modemRX, PIO_SERCOM); //Assign RX function to pin 11
  pinPeripheral(modemTX, PIO_SERCOM); //Assign TX function to pin 10
  pinMode(MODEM_POWER,OUTPUT);
  digitalWrite(MODEM_POWER,LOW);
  delay(1000);
  
  // Enable the modem (do not cycle the power if not needed)
  if (!startSession()){
    // startFTP();
    return 0;
  }
  return -1;
}


// Empty string indicates communication error
// The word error indicates a programming error
String SimModem::readResponse(String command, int waitTime){
  SimModemSerial.flush();
  SimModemSerial.println(command);
  if (waitTime){
    SimModemSerial.setTimeout(waitTime);
  }
  else {
    SimModemSerial.setTimeout(modemTimeout);
  }
  int bufferLength = SimModemSerial.readBytes(buffer, 256);
  if (bufferLength){
    String responseString = String(buffer);
    responseString.trim();
    if (responseString.endsWith("OK")){
      if (bufferLength == 6){
        return "OK";
      }
      else{
        return responseString.substring(0,bufferLength-2);
      }
    }
//    else if (responseString.startsWith("Error")){
//      return "Error";
//    }
    else {
      return responseString.substring(0,responseString.indexOf('\n',1));
    }
  }
  else{
    return "";   // Timeout occurred
  }
  return "";
}

/* Empty string indicates communication error
 * The word error indicates a programming error
 */
String SimModem::readWaitResponse(String command, int waitTime, String back){
  
  String responseString = "";
  String bytesReady = "";
  
  SimModemSerial.flush();
  SimModemSerial.println(command);

  if (waitTime){    SimModemSerial.setTimeout(waitTime);  }
  else {            SimModemSerial.setTimeout(modemTimeout);  }

  int bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
  while (bufferLength > 0){
    bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
    responseString = String(buffer);
    responseString = responseString.substring(0,bufferLength);
    int backIndex = responseString.indexOf(back);

    if (backIndex >= 0){
      return responseString.substring(backIndex+back.length(),responseString.indexOf('\n',backIndex));
    }
    else if (responseString.indexOf("ERROR") >= 0){
      return "ERROR";
    }
  }
  return "";   // Timeout occurred
}

/* Empty string indicates communication error
 * The word error indicates a programming error
 */
String SimModem::readBurst(String command, int waitTime, String back){
   String responseString = "";
   int bytesToRead = 0;
  
  //SimModemSerial.flush();
  SimModemSerial.println(command);

  if (waitTime){    SimModemSerial.setTimeout(waitTime);  }
  else {            SimModemSerial.setTimeout(modemTimeout);  }

  int bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
  while (bufferLength > 0){
    bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
    responseString = String(buffer);
    responseString = responseString.substring(0,bufferLength);
    int backIndex = responseString.indexOf(back);
    if (backIndex >= 0){
      responseString = responseString.substring(backIndex+back.length(),responseString.indexOf('\n',backIndex));
      bytesToRead = responseString.substring(responseString.indexOf(',')+1).toInt();
      if (bytesToRead){
        break; 
      }
    }
  }
  
  if (bytesToRead){
    
      SimModemSerial.readBytes(buffer, bytesToRead);
      responseString = String(buffer);
      bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
      bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
      return responseString.substring(0,bytesToRead);
    }
    else{
      bufferLength = SimModemSerial.readBytesUntil('\n',buffer, MODEM_BUFFER);
      return "";   // Timeout occurred
    }

  
  return "";
}

/*  "powerToggle" the Modem using digital trigger
 *  
 *  Modem power pin toggles operation MUST check if device is active.
 *  Use the ATE_OFF string to enforce interface conditions
 */

void SimModem:: powerToggle(){
  digitalWrite(MODEM_POWER, LOW);     // Value should be low already    
  digitalWrite(MODEM_POWER, HIGH);    // Start of "ON" pulse
  delay(1500);                        // Datasheet Ton mintues = 1.2S
  digitalWrite(MODEM_POWER, LOW);     // Return output state to low
}

/*  "powerOn" the Modem using digital trigger
 *  
 *  Modem power pin toggles operation MUST check if device is active.
 *  Use the ATE_OFF string to enforce interface conditions
 */
int SimModem::powerOn(){
  
  if (status >= -1){
    // Check if device is on by disabling echo mode
    SimModemSerial.flush();
    String responseString = readResponse(ATE_OFF,0);
    if(responseString != ""){
      return 0;
    }
  }
  
  // Device is not in reset, toggle IO pin and start timer
  else{
    status = -2;
    powerToggle();
  }
  return 0;   // Operation occured normally
}

/*  "startSession" of the Modem internet conncection
 * 
 *  Can be used as network status check, returns 0
 *  
 *  Check if network connected (CGATT: 1)
 *  Check if network active
 *  Disables RF functionality to setup network config.
 *  No outputs currently.
 */
int SimModem::startSession(){

  checkStatus();
  if (status < -1){
    return -1;
  }
  
  String networkStatus = readWaitResponse(AT_CGATT,0,"CGATT:");
  if (networkStatus.indexOf("1") < 0){
    // Enable the modem (do not cycle the power)
    if(powerOn()){
      status = -1;
      return -1;
    }
    // From Simcom Application Note EXCEPT using PDP 1
    // readWaitResponse(AT_RF_OFF,0, "CPIN:");
    // readResponse(AT_RF_NET,0);
    // readResponse(AT_RF_BAND,0);
    // readResponse(AT_RF_ID,0);
    // readResponse(AT_RF_CFG,0);
    // readResponse(AT_RF_ON,0);
    // delay(1000);
    if (enableIP() >= 0){
      startNTP();
      startFTP();
    }
    
  }
  else{
    if (enableIP() >= 0){
      startNTP();
      startFTP();
    }
  }
  return 0;
}

/*  "startSession" of the Modem internet conncection
 * 
 *  Disables RF functionality to setup network config.
 *  No outputs currently.
 */
int SimModem::startNTP(){
  readResponse(AT_NTP_ID,0);
  readResponse(AT_NTP_SET,0);
  readWaitResponse(AT_NTP_UP,0,"CNTP:");
  return 0;
}

/*  "startSession" of the Modem internet conncection
 * 
 *  Disables RF functionality to setup network config.
 *  No outputs currently.
 */
int SimModem::startFTP(){
  
  String responseString;
  // From Simcom Application Note EXCEPT using PDP 1
  responseString = readResponse(AT_FTP_EXT,100);
  Serial.println(responseString);
  delay(100);
  responseString = readResponse(AT_FTP_CID,100);
  Serial.println(responseString);
  delay(100);
  responseString = readResponse(AT_FTP_SRV,100);
  Serial.println(responseString);
  delay(100);
  responseString = readResponse(AT_FTP_UN,100);
  Serial.println(responseString);
  delay(100);
  responseString = readResponse(AT_FTP_PWD,100);
  Serial.println(responseString);
  delay(100);
  responseString = readResponse(AT_FTP_PRT,100);
  Serial.println(responseString);
  delay(100);

  readResponse(AT_FTP_GET_NAM,0);
  readResponse(AT_FTP_GET_PTH,0);

  readResponse(AT_FTP_PUT_PTH,0);

  return 0;
}

/*
 * Read GPS string
 * No formatting
 * Return NEMA string
 */
String SimModem::readGPS(){
  String gpsResponse = readResponse(AT_GPS_RD,0);
  return gpsResponse.substring(gpsResponse.indexOf(':',1)+1,gpsResponse.indexOf("\n"));
}

String SimModem::readSignal(){
  return readResponse(AT_CSQ,0);
}
String SimModem::readVerify(){
  return readResponse(ATI,0);
}

/*
 * Time string is in quotes if available
 * Date occurs before comma ","
 * Date format is YY/MM/DD
 */
String SimModem::readClock(int format){
  String dateTimeResponse = readWaitResponse(AT_TIME,0,"CCLK:");
  if (dateTimeResponse == "test"){
    powerOn();
    enableIP();
    dateTimeResponse = readWaitResponse(AT_TIME,0,"CCLK:");
    if (dateTimeResponse == ""){
      return "Clock, Error";
    }
  }
  else if (dateTimeResponse == "ERROR"){
    return "ERROR";
  }
  int startIndex = dateTimeResponse.indexOf("\"");
  int endIndex = dateTimeResponse.indexOf("\"",startIndex+1);
  if (!format){
    return dateTimeResponse.substring(startIndex+1, dateTimeResponse.indexOf("-",startIndex));
  }
  else{
    dateTimeResponse = dateTimeResponse.substring(startIndex+1, dateTimeResponse.indexOf(",",startIndex));
    dateTimeResponse.replace("/","");
    return dateTimeResponse;
  }
}

/*
 * Response is 4 channels
 */
String SimModem::readIP(){
  String ipResponse = readResponse(AT_NET_ACT,0);
  int ipAddressIndex = ipResponse.indexOf(",");
  return ("IP Address = " + ipResponse);
}

/*
 * Response is channel of NTP data channel
 */
String SimModem::readClockID(){
  //return readResponse(AT_NTP_ID,0);
  return readResponse(AT_FTP_TYP,0);
}
/*
 * Response is channel of NTP data channel
 */
String SimModem::readRFCfg(){
  return readResponse(AT_RF_CFGQ,0);
}
/*
 * Response is channel of NTP data channel
 */
String SimModem::readIPPing(){
  String pingResponse = readResponse(AT_IP_PING,3000);
  int ipAddressIndex = pingResponse.indexOf(",");  
  ipAddressIndex = pingResponse.indexOf(",", ipAddressIndex+1);
  int pingTimeIndex = pingResponse.indexOf(",",ipAddressIndex);
  return ("IP Address: " + pingResponse.substring(ipAddressIndex, pingTimeIndex)
          + " Response Time = " + pingResponse.substring(pingTimeIndex, pingResponse.length()));
  
}

/*
 * Turn off the command echo function
 */
 
int SimModem::enableIP(){
  for (int i = 0; i<5; i++){
    String string = readWaitResponse(AT_NET_1ON,2000,"PDP:");
    
    if (string.indexOf("Active") >= 0){
      return 0;
    }
    else if (string.indexOf("ERROR") >= 0){
      return 1;
    }
    delay(5000);
  }
  return -1;
}

/*
 * Turn off the command echo function
 */
String SimModem::echoOff(){
  return readResponse(ATE_OFF,0);
}

/*
 * FTP directory read operation
 */
String SimModem::ftpList(){

  String responseString;
  // Check if the modem has internet connection
  if (true){
    Serial.println("Configuring FTP");
    //startFTP();
    Serial.println("Requesting FTP list");
    responseString = readWaitResponse(AT_FTP_LST,5000,"FTPLIST:");

    if (responseString.indexOf("1,1") >= 0){
      Serial.println("Reading FTP list");
      Serial.println(readBurst(AT_FTP_LRD,1000,"FTPLIST:"));
    }
    Serial.println(responseString);
    readWaitResponse(AT_FTP_EXT,3000,"FTPLIST: 1,80");
    return "Done";
  }
   
  return "No Network";
}

/*
 * File read operation for small files
 */
String SimModem::ftpGet(){
  
  String responseString = readWaitResponse(AT_FTP_GET,5000,"FTPGET:");
  if (responseString.indexOf("1,1") < 0){
    int modem = startSession();
    if (modem < 0){
      return "ERROR_62";
    }
    startFTP();
    responseString = readWaitResponse(AT_FTP_GET,5000,"FTPGET:");
  }
  if (responseString.indexOf("1,1") >= 0){
    String file = readBurst(AT_FTP_GRD,5000,"FTPGET:");
    readWaitResponse(AT_FTP_EXT,1000,"FTPGET: 1,80");
    return file;
  }
  else return "";
}
/*********************************************************************
 *  PUT operation for small files
 *  
 *  Input: dataFile (position may not be at start of file)
 *  Input: option (selects upload file name)
 *  
 *  Determines size of data to upload (from current file postion to end)
 *  Determines number of transfers at largest transfer size of 1360
 *  Determines size of last transfer less than maximum
 *  
 *  Output: 0 = successful transfer, received OK
 */
int SimModem::ftpPut(File dataFile, int option){
  
  // Check that modem is present, powered on, connected to network
  int modem = startSession();
  if(modem < 0){
    return -62;
  }
  startFTP();
  
  String responseString;
  char temp;
  int dataSize = dataFile.size() - dataFile.position();
  int numPuts = dataSize / 1360;
  int lastPutSize = dataSize % 1360;
  String lastPutString = AT_FTP_PWR + String(lastPutSize);
  String imei = readResponse(AT_GSN,0);
  imei = imei.substring(0,(imei.length()-1)) + "_";
  String putFileName;

  if (option == 0){
    putFileName = AT_FTP_PUT_NM1 + String("\"") + imei + dataFile.name() + String("\"");
    readResponse(AT_FTP_PUT_APP,0);
  }
  else if (option == 1){
    putFileName = AT_FTP_PUT_NM1 + String("\"") + imei + dataFile.name() + String("\"");
    readResponse(AT_FTP_PUT_APP,0);
  }
  else if (option == 2){
    putFileName = AT_FTP_PUT_NM1 + String("\"") + imei + "log.txt" + String("\"");
    readResponse(AT_FTP_PUT_APP,0);
  }
  readResponse(putFileName,0);
  
  responseString = readWaitResponse(AT_FTP_PUT,3000,"FTPPUT:");  

  if (responseString.indexOf("1,1") >= 0){
    for (int i = 0; i < numPuts; i++){
    
      readWaitResponse(AT_FTP_PWX,3000,"FTPPUT:");
      for (int j = 0; j < 1361; j++){
        temp = dataFile.read();
        SimModemSerial.print(temp);
      }    
      delay(100);
      SimModemSerial.readBytesUntil(':',buffer, MODEM_BUFFER);
      SimModemSerial.flush();
    }
    if (lastPutSize){
      readWaitResponse(lastPutString,3000,"FTPPUT:");
      for (int j = 0; j < lastPutSize; j++){
        temp = dataFile.read();
        SimModemSerial.print(temp);
      }
      SimModemSerial.readBytesUntil(':',buffer, MODEM_BUFFER);
      SimModemSerial.flush();
    }
    responseString = readWaitResponse(AT_FTP_PDN,0,"OK");
    //readResponse(AT_FTP_EXT,0);
    if (responseString){
      return 0;
    }
  }  
  return -1;
}

/*
 *  Attach a string to an existing file
 */

String SimModem::ftpPut(String dataString){
  char temp;
  int dataSize = dataString.length()+1;
  String putString = AT_FTP_PWR + String(dataSize);
  readResponse(AT_FTP_PUT_APP,0);
  
  readWaitResponse(AT_FTP_PUT,3000,"FTPPUT:");
  readWaitResponse(putString,3000,"FTPPUT:");
    
  for (int i = 0; i < dataSize; i++){
      temp = dataString[i];
      SimModemSerial.print(temp);
  }
  SimModemSerial.print('\n');
  SimModemSerial.readBytesUntil(':',buffer, MODEM_BUFFER);
  SimModemSerial.flush();
  
  readWaitResponse(AT_FTP_PDN,0,"OK");
  readWaitResponse(AT_FTP_EXT,0,"FTPPUT: 1,80");
  return "Done";
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::GPSOn(){
  return readResponse(AT_GPS_PWR,0);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::GPSOff(){
  return readResponse(AT_GPS_OFF,0);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::RFOn(){
  return readResponse(AT_RF_ON,0);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::RFOff(){
  return readResponse(AT_RF_OFF,0);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::disableIP(){
  return readResponse(AT_NET_1OF,0);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::ftpCID(){
  return readResponse(AT_FTP_CID,100);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::ftpUsername(){
  return readResponse(AT_FTP_UN,100);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::ftpPwd(){
  return readResponse(AT_FTP_PWD,100);
}

/*
 * GPS Enabled
 * Simcom 7070G cannot operate GPS and modem at same time
 */
String SimModem::ftpServer(){
  return readResponse(AT_FTP_SRV,100);
}

int SimModem::checkStatus(){
  if (status <= -3){
    if ((millis() - timer) > 10000){
      status = -1;
      return -2;
    }
    else{
      return -3;
    }
  }
  else if (status == -2){
    if ((millis() - timer) > 35000){
      String responseString = readResponse(ATE_OFF,0);
      if (responseString != "") {
        status = 0;
        return 0;
      }
      return -1;
    }
    return -2;
  }
  else {
    return (int)status;
  }
}
