#!/usr/bin/python
# -*- coding:utf-8 -*-

import serial
import time

ser = serial.Serial("COM27",115200)
ser.flushInput()

power_key = 4
rec_buff = ''
rec_buff2 = ''
time_count = 0

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

def get_gps_position():
	rec_null = True
	answer = 0
	print('Start GPS session...')
	rec_buff = ''
	send_at('AT+CGNSPWR=1','OK',1)
	time.sleep(2)
	while rec_null:
		answer = send_at('AT+CGNSINF','+CGNSINF: ',1)
		if 1 == answer:
			answer = 0
			if ',,,,,,' in rec_buff:
				print('GPS is not ready')
				rec_null = False
				time.sleep(1)
		else:
			print('error %d'%answer)
			rec_buff = ''
			send_at('AT+CGNSPWR=0','OK',1)
			return False
		time.sleep(1.5)


def power_on(power_key):
	print('SIM7080X is starting:')
	ser.flushInput()
	print('SIM7080X is ready')

def power_down(power_key):
	print('SIM7080X is loging off:')
	send_at('AT+CGNSPWR=0','OK',1)
	print('Good bye')

try:
	power_on(power_key)
	get_gps_position()
	power_down(power_key)
except:
	if ser != None:
		ser.close()
	power_down(power_key)
if ser != None:
		ser.close()
		GPIO.cleanup()	
