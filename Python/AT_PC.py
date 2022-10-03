# Windows Python example to 

import serial
import time

ser = serial.Serial("COM27",9600)
ser.flushInput()

power_key = 4
command_input = ''
rec_buff = ''

def power_on(power_key):
	print('SIM7080X is starting:')
	ser.flushInput()
	#ser.write(('AT').encode())
	print('SIM7080X is ready')

def power_down(power_key):
	print('SIM7080X is loging off:')
	
	print('Good bye')

try:
        power_on(power_key)
        #ser.write(('AT+CFUN=0\r\n').encode())
        ser.write(('AT+CPIN?\r\n').encode())
        ser.write(('AT+CGDCONT=1,"IPV4V6","attiotdemo"\r\n').encode())
        ser.write(('AT+CBANDCFG="CAT-M",2,4,12\r\n').encode())
        ser.write(('AT+COPS=0,2,"310410"\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''

        
        ser.write(('AT+CNCFG=0,2,attiotdemo\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
        ser.write(('AT+CNCFG?\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
        
        ser.write(('AT+CFUN=1\r\n').encode())
        time.sleep(2)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
        ser.write(('AT+CNACT=1,1\r\n').encode())
        ser.write(('AT+CNACT?\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
        ser.write(('AT+CGNAPN\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
        ser.write(('AT+CGPADDR\r\n').encode())
        ser.write(('AT+CGATT?\r\n').encode())
        ser.write(('AT+COPS?\r\n').encode())        
        ser.write(('AT+CGDCONT?\r\n').encode())
        ser.write(('AT+CBANDCFG?\r\n').encode())
        ser.write(('AT+CSQ\r\n').encode())
        ser.write(('AT+CEER\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
except :
    ser.close()
    power_down(power_key)
