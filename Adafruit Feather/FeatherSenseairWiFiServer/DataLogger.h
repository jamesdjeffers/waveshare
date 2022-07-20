#ifndef DataLogger_h
#define DataLogger_h

#define SD_CS         4
#define LOG_DATA      "data.csv"
#define LOG_MAX_SIZE  13600

#include <SPI.h>
#include <SD.h>
    
class DataLogger
{
  private:
    String fileName = "220714_0.csv";

  public:
    DataLogger();
    int init();
    void fileDump();
    void fileRemove(int option);
    void fileRemoveAll();
    int fileAddCSV(String csvString, int option, String dateString);
    void fileDir(File dir, int numTabs);
    int fileCount(File dir);
    
    int fileCount(File dir, String fileName);
    void fileNewName(String dateTime);
    File fileOpen(int option);
  
};

#endif
