# Example and test code for Waveshare SimCom 7080 Modem

Implements an IoT device on the AT&T 4G newtwork using the Raspberry Pi module from Waveshare based on the SimCom 7080G modem device.
This project extends the capabilities of the company provided downloads and examples for international connection.
The programs use the Google Sheets API to upload interanl data to a shared database.

The Python examples run a complete configuration on the US based 4G network of AT&T
From the SimCom webstie the AT&T network is 4G LTE-M (CTE-M) with is "310410" on bands 2, 8, 12.
The device is configured using "AT" commands over serial port operating at 9600 baud.
For testing purposes a complete Windows based Python driver was devloped.
For field testing Arduino based C-code for an Adafruit Feather.
