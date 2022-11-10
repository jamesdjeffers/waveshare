/* k96Modbus.cpp - Library for serial data transfer to Senseair K96 NDIR
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

k96Modbus::k96Modbus()
{
}

/*
 * Serial Port Output pins TX, RX
 * Baud Rate = 115200, Parity = None, Stop bits = 2
 */
int k96Modbus::init(){
  Serial1.begin(K96_BAUD,SERIAL_8N2);
  Serial1.setTimeout(K96_TIMEOUT);
  pinMode(K96_POWER,OUTPUT);
  digitalWrite(K96_POWER,HIGH);
  return 0;
}

/*
 *  signed 16 bit number
 */

int k96Modbus::wordS16(byte high, byte low){
  int result = ((high*256) + low);
  if (result > 32768) result -= 65535;
  return result;
}

/*
 *  unsigned 16 bit number
 */
int k96Modbus::wordU16(byte high, byte low){
  return ((high*256) + low);
}

/*
 *  unsigned 32 bit number
 */
long k96Modbus::longConvert(byte highest, byte higher, byte lower, byte lowest){
  return ((highest*16777216)+(higher*65536)+(lower*256) + lowest);
}

/*
 *  Read 2 bytes for an unsigned 16 bit number
 */
int k96Modbus::readResponse(){
  byte test[8];
  Serial1.readBytes(test,8);
  return wordU16(test[3],test[4]);
}

long k96Modbus::readResponseLong(){
  byte test[10];
  Serial1.readBytes(test,10);
  return longConvert(test[3],test[4],test[5],test[6]);
}

int k96Modbus::readResponse(int numBytes){
  byte test[6+numBytes];
  int responseBytes = Serial1.readBytes(test,6+numBytes);
  k96_memory[0] = wordS16(test[3],test[4]);
  k96_memory[1] = wordS16(test[5],test[6]);
  k96_memory[2] = wordS16(test[7],test[8]);
  k96_memory[3] = wordS16(test[9],test[10]);
  k96_memory[4] = wordS16(test[11],test[12]);
  k96_memory[5] = wordS16(test[13],test[14]);
  return responseBytes;
}

void k96Modbus::writeCommand(int byteAddress){
  for(int i=0; i<7; i++){
    Serial1.write(command[i+7*byteAddress]);
  }
}

String k96Modbus::readCSVString(){
  String dataString = "";
  writeCommand(0);
  int readStatus = readResponse(14);
  if(readStatus > 14){
    for(int i=0; i<6; i++){
      dataString += (String(k96_memory[i]) + ',');
    }
    writeCommand(1);
    k96_memory[6] = readResponse();
    dataString += (String(k96_memory[6]) + ',');
    for(int i=2; i<5; i++){
      writeCommand(i);
      k96_memory[i+5] = readResponse();
      dataString += (String(k96_memory[i+5])+',');
    }
    return dataString;
  }
  else{
    return "-,-,-,-,-,-,-,-,-,-,";
  }
  
}

/*
 * Returns
 */
String k96Modbus::readByteString(int byteAddress){
  return String(labels[byteAddress]+k96_memory[byteAddress]);
}

/*
 * Returns
 */
String k96Modbus::readSensorID(){
  writeCommand(5);
  return String(readResponseLong());
}

String k96Modbus::readSensorFW(){
  byte test[10];
  writeCommand(6);
  Serial1.readBytes(test,10);
  return (String(test[3])+"."+String(test[4]) +"."+ String(test[5]) +"."+ String(test[6]));
}
