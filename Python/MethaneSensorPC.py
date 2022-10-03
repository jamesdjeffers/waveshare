# Multiple functions implementing various network applications for
# SimCom 7080G modem using "AT" commands on serial port "COM27"
# Assumes device is configured and connected to network.
# Created by James D. Jeffers
# Date: 2022/06/27

import serial
import time
import datetime

TIMEOUT_DEFAULT=0.2

updateInterval = 5

uploadInterval = 30
lastUpload = time.time()

ser = serial.Serial("COM27",115200,timeout=TIMEOUT_DEFAULT)
command_input = ''
rec_buff = ''

def initCom():
    try:
        ser.flushInput()
    except:
        print('Com Port did not initialize.\n1. Check device power\n2. Check cable')

def send_at(command,back,timeout):
	rec_buff = ''
	ser.write((command+'\r\n').encode())
	time.sleep(timeout)
	if ser.inWaiting():
		time.sleep(0.01 )
		rec_buff = ser.read(ser.inWaiting())
	if rec_buff != '':
		if back not in rec_buff.decode():
			print(command + ' ERROR')
			print(command + ' back:\t' + rec_buff.decode())
			return 0
		else:
			print(rec_buff.decode())
			return 1
	else:
		print('GPS is not ready')
		return 0

def readWaitResponse(string, back, responseDelay):
    ser.write((string+'\r\n').encode())
    ser.timeout = TIMEOUT_DEFAULT
    rec_buff = ser.read_until('\n',1024)
    while (back.encode() not in rec_buff) and (b'ERROR' not in rec_buff):
        if len(rec_buff) > 1:
            print (rec_buff.decode())
        rec_buff = ''
        rec_buff = ser.read_until('\n',1024)
        
    index = rec_buff.decode().find(back) + len(back)
    print(rec_buff.decode()[index:len(rec_buff)])
    string = rec_buff.decode()[index:len(rec_buff)]
    #return rec_buff.decode()[index:len(rec_buff)]
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
    readResponse('AT+CFUN=0',0)
    readResponse('AT+CPIN',0)
    readResponse('AT+CGDCONT=1,"IPV4V6","attiotdemo"',0)
    readResponse('AT+CBANDCFG="CAT-M",2,4,12',0)
    readResponse('AT+COPS=0,2,"310410"',0)
    readResponse('AT+CNCFG=0,2,attiotdemo',0)
    readResponse('AT+CNCFG?',0)
    readResponse('AT+CFUN=1',0)
    time.sleep(3)
    readResponse('AT+CNACT=1,1',0)
    readResponse('AT+CNACT?',0)
    readResponse('AT+CSQ',0)

def modemClock():
    readResponse('AT+CNTPCID=1',0)
    readResponse('AT+CNTP="time.nist.gov",1',0)
    time.sleep(1)
    readResponse('AT+CNTP',1)

def modemClockUpdate():
    response = readWaitResponse('AT+CNTP','CNTP:',1)
    index = response.find("1,\"")
    if (index >= 0):
        print('Good')
        #print(repsonse[3:len(response)])
        return 0
    index = response.find("62")
    if (index >= 0):
        print('DNS error')
        return 62
    index = response.find("64")
    if (index >= 0):
        print('Service response error')
        return 64
    else:
        print('Unknown error')
        return 99

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
        #readResponse('AT+SHSSL=1,"httpbin_root_ca.cer"')
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
        print('HTTPS read feiled')

def modemEmailCount():
    #readResponse('AT+CSSLCFG=?',0)
                
    readResponse('AT+EMAILCID=1',0)
    readResponse('AT+EMAILTO=30',0)
    #readResponse('AT+EMAILSSL=1,1,"email.cer","email.pem"',0)
    readResponse('AT+EMAILSSL=1,1,"",""',0)
    readResponse('AT+POP3SRV="pop.gmail.com","okdroneimage@gmail.com","ikcyolkmvfvbjcuu",995',0)
        
    readResponse('AT+POP3IN',5)
    readResponse('AT+POP3NUM',5)

