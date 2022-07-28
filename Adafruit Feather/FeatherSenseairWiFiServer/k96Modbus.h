/* k96Modbus.h - Library for serial data transfer to Senseair K96 NDIR
  
  Senseair K96 sensors use modbus protocol to transfer data over serial.
  Each command is 7 bytes that request a memory transfer of a given number of bytes.
  Each response is 8 bytes, the reply plus carriage return
  The error status register is 16 bits at memory location 0x0A
  
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

#ifndef k96Modbus_h
#define k96Modbus_h

#define K96_BAUD      115200
#define K96_TIMEOUT   200

#define K96_POWER     A0            // Device enable pin

#include <Arduino.h>

class k96Modbus
{
private:
    
    char command[49] = {0x68,0x44,0x00,0x00,0x0E,0xD0,0xFD,
                        0x68,0x44,0x00,0x1C,0x02,0xD8,0x38,
                        0x68,0x44,0x03,0x64,0x04,0x8A,0x3A,
                        0x68,0x44,0x01,0x84,0x04,0x62,0x3A,
                        0x68,0x44,0x01,0x94,0x04,0x6F,0xFA,                      
                        0x68,0x44,0x03,0xA4,0x02,0x5A,0x38};
      
    String labels[9] = {"<br>CH4: ","<br>CO2: ","<br>H2O: ","<br>Pressure: ","<br>T0: ",
                        "<br>T1: ", "<br>T2: ", "<br>Humidity: ", "<br>T3: "};
      
    int k96_memory[9] = {1,1,1,1,1,1,1,1,1};
    long k96MemoryLong[3] = {1,1,1};
    int wordS16(byte high, byte low);
    int wordU16(byte high, byte low);
    long longConvert(byte highest, byte higher, byte lower, byte lowest);
 
public:
    k96Modbus();
    
    
    void init();
    int readResponse();
    long readResponseLong(); 
    int readResponse(int numBytes);    
    void writeCommand(int byteAddress);
    String readCSVString();
    String readCSVString2();    
    String readByteString(int byteAddress);
};

#endif
