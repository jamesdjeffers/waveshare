# Multiple functions implementing various network applications for
# SimCom 7080G modem using "AT" commands on the specified serial port
# Assumes device is configured and connected to network.
# Created by James D. Jeffers
# Date: 2022/06/27
# Updated: 2023/10/16

import serial
import time
import secrets

TIMEOUT_DEFAULT=0.2

ser = serial.Serial("COM42",115200,timeout=TIMEOUT_DEFAULT)
command_input = ''
rec_buff = ''

opTimeStart = 0

def initCom():
    try:
        ser.flushInput()
    except:
        print('Com Port did not initialize.\n1. Check device power\n2. Check cable')

def readWait(back, responseDelay):
    ser.timeout = TIMEOUT_DEFAULT
    opTimeStart = time.time()
    rec_buff = ser.read_until('\n',1024)
    while (back.encode() not in rec_buff) and (b'ERROR' not in rec_buff) and ((time.time() - opTimeStart) < responseDelay):
        if len(rec_buff) > 1:
            print (rec_buff.decode())
        rec_buff = ''
        rec_buff = ser.read_until('\n',1024)
        
    index = rec_buff.decode().find(back) + len(back)   
    string = rec_buff.decode()[index:len(rec_buff)]
    return string

def readWaitResponse(string, back, responseDelay):
    opTimeStart = time.time()
    rec_buff=''
    ser.write((string+'\r\n').encode())
    ser.timeout = TIMEOUT_DEFAULT
    rec_buff = ser.read_until('\n',1024)
    if len(rec_buff) > 1:
        test = 3
        print (rec_buff.decode())
    while (back.encode() not in rec_buff) and (b'ERROR' not in rec_buff) and ((time.time() - opTimeStart) < responseDelay):
        if len(rec_buff) > 1:
            print (rec_buff.decode())
        rec_buff = ''
        rec_buff = ser.read_until('\n',1024)
        
    index = rec_buff.decode().find(back) + len(back)   
    string = rec_buff.decode()[index:len(rec_buff)]
    return string

def readResponse(string, responseDelay):
    ser.write((string+'\r\n').encode())
    if responseDelay:
        ser.timeout = responseDelay
    else:
        ser.timeout = TIMEOUT_DEFAULT
    rec_buff = ser.read(1024)
    if rec_buff != '':
        print(rec_buff.decode())
        rec_buff = ''

def modemInit():
    print('SIM7080X is starting:')
    ser.flushInput()
    readResponse('AT',0)
    readResponse('AT+CFUN=0',0)                             # Disable device RF
    readResponse('AT+CPIN',0)
    
    readResponse('AT+CGDCONT=1,"IPV4V6","attiotdemo"',0)    # Using profile 1
    readResponse('AT+CBANDCFG="CAT-M",2,4,12',0)            # ATT 4G network configuration    
    readResponse('AT+COPS=0,2,"310410"',0)                  # ATT 4G network configuration

    readResponse('AT+COPS?',0)
    readResponse('AT+CNCFG=0,2,"attiotdemo"',0)             # Using profile 2
    readResponse('AT+CNCFG?',0)
    readResponse('AT+CFUN=1',0)                             # Enable device RF
    time.sleep(3)                                           # Wait for device to detect network
    readResponse('AT+CGDCONT=1,"IPV4V6","attiotdemo"',0)    # Repeat commands (don't know why)
    readResponse('AT+CBANDCFG="CAT-M",2,4,12',0)
    
    readResponse('AT+COPS?',0)
    readResponse('AT+COPS=0,2,"310410"',0)                  # Repeat commands (dont' know why)
    readResponse('AT+CNCFG=0,2,"attiotdemo"',0)
    readResponse('AT+CNCFG?',0)
    readResponse('AT+CNACT=1,1',0)                          # Connect to network
    readResponse('AT+CNACT?',0)                             # Check connection
    readResponse('AT+CSQ',0)                                # Check signal strength

