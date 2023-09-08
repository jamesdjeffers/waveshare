/*  DataLogger.cpp - Library for SD card operations
 *  
 * Copyright (c) 2022 University of Oklahoma.  All right reserved.

 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

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
  if (SD.begin(SD_CS)){
    status = 0;
  }
  else{
    status = 1;
  }
  return status;
}

int DataLogger::fileDump(int option){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  String temp;
  if (option == 0){
    temp = fileName;
  }
  else if (option == 1){
    temp = TEMP_DATA;
  }
  else if (option == 2){
    temp = logName;
  }
  File dataFile = SD.open(temp);

  // if the file is available, write to it:
  if (dataFile) {
    while (dataFile.available()) {
      Serial.write(dataFile.read());
    }
    dataFile.close();
    return 0;
  }
  // if the file isn't open, pop up an error:
  else {
    return 1;
  }
}

/*
 * Delete a file on the SD card
 */

int DataLogger::fileRemove(int option){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  if (!status){
    String file = fileName;
    if (option) file = TEMP_DATA;
    if (SD.exists(file)) {
      SD.remove(file);
      return 0;
    } else {
      return -1;
    }
  }
  return -1; 
}

/*
 * Delete all files on SD card
 */
void DataLogger::fileRemoveAll(){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  if (!status){
    File root;
    root = SD.open("/");
    while (true) {
  
      File entry =  root.openNextFile();
      if (! entry) {
        // no more files
        break;
      }
      SD.remove(entry.name());
      entry.close();
    }
    root.close();
  }
}

/*
 * Check the size of the current data file
 */
int DataLogger::fileCheckSize(){
  if (!status){
    File dataFile = SD.open(fileName);
    int fileSize = dataFile.size();
    dataFile.close();
    return fileSize;
  }
  return -1;
}

/*
 *  Add a single line of text to a new/existing file
 */
int DataLogger::fileAddCSV(String csvString, int option){
  
  // SD card is enabled but in error (could have been removed) try to reinitialize
  if (status > 0){
    init();
  }
  // Previous section could have reset the status variable
  if (status == 0){
    File dataFile;

    // if the file is available, write to it, else log error
    if (option <= 1) {
      dataFile = SD.open(fileName, FILE_WRITE);
      if (dataFile) {
        dataFile.println(csvString);
        dataFile.close();
      }
      else{
        status = 1;
      }
    }
    
    if (option == 1){
      dataFile = SD.open(fileName, FILE_WRITE);
      // if the file is available, write to it, else log error
      if (dataFile) {
        dataFile.println(csvString);
        dataFile.close();
      }
      else{
        status = 1;
      }
    }
    else if (option == 2){
      dataFile = SD.open(logName, FILE_WRITE);
      // if the file is available, write to it, else log error
      if (dataFile) {
        dataFile.println(csvString);
        dataFile.close();
      }
      else{
        status = 1;
      }
    }
  }
  return status;    
}

/*
 *  List the files in the directory
 */

void DataLogger::fileDir(File dir, int numTabs) {

  if (!status){
    while (true) {

      File entry =  dir.openNextFile();
      if (! entry) {
        // no more files
        break;
      }
      for (uint8_t i = 0; i < numTabs; i++) {
        Serial.print('\t');
      }
      Serial.print(entry.name());
      if (entry.isDirectory()) {
        Serial.println("/");
        fileDir(entry, numTabs + 1);
      } else {
        // files have sizes, directories do not
        Serial.print("\t\t");
        Serial.println(entry.size(), DEC);
      }
      entry.close();
    }
  }  
}

/*
 * The total number of files in the directory
 */
int DataLogger::fileCount(File dir){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  if (!status){
    int numFiles = 0;
    while (true) {
  
      File entry =  dir.openNextFile();
      if (! entry) {
        // no more files
        return numFiles;
      }
      numFiles+=1;
      entry.close();
    }
  }
  return -1;
}

/*
 * The number of files containing the string input: fileName
 */
int DataLogger::fileCount(File dir, String fileName){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  int numFiles = 0;
  while (true) {

    File entry =  dir.openNextFile();
    if (! entry) {
      // no more files
      return numFiles;
    }
    if (String(entry.name()).indexOf(fileName) >=0){
      numFiles+=1;
    }
    entry.close();
  }
}

/*
 *  Create a new file on the SD card using the date string
 *  File names are limited to 8 characters: YYMMDD_x.csv
 *  x (maximum 62) = 0-9,A-Z,a-z
 */
void DataLogger::fileNewName(String dateTime){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  File root;
  root = SD.open("/");
  String fileID = "";
  int numFiles = fileCount(root,dateTime);
  if (numFiles >= 10){
    numFiles += 55;
    fileID = String(char(numFiles));
  }
  else{
    fileID = String(numFiles);
  }
  fileName = dateTime + "_" + fileID + ".csv";
  root.close();

}

/*
 * opens one of the file objects associated with current data stream
 */
String DataLogger::fileNameString(){

  return fileName;   
}

/*
 *  Create a new file on the SD card using the date string
 *  File names are limited to 8 characters: YYMMDD_x.csv
 *  x (maximum 62) = 0-9,A-Z,a-z
 */
void DataLogger::logNewName(){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  File root;
  root = SD.open("/");
  logName = "LOG" + String(fileCount(root,"LOG")) + ".txt";
  root.close();
}
/*
 * opens one of the file objects associated with current data stream
 */
File DataLogger::fileOpen(int option){
  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  if (!status){
    if (option == 1){
      return SD.open(TEMP_DATA);
    }
    else if (option == 2) {
      return SD.open(logName);
    }
    else{
      return SD.open(fileName);
    }
  }
  else {
    File temp;
    return temp;
  }
    
}
