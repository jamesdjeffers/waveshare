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

#define modemRX                   21
#define modemTX                   20
#define modemBaud                 9600
#define modemTimeout              200
#define MODEM_TIMER_POWER_PULSE   2000              // Datasheet Ton mintues = 1.2S
#define MODEM_TIMER_POWER_ON      15000
#define MODEM_TIMER_POWER_OFF     5000

#define MODEM_STATUS_UNKNOWN    -3
#define MODEM_STATUS_OFF        -2
#define MODEM_STATUS_CONNECT    -1
#define MODEM_STATUS_ON         0
#define MODEM_STATUS_ERROR      1

#define MODEM_BUFFER 1360

#define MODEM_POWER     6                           // Board Design 0.2 used pin "D5", header, and jumper

#define ATI        "ATI"                            // Device info, query purposes
#define ATE_OFF    "ATE0"                           // Turns off echo mode
#define AT_CSQ     "AT+CSQ"                         // 4G-LTE signal strength
#define AT_CPSI     "AT+CPSI?"
#define AT_GSN     "AT+GSN"
#define AT_CGATT   "AT+CGATT?"

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
#define AT_NET_1OF "AT+CNACT=1,0"

#define AT_NTP_ID  "AT+CNTPCID=1"                    // ADP Configuration query
#define AT_NTP_SET "AT+CNTP=\"time.nist.gov\",-24"    // NIST server, Time Zone
#define AT_NTP_UP  "AT+CNTP"                        // Update the NTP server
#define AT_TIME    "AT+CCLK?"                       // Dat and Time string query 

#define AT_SNPDPID "AT_SNPDPID=1"
#define AT_IP_PING IP_PING

#define AT_FTP_EXT      "AT+FTPQUIT"
#define AT_FTP_CID      "AT+FTPCID=1"
#define AT_FTP_STA      "AT+FTPSTATE"
#define AT_FTP_SRV      FTP_SERVER
#define AT_FTP_UN       FTP_UN
#define AT_FTP_PWD      FTP_PWD
#define AT_FTP_PRT      "AT+FTPPORT=21"
#define AT_FTP_TYP      "AT+FTPTYPE=A"
#define AT_FTP_MOD      "AT+FTPMODE=1"

#define AT_FTP_SRV_QRY  "AT+FTPSERV?"
#define AT_FTP_UN_QRY   "AT+FTPUN?"

#define AT_FTP_GET_NAM  "AT+FTPGETNAME=\"config.json\""
#define AT_FTP_GET_PTH  "AT+FTPGETPATH=\"/incoming/binbin\""

#define AT_FTP_GET_QNM  "AT+FTPGETNAME?"
#define AT_FTP_GET_QPT  "AT+FTPGETPATH?"

#define AT_FTP_PUT_NM1  "AT+FTPPUTNAME="
#define AT_FTP_PUT_PTH  "AT+FTPPUTPATH=\"/incoming/binbin/\""
#define AT_FTP_PUT_NEW  "AT+FTPPUTOPT=\"STOR\""
#define AT_FTP_PUT_APP  "AT+FTPPUTOPT=\"APPE\""

#define AT_FTP_PUT_QNM  "AT+FTPPUTNAME?"
#define AT_FTP_PUT_QPT  "AT+FTPPUTPATH?"
#define AT_FTP_PUT_QOP  "AT+FTPPUTOPT?"

#define AT_FTP_LST "AT+FTPLIST=1"
#define AT_FTP_LRD "AT+FTPLIST=2,1024"
#define AT_FTP_GET "AT+FTPGET=1"
#define AT_FTP_GRD "AT+FTPGET=2,1024"
#define AT_FTP_PUT "AT+FTPPUT=1"
#define AT_FTP_PWR "AT+FTPPUT=2,"
#define AT_FTP_PWX "AT+FTPPUT=2,1360"
#define AT_FTP_PDN "AT+FTPPUT=2,0"

#define AT_GPS_PWR "AT+CGNSPWR=1"
#define AT_GPS_OFF "AT+CGNSPWR=0"
#define AT_GPS_RD  "AT+CGNSINF"

#define AT_MQT_URL  "AT+SMCONF=\"URL\",555.555.555.555,6000"
#define AT_MQT_TIM  "AT+SMCONF=\"KEEPTIME\",60"
#define AT_MQT_CSS  "AT+SMCONF=\"CLEANSS\",1"
#define AT_MQT_CLI  "AT+SMCONF=\"CLIENTID\",\"URL\""
#define AT_MQT_CON  "AT+SMCONN"
#define AT_MQT_SUB  "AT+SMSUB=\"information\",1"
#define AT_MQT_PUB  "AT+SMPUB=\"information\",5,1,1"
#define AT_MQT_UNS  "AT+SMUNSUB=\"information\""
#define AT_MQT_DIS  "AT+SMDISC"
#define AT_MQT_STA  "AT+SMSTATE"

#include "secrets.h"
#include <Arduino.h>        // required before wiring_private.h
#include "wiring_private.h" // pinPeripheral() function
#include <SD.h>

class SimModem
{
private:
  
  char buffer [1360] = "";
  int status = -3;                    // Contains operation mode data (-3 = unknown, -2 = startup, -1 = connecting, 0 = on)
  long timer = 0;                     // Used to track internal actions, stores millisecond timer
  
public:
  SimModem();                         // Constructor
  int init();                         // Start serial communication, reset device
  
  void powerToggle();
  int powerOn();
  int startSession();
  int checkStatus();
  
  int startNTP();                   // Internal time clock server
  int startFTP();                   // Data server initialization
  int checkFTP();                   // Determines if there is an active FTP server connection
  int startMQTT();                  // Data server initialization
  
  // Parses the entire strings received from modem
  String readResponse(String command, int waitTime);
  String readWaitResponse(String command, int waitTime, String back);
  String readBurst(String command, int waitTime, String back);

  // Limit response messages by disabling "ECHO" function
  String echoOff();

  String readIMEI();                    // Read the string stored for the modem IMEI

  //
  String readVerify();
  String readGPS();

  // RF Signal function
  String readSignal();
  String readRFCfg();
  
  String readClock(int format);
  String readClockID();
  
  String readIP();
  String readIPPing();
  int enableIP();
  
  String disableIP();

  void   ftpFileName(int type);
  String ftpList();
  String ftpGet();
  
  int ftpPut(String dataString);
  int ftpPut(File dataFile, int option);

  int ftpStatus();
  String ftpCID();
  String ftpUsername();
  String ftpPwd();
  String ftpServer();

  String GPSOn();
  String GPSOff();

  int mqttPub();
  int mqttSub();
  int mqttUnsub();

  String RFOn();
  String RFOff();
};

#endif
