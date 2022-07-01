#ifndef DataLogger_h
#define DataLogger_h

#define SD_CS 4

#include <SPI.h>
#include <SD.h>
    
class DataLogger
{
  private:
    String fileName = "datalog.csv";

  public:
    DataLogger();
    int init();
    void fileDump();
    void fileRemove();
    int fileAddCSV(String csvString);
  
};

#endif