def modemEmailSend():
   
    readResponse('AT+EMAILCID=1',0)
    readResponse('AT+EMAILTO=30',0)
    #readResponse('AT+EMAILSSL=1,1,"email.cer","email.pem"',0)
    readResponse('AT+EMAILSSL?',0)
    readResponse('AT+SMTPSRV="smtp.gmail.com",465',0)
    readResponse('AT+SMTPAUTH=1,"okdroneimage@gmail.com","ikcyolkmvfvbjcuu"',0)
     
    readResponse('AT+SMTPFROM="okdroneimage@gmail.com","okdroneimage"',0)
    readResponse('AT+SMTPSUB="Test"',0)
    readResponse('AT+SMTPRCPT=0,0,"okdroneimage@gmail.com","okdroneimage"',0)
    readResponse('AT+SMTPBODY=19',0)
    time.sleep(0)
    readResponse('This is a new Email',0)
    readResponse('AT+CSSLCFG?',0)
    readResponse('AT+SMTPSEND',0)

def modemFTPConfig():
    readResponse('AT+FTPQUIT',0)
    readResponse('AT+FTPCID=1',0)
    readResponse('AT+FTPSERV="ftp.weng.oucreate.com"',0)
    readResponse('AT+FTPUN="james@weng.oucreate.com"',0)
    readResponse('AT+FTPPW="OUWeng2848"',0)
    readResponse('AT+FTPGETNAME="config.json"',0)
    readResponse('AT+FTPGETPATH="/861340049860164/"',0)
    readResponse('AT+FTPPUTNAME="temp.txt"',0)
    readResponse('AT+FTPPUTPATH="/861340049860164/"',0)
    readResponse('AT+FTPPORT=21',0)

def modemFTPList():
    readWaitResponse('AT+FTPLIST=1','FTPLIST:',1)
    readWaitResponse('AT+FTPLIST=2,1024','FTPLIST: 1,0',1)

def modemFTPGet():

    readWaitResponse('AT+FTPGET=1','FTPGET:',10)
    readWaitResponse('AT+FTPGET=2,1024','FTPGET: 1,0',0)

def modemFTPPut():
    
    readResponse('AT+FTPPUT=1',3)
    print(ser.read(10))
    #time.sleep(1)
    print(datetime.datetime.now().strftime("%Y_%m_%d"))
    timeString = datetime.datetime.now().strftime("%H_%M_%S")
    print(len(timeString))
    readResponse('AT+FTPPUT=2,'+str(len(timeString)),3)
    #time.sleep(1)
    
    readResponse(timeString,0)
    readWaitResponse('AT+FTPPUT=2,0','FTPPUT:',0)
    
def main():
    initCom()
    modemInit()
    
    readResponse('AT+CNACT=1,1',0)
    modemFTPConfig()
    modemClock()
    
    readResponse('AT+CNACT?',0)
    readResponse('AT+GSN',0)
    readResponse('AT+CCLK?',0)
    readResponse('AT+FTPQUIT',0)
    #readWaitResponse('AT+CGNSPWR=1','OK',1)
    lastUpload = time.time()
    
    while True:
        #readWaitResponse('AT+CGNSINF','+CGNSINF: ',1)
        readResponse('AT+CGNSINF',1)
        time.sleep(updateInterval)
        print(time.time() - lastUpload)
        if ((time.time() - lastUpload) > uploadInterval):
            try:
                
                send_at('AT+CGNSPWR=0','OK',1)
                time.sleep(3)
                readResponse('AT+CNACT=1,1',0)
                #time.sleep(3)
                readResponse('AT+CSQ',0)
                #time.sleep(75)
                count = 0
                connected = modemClockUpdate()
                while modemClockUpdate() and count < 5:
                    print(time.time())
                    time.sleep(15)
                    count+=1
                readWaitResponse('AT+CNTP','CNTP:',1)
                modemPing()
                #modemHTTPConfig()
                #modemHTTPRead()
                #modemHTTPSRead()
                #modemEmailCount()
                modemFTPList()
                modemFTPGet()
                modemFTPPut()
                #modemEmailSend()
                lastUpload = time.time()
                readResponse('AT+CNACT=1,0',0)
                readWaitResponse('AT+CGNSPWR=1','OK',1)
                
            except :
                print('SimCom function failed.')

    readResponse('AT+SHDISC',0)
    
    readResponse('AT+FTPQUIT',0)
    readResponse('AT+CNACT=1,0',0)
    ser.close()
    
if __name__ == '__main__':
    main()
