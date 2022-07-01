/*
  SimModem.h - Library for sending AT+ commans to the Simcom7070G modem
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

#ifndef SimModem_h
#define SimModem_h

#define modemRX 21
#define modemTX 20
#define modemBaud 9600
#define modemTimeout 200

#define ATI        "ATI"                            // Device info, query purposes
#define ATE_OFF    "ATE0"                           // Turns off echo mode
#define AT_CSQ     "AT+CSQ"                         // 4G-LTE signal strength

#define AT_RF_ON   "AT+CFUNC=1"
#define AT_RF_OFF  "AT+CFUNC=0"
#define AT_RF_BAND "AT+CBANDCFG=\"CAT-M\",2,4,12"   // AT&T USA IOT bands
#define AT_RF_ID   "AT+COPS=0,2,\"310410\""         // AT&T Carrier ID

#define AT_RF_CFG  "AT+CNCFG=0,2,attiotdemo"
#define AT_RF_CFGQ "AT+CNCFG?"
#define AT_RF_NET  "AT+CGDCONT=1,\"IPV4V6\",\"attiotdemo\""

#define AT_NET_ACT "AT+CNACT?"

#define AT_NET_0ON "AT+CNACT=0,1"
#define AT_NET_1ON "AT+CNACT=1,1"

#define AT_NTP_ID  "AT+CNTPCID=1"                    // ADP Configuration query
#define AT_NTP_SET "AT+CNTP=\"time.nist.gov\",1"    // NIST server, ADP = 1
#define AT_NTP_UP  "AT+CNTP"                        // Update the NTP server
#define AT_TIME    "AT+CCLK?"                       // Dat and Time string query 

#define AT_SNPDPID "AT_SNPDPID=1"
#define AT_IP_PING "AT+SNPING4=\"www.google.com\",1,16,1000"

#include <Arduino.h>        // required before wiring_private.h
#include "wiring_private.h" // pinPeripheral() function

class SimModem
{
private:
  
  char SimModemBuffer [1024] = "";
  bool SimModemEnabled = false;
  int SimModemBufferIndex  = 0;
  
public:
  SimModem();
  int init();
  void powerToggle();
  int powerOn();

  // Parses the entire strings received from modem
  String readResponse(String command);

  //
  String echoOff();

  //
  String readVerify();
  String readGPS();
  
  String readSignal();
  String readRFCfg();
  
  String readClock();
  String readClockID();
  
  String readIP();
  String readIPPing();
  String enableIP();
};

#endif
