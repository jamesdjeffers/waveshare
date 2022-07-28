# Example and test code for Waveshare SimCom 7080 Modem

Implements an IoT device on the AT&T 4G newtwork using the Raspberry Pi module from Waveshare based on the SimCom 7080G modem device.
This project extends the capabilities of the company provided downloads and examples for international connection.
Follows basic configuration for manual APN as explained in SimCom application notes.
Replace the text YOURAPNNAME with the text string provided by AT&T as per their application note.

The default Unix python examples have been converted to Windows.
The Python examples run a complete configuration on the US based 4G network of AT&T
From the SimCom website the AT&T network is 4G LTE-M (CTE-M) with is "310410" on bands 2, 8, 12.
The device is configured using "AT" commands over serial port operating at 115200 baud.
For testing purposes a complete Windows based Python driver was devloped.
For field testing Arduino based C-code for an Adafruit Feather.

Example 1: Automatic configuration and ping
Example 2: GPS polling
Example 3: FTP transfer
