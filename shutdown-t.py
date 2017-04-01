import os, re

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

os.system("shutdown -s -t {}".format(time))
