# Uses SSH and SCP to login to a linux account, execute a bash script, and copy files to the local computer.

import sys
import os
from os import listdir
from os.path import isfile, join
import paramiko
import select
import csv

server = ''
username = ''
password = ''
cmd_to_execute = ''

class fileBackup:
    def __init__(self):
        self.ssh = paramiko.SSHClient()
        self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) 
        self.ssh.load_host_keys(os.path.expanduser(os.path.join("~", ".ssh", "known_hosts")))
        self.ssh.connect(server, username=username, password=password)

    def run_command(self, command):
        ssh_stdin, ssh_stdout, ssh_stderr = self.ssh.exec_command(command)

        while not ssh_stdout.channel.exit_status_ready():
            # Only print data if there is data to read in the channel
            if ssh_stdout.channel.recv_ready():
                rl, wl, xl = select.select([ ssh_stdout.channel ], [ ], [ ], 0.0)
                if len(rl) > 0:
                    tmp = ssh_stdout.channel.recv(1024)
                    output = tmp.decode()
                    print(output)

    def copy_file(self):

        sftp = self.ssh.open_sftp()
        sftp.chdir('./test')
        self.files = sftp.listdir()
        
        for file in range(0,len(self.files)):
            #if self.files[file].find
            sftp.get(self.files[file], 'data/' + self.files[file])
        sftp.close()

    def close_ssh(self):
        self.ssh.close()

    def file_append(self):
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

def main(args=None):
    if args is None:
        print ("arguments expected")
    else:
        # args = {'<ip_address>', <list_of_commands>}
        mytest = fileBackup()
        #mytest.run_cmd(host_ip=args[0], cmd_list=args[1])
        #mytest.run_command(cmd_to_execute)
        #mytest.copy_file()
        mytest.close_ssh()
        mytest.file_append()
    return


if __name__ == "__main__":
    main(sys.argv[1:])

