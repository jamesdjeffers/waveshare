# Uses SSH and SCP to login to a linux account, execute a bash script, and copy files to the local computer.

import sys
import os
from os import listdir
from os.path import isfile, join
import time

# Module for SSH login
import paramiko

# File parsing and combining
import select
import csv

# Modules for numerical data, time stamps, and file export
import numpy as np
import matplotlib.pyplot as plt
from drawnow import*

# The module that contains graphical objects
import tkinter as tk
# Other important Python libraries
import threading

server = ''
username = ''
password = ''
cmd_to_execute = ''

class fileBackup(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master)      # create window (frame)
        self.pack()                          # Defines window position
        self.createWidgets()                 # Run module createWidgets

        self.threads = list()
        
        self.ssh = paramiko.SSHClient()
        self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) 
        self.ssh.load_host_keys(os.path.expanduser(os.path.join("~", ".ssh", "known_hosts")))
        self.ssh.connect(server, username=username, password=password)

        self.dataCount = 0
        self.timeArray = np.zeros(250000)
        self.dataArray = np.zeros((15, 250000))

        self.fig = plt.figure()
        self.fig.canvas.mpl_connect('close_event', self.on_close)
        

    def createWidgets(self):
        self.clickHere = tk.Button(self)     # Click button for user action
        self.clickHere["text"] = "Run Auto Update\n(click here)"
        # What happens when you click the button
        self.clickHere["command"] = self.run_update
        self.clickHere.pack(side="top")      # Place button in the window

        self.Button1 = tk.Button(self)     # Click button for user action
        self.Button1["text"] = "Copy Files\n(click here)"
        # What happens when you click the button
        self.Button1["command"] = self.run_command
        self.Button1.pack(side="top")      # Place button in the window

        self.Button2 = tk.Button(self)     # Click button for user action
        self.Button2["text"] = "Copy Files\n(click here)"
        # What happens when you click the button
        self.Button2["command"] = self.copy_file
        self.Button2.pack(side="top")      # Place button in the window

        self.Button3 = tk.Button(self)     # Click button for user action
        self.Button3["text"] = "Combine Data\n(click here)"
        # What happens when you click the button
        self.Button3["command"] = self.file_append
        self.Button3.pack(side="top")      # Place button in the window

        self.Button4 = tk.Button(self)     # Click button for user action
        self.Button4["text"] = "Plot Data\n(click here)"
        # What happens when you click the button
        self.Button4["command"] = self.file_plot
        self.Button4.pack(side="top")      # Place button in the window

    def on_close(self, event):
        print("On Close")
        self.close_ssh

    def run_update(self):
        updateThread = threading.Thread(target=self.update_data, args=())
        self.threads.append(updateThread)
        updateThread.start()

    def update_data(self):
        while True:
            print('Updating Data')
            try:
                self.run_command()
                self.copy_file()
                self.file_append()
                self.file_plot()
            except:
                print('Download Error')
            time.sleep(60)

    def run_command(self):
        ssh_stdin, ssh_stdout, ssh_stderr = self.ssh.exec_command(cmd_to_execute)

        while not ssh_stdout.channel.exit_status_ready():
            # Only print data if there is data to read in the channel
            if ssh_stdout.channel.recv_ready():
                rl, wl, xl = select.select([ ssh_stdout.channel ], [ ], [ ], 0.0)
                if len(rl) > 0:
                    tmp = ssh_stdout.channel.recv(1024)
                    output = tmp.decode()
                    print(output)

    def copy_file(self):
        print('Copying Data')
        sftp = self.ssh.open_sftp()
        sftp.chdir('./test')
        ftpFiles = sftp.listdir()
        
        for file in range(0,len(ftpFiles)):
            localFile = 'data/' + ftpFiles[file]
            if not os.path.isfile(localFile):
                sftp.get(ftpFiles[file], localFile)
        sftp.close()

    def close_ssh(self):
        self.ssh.close()

    def file_append(self):
        print('Combining Data')
        with open('data/file_append.txt', 'w', newline='') as fileOutput:
            writer = csv.writer(fileOutput)
            onlyfiles = [f for f in listdir('data') if isfile(join('data', f))]
            for file in range(0,len(onlyfiles)):
                if onlyfiles[file].find('csv') > -1:
                    print(onlyfiles[file])
                    with open('data/' + onlyfiles[file], newline='') as f:
                        reader = csv.reader(f)
                        for row in reader:
                            #print(row)
                            #print(len(row))
                            writer.writerow(row)
                        f.close()
            fileOutput.close()

    def fig_plot(self):
        plt.plot(self.dataArray[0,:self.dataCount], 'ro-', label='First Sensor')
        plt.title('Live temperature sensor data')
        plt.grid(True)
        plt.ylabel('Data')
        plt.xlabel('Time')
        #plt.plot(self.dataArray[1,:])
        plt.plot(self.dataArray[1,:self.dataCount])

    def file_plot(self):
        try:
            with open('data/file_append.txt', 'r', newline='') as fileInput:
                print('Plotting Data')
                reader = csv.reader(fileInput)
                self.dataCount = 0
                for row in reader:
                    for i,v in enumerate(row):
                        #print (i,v)
                        if i == 1:
                            self.dataArray[0,self.dataCount] = float(v)
                        elif i == 14:
                            self.dataArray[1,self.dataCount] = float(v)                            
                    self.dataCount+=1
            
            drawnow(self.fig_plot, stop_on_close=False)
            plt.pause(1)
            print("Plotted")
        except:
            print("Plotting failed")

root = tk.Tk()
app = fileBackup(master=root)
# Set the application window properties
app.master.title("Carbon Monoxide Data Trend Collection")
app.master.geometry("375x150")
app.master.maxsize(750,200)
app.mainloop()
