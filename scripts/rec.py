import subprocess
import sys
argv=sys.argv

save_filename=argv[1]+".wav"
print("Start recording...")
p = subprocess.Popen(("rec", "-q", save_filename))

input("Enter to stop recording: ")
p.terminate()
try:
    p.wait(timeout=1)
except subprocess.TimeoutExpired:
    p.kill()

