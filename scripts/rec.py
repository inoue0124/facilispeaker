import subprocess

print("Start recording...")
p = subprocess.Popen(("rec", "-q", "out.wav"))

input("Enter to stop recording: ")
p.terminate()
try:
    p.wait(timeout=1)
except subprocess.TimeoutExpired:
    p.kill()

