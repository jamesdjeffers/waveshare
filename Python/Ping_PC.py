#!/usr/bin/python

import serial
import time

ser = serial.Serial("COM27",9600)
ser.flushInput()

command_input = ''
rec_buff = ''



try:
        
        ser.write(('AT+CSQ\r\n').encode())
        #ser.write(('AT+CNACT=1,1\r\n').encode())
        ser.write(('AT+CGNAPN\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
            
        
        ser.write(('AT+SNPDPID=1\r\n').encode())
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''
        #ser.write(('AT+CMGS="14057402580"\r\n').encode())
        ser.write(('AT+SNPING4="www.google.com",3,16,1000\r\n').encode())
        #ser.write(('AT+SNPING6="www.google.com",3,16,1000\r\n').encode())
        
        time.sleep(1)
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
        if rec_buff != '':
            print(rec_buff.decode())
            rec_buff = ''

        
        
except :
    ser.close()
