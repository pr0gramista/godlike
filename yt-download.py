"""Downloads YouTube video/playlist in highest quality as mp4.

Requires youtube-dl
"""

import os
import sys

formats = {
    '1': '%(title)s.%(ext)s',
    '2': '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s',
    '3': '%(id)s.%(ext)s',
    '4': '%(playlist)s/%(title)s.%(ext)s'
}

formats_long = {
    'standard': '%(title)s.%(ext)s',
    'album': '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s',
    'id': '%(id)s.%(ext)s',
    'playlist': '%(playlist)s/%(title)s.%(ext)s'
}


def print_help():
    print(
        "{}\n"
        "-i -interactive\n"
        "-f -format [standard, album, id, playlist]\n"
        "[url]".format(sys.argv[0]))


# Interactive mode
if '-i' in sys.argv or '-interactive' in sys.argv:
    print("YouTube download")
    print("Provide url (single video or playlist):")
    url = input()

    print("Select output format:")
    print("1. Standard")
    print("2. Album")
    print("3. ID")
    print("4. Playlist")
    style = input()

    if style in formats:
        output_format = formats[style]
    else:
        output_format = formats['1']

    os.system("youtube-dl -f mp4 -i -o \"{}\" {}".format(output_format, url))
elif '-h' in sys.argv or '-help' in sys.argv or len(sys.argv) == 1:
    print_help()
else:
    try:
        format = 'standard'
        if '-f' in sys.argv:
            format_index = sys.argv.index('-f') + 1
            if len(sys.argv) > format_index:
                format = sys.argv[format_index]

        url = sys.argv[-1]
        output_format = formats_long[format]

        os.system("youtube-dl -f mp4 -i -o \"{}\" {}".format(output_format, url))
    except Exception as e:
        print_help()
