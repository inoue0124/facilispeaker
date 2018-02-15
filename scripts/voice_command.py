import socket
import xml.etree.ElementTree as ET
import os
import subprocess
import time
import sys
import re
args=sys.argv

host = '127.0.0.1' # localhost
port = 10500   # juliusサーバーモードのポート

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
                if re.match(r'スヌーズ\d分', word):
                    minute=re.search(r'\d', word).group()
                    voice='./speech/'+args[1]+'/snooze'+minute+'.wav'
                    os.system('play '+voice)
                    time.sleep(int(minute)*60)
                    sys.exit()
                print (word) 
                data = '' 

        else:
            data += str(client.recv(1024).decode('utf-8')) 

if __name__ == "__main__":
    main()
