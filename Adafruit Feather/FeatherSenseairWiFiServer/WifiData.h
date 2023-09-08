/*  WiFi interface for three different Adafruit Feather configurations
 *  For Airlift Feather Wing use "WiFiNINA.h" as included directory
 *  For M0 ATMSC Feather use "WiFi101.h"
 *  
 *  Written by: James D. Jeffers
*/
#include "secrets.h"
#include <SPI.h>
#define WIFIAP 0

#if WIFIAP == 0
  #include <WiFiNINA.h>               // Use library for FeatherWing
  // Configure the pins used for the ESP32 connection
  #define SPIWIFI       SPI  // The SPI port
  #define SPIWIFI_SS    13   // Chip select pin
  #define ESP32_RESETN  12   // Reset pin
  #define SPIWIFI_ACK   11   // a.k.a BUSY or READY pin
  #define ESP32_GPIO0   -1
  #define CONFIGURE     WiFi.setPins(SPIWIFI_SS, SPIWIFI_ACK, ESP32_RESETN, ESP32_GPIO0, &SPIWIFI);
#elif WIFIAP == 1
  #include <WiFi101.h>                // Use library for Feather M0
  #define CONFIGURE     WiFi.setPins(8,7,4,2);
#endif

char ssid[] = WIFI_ID;        // created AP name
char pass[] = WIFI_PWD;       // AP password (needed only for WEP, must be exactly 10 or 26 characters in length)
int keyIndex = 0;             // your network key Index number (needed only for WEP)

int status = WL_IDLE_STATUS;
WiFiServer server(80);

/*
 * Initialize the wireless network, will cause error without Airlift
 * Commented lines are for the Feather WiFi module using WiFi library
 * 
 */
int wifiDataInit(){
//  if (WiFi.status() == WL_NO_MODULE) {
//    return 1;
//  }
//  else{
//  CONFIGURE;
    status = WiFi.beginAP(ssid);
    if (status != WL_AP_LISTENING) {
      return 2;
    }
    delay(5000);
    server.begin();       // start the web server on port 80
    return 0;
//  }
}
