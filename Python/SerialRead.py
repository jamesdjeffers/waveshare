# Multiple functions implementing various network applications for
# SimCom 7080G modem using "AT" commands on serial port "COM27"
# Assumes device is configured and connected to network.
# Created by James D. Jeffers
# Date: 2022/06/27

import serial
import time

TIMEOUT_DEFAULT=0.2

ser = serial.Serial("COM6",9600,timeout=TIMEOUT_DEFAULT)
command_input = ''
rec_buff = ''

def initCom():
    try:
        ser.flushInput()
    except:
        print('Com Port did not initialize.\n1. Check device power\n2. Check cable')
        
def main():
    initCom()
    while(True):
        ser.write(('1').encode())
        if ser.inWaiting():
            time.sleep(0.01)
            rec_buff = ser.read(ser.inWaiting())
            if rec_buff != '':
                print(rec_buff.decode())

    ser.close()
    
if __name__ == '__main__':
    main()