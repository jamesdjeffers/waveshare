/* DataLogger.h - Library for SD card file management

  Functions for saving, deleting, or printing text files to and SD card.
  
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

#ifndef DataLogger_h
#define DataLogger_h

#define SD_CS         4
#define LOG_DATA      "data.csv"
#define LOG_SYS       "log.txt"
#define LOG_MAX_SIZE  12240

#include <SPI.h>
#include <SD.h>
    
class DataLogger
{
  private:
    String fileName = "yyddmm_0.csv";

  public:
    DataLogger();
    int init();
    void fileDump(int option);
    int fileRemove(int option);
    void fileRemoveAll();
    int fileCheckSize();
    int fileAddCSV(String csvString, int option);
    void fileDir(File dir, int numTabs);
    
    int fileCount(File dir);
    int fileCount(File dir, String fileName);
    
    void fileNewName(String dateTime);
    String fileNameString();
    File fileOpen(int option);
  
};

#endif
