/* k96Modbus.cpp - Library for serial data transfer to Senseair K96 NDIR
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
#include "GPSSerial.h"

Uart mySerial (&sercom2, GPS_RX, GPS_TX, SERCOM_RX_PAD_3, UART_TX_PAD_0);
void SERCOM2_Handler(){
  mySerial.IrqHandler();
}

// Constructor
GPSSerial::GPSSerial()
{
}

int GPSSerial::init(){
  
  mySerial.begin(GPS_BAUD);
  mySerial.setTimeout(GPS_TIMEOUT);
  pinPeripheral(GPS_RX, PIO_SERCOM); //Assign RX function to pin 11
  pinPeripheral(GPS_TX, PIO_SERCOM); //Assign TX function to pin 10
  return 0;
  if (mySerial.available() > 0){
    return 0;
  }
  else{
    return -1;
  }
}

String GPSSerial::readResponse(){
  while (mySerial.available() > 0){
    gps.encode(mySerial.read());
    Serial.println("GPS data");
  }
  return (String('.'+gps.location.rawLat().billionths)+','
         +String(gps.location.rawLng().billionths)+','+String(gps.time.hour())+
                      ':'+String(gps.time.minute())+':'+String(gps.time.second())+','+String(gps.altitude.meters())+',');
}

float GPSSerial::lat(){
  return gps.location.lat();
}

float GPSSerial::lng(){
  return gps.location.lng();
}

String GPSSerial::time(){
  return (String(gps.time.hour())+':'+String(gps.time.minute())+':'+String(gps.time.second()));
}
