from pynput.keyboard import Key, Listener
import os
import sys
args=sys.argv

cmd='play ./speech/command/'+args[1]+'/'
def on_press(key):
    try:
        print('alphanumeric key {0} pressed'.format(key.char))
        if key.char == "q":
            os.system(cmd +'praise00.wav')
        elif key.char == "w":
            os.system(cmd +'praise01.wav')
        elif key.char == "e":
            os.system(cmd +'praise02.wav')
        elif key.char == "r":
            os.system(cmd +'praise03.wav')
        elif key.char == "t":
            os.system(cmd +'praise04.wav')
        elif key.char == "y":
            os.system(cmd +'praise05.wav')
        elif key.char == "u":
            os.system(cmd +'praise06.wav')
        elif key.char == "i":
            os.system(cmd +'praise07.wav')
        elif key.char == "o":
            os.system(cmd +'praise08.wav')
        elif key.char == "p":
            os.system(cmd +'praise09.wav')

        elif key.char == "a":
            os.system(cmd +'blame00.wav')
        elif key.char == "s":
            os.system(cmd +'blame01.wav')
        elif key.char == "d":
            os.system(cmd +'blame02.wav')
        elif key.char == "f":
            os.system(cmd +'blame03.wav')
        elif key.char == "g":
            os.system(cmd +'blame04.wav')
        elif key.char == "h":
            os.system(cmd +'blame05.wav')
        elif key.char == "j":
            os.system(cmd +'blame06.wav')
        elif key.char == "k":
            os.system(cmd +'blame07.wav')
        elif key.char == "l":
            os.system(cmd +'blame08.wav')


    except AttributeError:
        print('special key {0} pressed'.format(key))
        if key == Key.ctrl:
            exit()

if __name__ == '__main__':

    with Listener(
        on_press = on_press,
    ) as listener:
        listener.join()