def modemInit2():
    print('SIM7080X is starting:')
    ser.flushInput()
    readWaitResponse('AT','OK',60000)
    readResponse('AT+CFUN=0',0)                             # Disable device RF
    readResponse('AT+CPIN',0)
    
    readResponse('AT+CGDCONT=1,"IPV4V6","Wholesale"',0)     # Using profile 1
    readResponse('AT+CBANDCFG="CAT-M",2,4,12',0)            # T-Mobile (Mint) 4G network configuration    
    readResponse('AT+COPS=0,2,"310260"',0)                  # T-Mobile (Mint) 4G network configuration

    readResponse('AT+COPS?',0)
    readResponse('AT+CNCFG=0,2,"Wholesale"',0)             # Using profile 2
    readResponse('AT+CNCFG?',0)
    readResponse('AT+CFUN=1',0)                            # Enable device RF
    time.sleep(3)                                          # Wait for device to detect network
    readResponse('AT+CGDCONT=1,"IPV4V6","Wholesale"',0)    # Repeat commands (don't know why)
    readResponse('AT+CBANDCFG="CAT-M",2,4,12',0)
    
    readResponse('AT+COPS?',0)
    readResponse('AT+COPS=0,2,"310260"',0)                 # Repeat commands (dont' know why)
    readResponse('AT+CNCFG=0,2,"Wholesale"',0)
    readResponse('AT+CNCFG?',0)
    readResponse('AT+CNACT=1,1',0)                         # Connect to network
    readResponse('AT+CNACT?',0)                            # Check connection
    readResponse('AT+CSQ',0)                               # Check signal strength

def modemClock():
    readResponse('AT+CNTPCID=1',0)
    readResponse('AT+CNTP="time.nist.gov",1',0)
    time.sleep(1)
    readResponse('AT+CNTP',1)
    readResponse('AT+CCLK?',0)

def modemPing():
    try:
        readWaitResponse('AT+SNPDPID=1','OK',0)                
        readWaitResponse('AT+SNPING4="www.google.com",1,16,1000','PING4:',3)
    except:
        print('Ping failed')

def modemHTTPConfig():
    readResponse('AT+SHCONF="BODYLEN",1024',0)
    readResponse('AT+SHCONF="HEADERLEN",350',0)

def modemHTTPRead():
    try:
  
        readResponse('AT+CNACT?',0)
        readResponse('AT+SHCONF="URL","http://www.google.com"',0)
        
        readResponse('AT+SHCONN',0)
        readResponse('AT+SHSTATE?',0)

        readResponse('AT+SHCHEAD',0)
        readResponse('AT+SHAHEAD="User-Agent","curl/7.47.0"',0)
        readResponse('AT+SHAHEAD="Cache-control","no-cache"',0)
        readResponse('AT+SHAHEAD="Connection","keep-alive"',0)
        readResponse('AT+SHAHEAD="Accept","*/*"',0)
        readResponse('AT+SHREQ="/",1',1)
        readResponse('AT+SHREAD=0,1565',0)
    except:
        print('HTTP read failed.')

def modemHTTPSRead():
    try:
        readResponse('AT+CNACT?',0)
        readResponse('AT+CSSLCFG="sslversion",1,3',0)
        readResponse('AT+SHSSL=1,""',0)
        
        readResponse('AT+SHCONF="URL","https://www.google.com"',0)
        
        readResponse('AT+SHCONN',5)
        readResponse('AT+SHSTATE?',0)

        readResponse('AT+SHCHEAD',0)
        readResponse('AT+SHAHEAD="User-Agent","curl/7.47.0"',0)
        readResponse('AT+SHAHEAD="Cache-control","no-cache"',0)
        readResponse('AT+SHAHEAD="Connection","keep-alive"',0)
        readResponse('AT+SHAHEAD="Accept","*/*"',0)
        readResponse('AT+SHREQ="/",1',3)
        readResponse('AT+SHREAD=0,2048',0)        
        readResponse('AT+SHREAD=2048,2048',0)                
        readResponse('AT+SHREAD=4096,2048',0)
    except:
        print('HTTPS read failed')

def modemEmailCount():
                
    readResponse('AT+EMAILCID=1',0)
    readResponse('AT+EMAILTO=30',0)
    readResponse('AT+EMAILSSL=1,1,"",""',0)
    readResponse('AT+POP3SRV="","","",995',0)
        
    readResponse('AT+POP3IN',5)
    readResponse('AT+POP3NUM',5)

