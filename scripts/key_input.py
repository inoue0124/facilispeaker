from pynput.keyboard import Key, Listener
import os

def on_press(key):
    try:
        print('alphanumeric key {0} pressed'.format(key.char))
        if key.char == "q":
            os.system('play ./speech/command/praise/praise00.mp3')
        elif key.char == "w":
            os.system('play ./speech/command/praise/praise01.mp3')
        elif key.char == "e":
            os.system('play ./speech/command/praise/praise02.mp3')
        elif key.char == "r":
            os.system('play ./speech/command/praise/praise03.mp3')
        elif key.char == "t":
            os.system('play ./speech/command/praise/praise04.mp3')
        elif key.char == "y":
            os.system('play ./speech/command/praise/praise05.mp3')
        elif key.char == "u":
            os.system('play ./speech/command/praise/praise06.mp3')
        elif key.char == "i":
            os.system('play ./speech/command/praise/praise07.mp3')
        elif key.char == "o":
            os.system('play ./speech/command/praise/praise08.mp3')
        elif key.char == "p":
            os.system('play ./speech/command/praise/praise09.mp3')

        elif key.char == "a":
            os.system('play ./speech/command/blame/blame00.mp3')
        elif key.char == "s":
            os.system('play ./speech/command/blame/blame01.mp3')
        elif key.char == "d":
            os.system('play ./speech/command/blame/blame02.mp3')
        elif key.char == "f":
            os.system('play ./speech/command/blame/blame03.mp3')
        elif key.char == "g":
            os.system('play ./speech/command/blame/blame04.mp3')
        elif key.char == "h":
            os.system('play ./speech/command/blame/blame05.mp3')
        elif key.char == "j":
            os.system('play ./speech/command/blame/blame06.mp3')
        elif key.char == "k":
            os.system('play ./speech/command/blame/blame07.mp3')
        elif key.char == "l":
            os.system('play ./speech/command/blame/blame08.mp3')


    except AttributeError:
        print('special key {0} pressed'.format(key))
        if key == Key.esc:
            exit()

if __name__ == '__main__':

    with Listener(
        on_press = on_press,
    ) as listener:
        listener.join()
