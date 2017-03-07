#
# Downloads YouTube video/playlist in
# highest audio quality and converts it to mp3
# Requires youtube-dl, ffprobe and ffmpeg
#

import os

print("YouTube mp3 download")
print("Provide url (single video or playlist):")
url = input()

print("Select output format:")
print("1. Standard")
print("2. Album")
print("3. ID")
style = input()

formats = {
	'1': '%(title)s.%(ext)s',
	'2': '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s',
	'3': '%(id)s.%(ext)s'
}

if style in formats:
	output_format = formats[style]
else:
	output_format = formats['1']

os.system("youtube-dl -x -i -o \"{}\" --audio-format mp3 --audio-quality 0 {}".format(output_format, url))
