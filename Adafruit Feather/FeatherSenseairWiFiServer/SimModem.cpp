/*
  SimModem.cpp - Library for sending AT+ commans to the Simcom7070G modem
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

#include "SimModem.h"

const char command_0[] = "AT";
const char command_1[] = "AT+CPSI?";
const char command_2[] = "AT+CGNSPWR=1";
const char command_3[] = "AT+CGNSINF";

Uart SimModemSerial (&sercom3, modemRX, modemTX, SERCOM_RX_PAD_1, UART_TX_PAD_0);
void SERCOM3_Handler()
{
  SimModemSerial.IrqHandler();
}

SimModem::SimModem()
{
}

int SimModem::init()
{
  
  SimModemSerial.begin(modemBaud);
  SimModemSerial.setTimeout(modemTimeout);
  pinPeripheral(modemRX, PIO_SERCOM); //Assign RX function to pin 11
  pinPeripheral(modemTX, PIO_SERCOM); //Assign TX function to pin 10
  pinMode(6,OUTPUT);
  digitalWrite(6,LOW);
  delay(1000);
  
  // Enable the modem (do not cycle the power)
  if(SimModem::powerOn()){
    SimModemEnabled = false;
    return -1;
  }
  // From Simcom Application Note EXCEPT using PDP 1
  readResponse(AT_RF_OFF);
  readResponse(AT_RF_NET);
  readResponse(AT_RF_BAND);
  readResponse(AT_RF_ID);
  readResponse(AT_RF_CFG);
  readResponse(AT_RF_ON);
  delay(3000);
  readResponse(AT_NET_0ON);
  Serial.println(readResponse(AT_NET_ACT));
  readResponse(AT_NET_1ON);
  
  Serial.println(readResponse(AT_NTP_ID));
  readResponse(AT_NTP_SET);
  readResponse(AT_NTP_UP);
  return 0;
}


// Empty string indicates communication error
// The word error indicates a programming error
String SimModem::readResponse(String command){
  SimModemSerial.println(command);
  delay(1000);
  SimModemBufferIndex = SimModemSerial.readBytes(SimModemBuffer, 256);
  
  if (SimModemBufferIndex){
    String responseString = String(SimModemBuffer);
    if (responseString.endsWith("OK")){
      return "OK";
    }
    else if (responseString.startsWith("Error")){
      return "Error";
    }
    else {
      return responseString.substring(0,responseString.indexOf('\n',5));
    }
  }
  else{
    Serial.println("Timeout");
    return "";   // Timeout occurred
  }
  return "";
}

void SimModem::powerToggle(){
  digitalWrite(6,HIGH);
  delay(2000);
  digitalWrite(6,LOW);
  delay(2000);
}

int SimModem::powerOn(){
  // Check if device is on by disabling echo mode
  String responseString = readResponse(ATE_OFF);
  Serial.print(responseString);
  if(responseString.equals("OK") || responseString.equals("ATE0")){
    return 0;
  }
  else{
    Serial.println("Power");
    SimModem::powerToggle();
    delay(3000);
    
    Serial.println(readResponse(ATE_OFF));
    Serial.println(readResponse(ATE_OFF));
    Serial.println(readResponse(ATE_OFF));
    if(readResponse(ATE_OFF).equals("OK") || responseString.equals("ATE0")){
      return 0;
      Serial.println("WOrking");
    }
    else{
      return -1;
    }
  }
  return 0;   // Operation occured normally
}

String SimModem::readGPS(){
  return readResponse(command_3);
}

String SimModem::readSignal(){
  return readResponse(AT_CSQ);
}
String SimModem::readVerify(){
  return readResponse(ATI);
}
String SimModem::readClock(){
  //readResponse(AT_NTP_UP);
  return readResponse(AT_TIME);
}
String SimModem::readIP(){
  return readResponse(AT_NET_ACT);
}
String SimModem::readClockID(){
  return readResponse(AT_NTP_ID);
  readResponse(AT_NTP_SET);
  
  readResponse(AT_NTP_UP);
}
String SimModem::readRFCfg(){
  return readResponse(AT_RF_CFGQ);
}
String SimModem::readIPPing(){
  return readResponse(AT_IP_PING);
}
String SimModem::enableIP(){
  return readResponse(AT_NET_1ON);
}
String SimModem::echoOff(){
  return readResponse(ATE_OFF);
}
