/* k96Modbus.h - Library for serial data transfer to Senseair K96 NDIR
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

#include <Arduino.h>

class k96Modbus
{
private:
    
    char command[63] = {0x68,0x44,0x00,0x00,0x02,0xD0,0xF8,
                       0x68,0x44,0x00,0x02,0x02,0xD1,0x98,
                       0x68,0x44,0x00,0x04,0x02,0xD2,0x38,
                       0x68,0x44,0x00,0x06,0x02,0xD3,0x58,
                       0x68,0x44,0x00,0x08,0x02,0xD7,0x38,
                       0x68,0x44,0x00,0x0A,0x02,0xD6,0x58,
                       0x68,0x44,0x00,0x0E,0x02,0xD4,0x98,
                       0x68,0x44,0x00,0x10,0x02,0xDD,0x38,
                       0x68,0x44,0x00,0x12,0x02,0xDC,0x58};
      
    String labels[9] = {"<br>CH4: ","<br>CO2: ","<br>H2O: ","<br>Pressure: ","<br>T0: ",
                        "<br>T1: ", "<br>T2: ", "<br>Humidity: ", "<br>T3: "};
      
    int k96_memory[9] = {1,1,1,1,1,1,1,1,1};
    int byteConvert(byte high, byte low);
 
public:
    k96Modbus();
    
    
    void init();
    int readResponse();    
    void writeCommand(int byteAddress);
    String readCSVString();    
    String readByteString(int byteAddress);
};

#endif
