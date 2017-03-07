#
# Uses ffmpeg to get fragment of
# a video file.
#

import os

print("ffmpeg-cut")
print("Time format: HH:MM:ss")
print("Path to file:")
f = input()
print("From:")
begin = input()
print("To:")
end = input()
print("Output file:")
output = input()

print("Method:")
print("1. Copy (the beginning may be corrupted)")
print("2. Encode")
method_index = input()

method_args = {
	'1': '-c copy',
	'2': ''
}

if method_index in method_args:
    method = method_args[method_index]
else:
	method = method_args['1']

os.system('ffmpeg -i \"{}\" -ss {} -t {} {} -async 1 \"{}\"'.format(f, begin, end, method, output))