def modemEmailSend():
   
    readResponse('AT+EMAILCID=1',0)
    readResponse('AT+EMAILTO=30',0)
    readResponse('AT+EMAILSSL?',0)
    readResponse('AT+SMTPSRV="",465',0)
    readResponse('AT+SMTPAUTH=1,"",""',0)
     
    readResponse('AT+SMTPFROM="",""',0)
    readResponse('AT+SMTPSUB="Test"',0)
    readResponse('AT+SMTPRCPT=0,0,"",""',0)
    readResponse('AT+SMTPBODY=19',0)
    time.sleep(0)
    readResponse('This is a new Email',0)
    readResponse('AT+CSSLCFG?',0)
    readResponse('AT+SMTPSEND',0)

def modemFTPConfig():
    response = readWaitResponse('AT+FTPSTATE','FTPSTATE:',1)
    #index = int(response)
    #ftpState = int(response[0,(len(response)-1)])
    ftpState = 0
    print('FTP Status =',response)
    if (ftpState == 1):
        print('FTP Session Closed')
        readResponse('AT+FTPQUIT',0)
        ftpState = 0
    if (ftpState == 0):
        print('FTP Channel')
        print(readResponse('AT+FTPCID=1',0))
        print('FTP Server')
        readResponse('AT+FTPSERV="ftp.caps.ou.edu"',0)  # FTP server name or IP address
        
        readResponse('AT+FTPMODE=1',0)                  # FTP mode to passive (other option active)
        readResponse('AT+FTPTYPE=A',0)                  # FTP data type is ASCII (other option binary)
        readResponse('AT+FTPPORT=21',0)                 # FTP port (default is 21, does not need to be set)

        readResponse('AT+FTPUN="anonymous"',0)          # FTP username (can be "anonymous" for some servers)
        #readResponse('AT+FTPPW=""',0)                  # FTP password (should be empty for some "anonymous" servers)

        readResponse('AT+FTPGETNAME=""',0)              # Get file name
        readResponse('AT+FTPGETPATH=""',0)              # Get file path
        
        readResponse('AT+FTPPUTNAME=""',0)              # Put file name
        readResponse('AT+FTPPUTPATH=""',0)              # Put file path
    else:
        readResponse('AT+FTPSERV?',0)
        readResponse('AT+FTPMODE?',0)
        readResponse('AT+FTPTYPE?',0)

def modemFTPSConfig():          # Configure FTP server for encrypted communication
    print("Downloading SSL certificate")
    
    readResponse('AT+CFSTERM',1)                            # Clear data buffer
    readResponse('AT+CFSINIT',1)                            # Initialize file system
    readResponse('AT+CFSWFILE=0,"",0,1450,1000',1)          # Write file with name and size

    f = open("test.crt","r")                                # Open certificate file
    ser.write((f.read()).encode())                          # Write certificate file to modem
    print(ser.read(50))                                     # Final response should be OK

    readResponse('AT+CFSRFILE=0,"",0,1450,0',2)             # Read back the file for display
    print(ser.read(1450))
    print('')
    
    print('Configuring SSL layer')
    readResponse('AT+CSSLCFG="sslversion",0,3',1)           # Set SSL version
    readResponse('AT+CSSLCFG="ciphersuite",0,0,"0x0035"',1) # Set encryption type
    readResponse('AT+CSSLCFG="ignorertctime",0,1',1)        # Ignore real time clock
    readResponse('AT+CSSLCFG="protocol",0,1',1)             # Set layer security protocol
    readResponse('AT+CSSLCFG="ctxindex",0',1)               # Set configuration index

    print('Converting SSL certificate')
    readResponse('AT+CSSLCFG="convert",1,""')       # COMMAND FAILS
    
    readResponse('AT+FTPSSL?',0)
    readResponse('AT+FTPSSL=1,0,"",""',0)
    readResponse('AT+FTPSSL?',0)
    readResponse('AT+CFSTERM',1)

def modemFTPList():          # Read the contents of the FTP server directory
    
    opTimeStart = time.time()
    print('FTP Directory List')
    response = readWaitResponse('AT+FTPLIST=1','FTPLIST:',10)
    index = response.find("1,")
    if (response == 'ERROR'):
        print('FTP List Error')
    elif (index >= 0):
        code = int(response[index+2:len(response)])
        if (code == 0):
            print('FTP Directory List Waiting')
        elif (code == 1):      
            #readWaitResponse('AT+FTPLIST=2,1024','FTPLIST: 1,0',1)
            print('Reading ...')
            response = readWaitResponse('AT+FTPLIST=2,1024','FTPLIST: ',10)
            index = response.find("2,")
            print('Done =', response)
            if (index >= 0):
                code = int(response[index+2:index+4])
                print('Number of bytes = ', code)
                print(index)
                if (code == 0):
                    print('Got zero')
                    response = readWaitResponse('AT+FTPLIST=2,1024','FTPLIST: 2,',1)
                    index = response.find("2,")
                    code = int(response[index+2:len(response)])
                #readWait('OK',1)
                opTime = time.time()-opTimeStart
                print(opTime)
                readWait('FTPLIST: 1,0',30)
                #readWaitResponse('AT+FTPQUIT','FTPLIST: 1,80',1)
                opTime = time.time()-opTimeStart
                print(opTime)
        elif (code == 62):
            print('FTP DNS Error')
        elif (code == 65):
            print('FTP Server Error')
        elif (code == 77):
            print('FTP Operation Error')
        else:
            print('FTP Error')
    else:
        print('FTP List Error',response)

