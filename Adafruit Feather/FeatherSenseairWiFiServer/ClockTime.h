bool NTPEnabled = false;
#include <NTPClient.h>
#include <WiFiUdp.h>
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP,"pool.ntp.org", 36000, 60000);

void Clock_init(){
  timeClient.begin();
}
