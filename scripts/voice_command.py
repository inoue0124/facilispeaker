import socket
import xml.etree.ElementTree as ET
import os
import subprocess
import time
import sys

host = '127.0.0.1' #localhost
port = 10500   #julisuサーバーモードのポート

def main():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((host, port)) 
    data = '' 
    print('マイクに向かって「OK」と言ってください。')
    while 1:
        if '</RECOGOUT>\n.' in data: 

            root = ET.fromstring('<?xml version="1.0"?>\n' \
                    + data[data.find('<RECOGOUT>'):].replace('\n.', ''))
            for whypo in root.findall('./SHYPO/WHYPO'):

                word = whypo.get('WORD')
                if word == 'OK':
                    sys.exit()
                    client.close()
                print (word) 
                data = '' 

        else:
            data += str(client.recv(1024).decode('utf-8')) 

if __name__ == "__main__":
    main()
