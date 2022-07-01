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
#include "DataLogger.h"

DataLogger::DataLogger(){
  
}

int DataLogger::init(){
    // see if the card is present and can be initialized:
  return SD.begin(SD_CS);
}

void DataLogger::fileDump(){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  File dataFile = SD.open(fileName);

  // if the file is available, write to it:
  if (dataFile) {
    while (dataFile.available()) {
      Serial.write(dataFile.read());
    }
    dataFile.close();
  }
  // if the file isn't open, pop up an error:
  else {
    Serial.println("error opening datalog.txt");
  }
}

void DataLogger::fileRemove(){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  if (SD.exists(fileName)) {
    SD.remove(fileName);
    Serial.println("example.txt exists.");
  } else {
    Serial.println("example.txt doesn't exist.");
  }
}

int DataLogger::fileAddCSV(String csvString){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  
    File dataFile = SD.open(fileName, FILE_WRITE);
    
    // if the file is available, write to it, else log error
    if (dataFile) {
      dataFile.println(csvString);
      dataFile.close();
      return 0;
    }
    else {
      return 1;
    }
}
