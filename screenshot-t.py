import os, re
from time import sleep

#pip install Pillow
from PIL import ImageGrab

print("Provide time:")
print("Format: Xh Xm Xs")

text = input()

hours_match = re.search('(\d+)h', text)
minutes_match = re.search('(\d+)m', text)
seconds_match = re.search('(\d+)s', text)

hours = 0
minutes = 0
seconds = 0

if hours_match is not None:
    hours = int(hours_match.group(1))
if minutes_match is not None:
    minutes = int(minutes_match.group(1))
if seconds_match is not None:
    seconds = int(seconds_match.group(1))

time = hours * 3600 + minutes * 60 + seconds
print('Seconds: ' + str(time))

print("File path to save screenshot")
filepath = input()

print('Sleeping...')
sleep(time)

im = ImageGrab.grab()
im.save(filepath)
print('Screenshot! Saved as ' + filepath)