def modemFTPGet():          # Read a file on the FTP server
       
    print('Starting FTP GET:')
    opTimeStart = time.time()
    response = readWaitResponse('AT+FTPGET=1','FTPGET:',10)
    opTime = time.time()-opTimeStart
    print(opTime)
    readWaitResponse('AT+FTPGET=2,1024','OK',1)
    opTime = time.time()-opTimeStart
    print(opTime)
    #readWait('FTPGET: 1,0',10)
    readWaitResponse('AT+FTPQUIT','FTPGET: 1,80',1)
    opTime = time.time()-opTimeStart
    print(opTime)

def modemFTPPut():          # Write a file to the FTP server
    
    print('Starting FTP PUT:')
    opTimeStart = time.time()
    readResponse('AT+FTPPUTOPT="STOR"',0)
    response = readWaitResponse('AT+FTPPUT=1','FTPPUT:',3)  # Start the connection
    print('Server connected ' + response)
    readWaitResponse('AT+FTPPUT=2,12','FTPPUT: 2,12',5)
    ser.write(('abc123456789').encode())
    readWait('OK',20)
    #readWait('FTPPUT: 1,1',20)
    readWaitResponse('AT+FTPPUT=2,0','OK',3)
    opTime = time.time()-opTimeStart
    print(opTime)
    #readWaitResponse('AT+FTPQUIT','FTPPUT: 1,80',1)
    readWait('FTPPUT: 1,0',5)
    #print(readWait('FTPPUT: ',5))
    opTime = time.time()-opTimeStart
    print(opTime)
    
def main():
    initCom()                           # Set the serial port for modem
    modemInit2()                        # Configure the modem for the proper network, only needed once
    #readResponse('AT+CNACT=1,0',0)
    #readWaitResponse('AT','OK',60000)
    #response = readWaitResponse('AT+COPS=?','OK',240000)
    #print(response)
    readResponse('AT+CPIN?',0)
    try:
        
        readResponse('AT+CGATT?',0)
        readResponse('AT+CGDCONT?',0)
        readResponse('AT+CBANDCFG?',0)  # Check 4G network configuration
        readResponse('AT+COPS?',0)
        readResponse('AT+CNCFG?',0)
        readResponse('AT+CNACT?',0)     # Check ACTive 4G network connection
        
        readResponse('AT+CNACT=1,1',0)  # ACTivate connection to 4G network

        readResponse('AT+CSQ',0)        # read Signal Quality
        
        print("Waiting...")
        time.sleep(3)
        
        modemClock()                    # use NTP server to set real-time clock
        modemPing()                     # pings a known IP address to test connection speed

        #modemHTTPConfig()               # configures HTTP settings for accessing web pages
        #modemHTTPRead()                 # reads an IP address over HTTP

        #modemHTTPSRead()               # UNUSED reads an IP address over HTTPS
        #modemEmailCount()              # UNUSED access/read from a POP3 Gmail account
        #modemEmailSend()               # UNUSED access/send from a POP3 Gmail account

        print("Configuring...")         # configure the FTP feature of modem
        #modemFTPConfig()
        #modemFTPSConfig()
        print("Listing...")             # read the directory contents of FTP server
        #modemFTPList()
        #modemFTPGet()                  # DISABLED Read a file on the FTP server
        #modemFTPPut()                   # write data to FTP server
        
    except :
        print('SimCom function failed.')

    #readResponse('AT+SHDISC',0)        # Disconnect from 4G network
    #readResponse('AT+CNACT=1,0',0)
    ser.close()
    
if __name__ == '__main__':
    main()
