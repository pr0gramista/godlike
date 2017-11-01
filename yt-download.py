"""Downloads YouTube video/playlist in highest quality as mp4.

Requires youtube-dl
"""

import os

print("YouTube download")
print("Provide url (single video or playlist):")
url = input()

print("Select output format:")
print("1. Standard")
print("2. Album")
print("3. ID")
print("4. Playlist")
style = input()

formats = {
    '1': '%(title)s.%(ext)s',
    '2': '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s',
    '3': '%(id)s.%(ext)s',
    '4': '%(playlist)s/%(title)s.%(ext)s'
}

if style in formats:
    output_format = formats[style]
else:
    output_format = formats['1']

os.system("youtube-dl -f mp4 -i -o \"{}\" {}".format(output_format, url))
