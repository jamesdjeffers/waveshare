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
#include "k96Modbus.h"

k96Modbus::k96Modbus()
{
}

void k96Modbus::init(){
  Serial1.begin(9600);
  Serial1.setTimeout(100);
}

int k96Modbus::byteConvert(byte high, byte low){
  return ((high*256) + low);
}

int k96Modbus::readResponse(){
  byte test[7];
  Serial1.readBytes(test,7);
  while (Serial1.available()){
    Serial1.read();
  }
  return byteConvert(test[3],test[4]);
}

void k96Modbus::writeCommand(int byteAddress){
  for(int i=0; i<7; i++){
    Serial1.write(command[i+7*byteAddress]);
  }
}

String k96Modbus::readCSVString(){
  String dataString = "";
  for (int i=0; i < 9; i++){
      writeCommand(i);
      k96_memory[i] = readResponse();
      dataString += String(k96_memory[i]) + ",";
      writeCommand(i);
      readResponse();
  }
  return dataString;
}

String k96Modbus::readByteString(int byteAddress){
  return String(labels[byteAddress]+k96_memory[byteAddress]);
}
