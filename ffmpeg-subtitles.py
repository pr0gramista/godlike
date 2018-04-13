"""Use ffmpeg to hardbake subtitles into video."""

import os
import sys


def print_help():
    print(
        "{}\n"
        "-s [size]\n"
        "-i -interactive\n"
        "[path to video] [path to subtitles] [output file]".format(sys.argv[0]))


if '-i' in sys.argv or '-interactive' in sys.argv:
    print("ffmpeg-subtitles")

    video_path = input("Path to video: ")
    subs_path = input("Path to subtitles: ")
    output = input("Output file: ")

    try:
        size = int(input("Font size (default 24): "))
    except ValueError:
        size = 24

    os.system('ffmpeg -i {} -vf subtitles={}:force_style="Fontsize={}" {}'
              .format(video_path, subs_path, size, output))
elif '-h' in sys.argv or '-help' in sys.argv or len(sys.argv) == 1:
    print_help()
else:
    try:
        size = 24
        if '-s' in sys.argv:
            size_index = sys.argv.index('-s') + 1
            if len(sys.argv) > size_index:
                size = int(sys.argv[size_index])

        video_path = sys.argv[-3]
        subs_path = sys.argv[-2]
        output = sys.argv[-1]
        os.system('ffmpeg -i {} -vf subtitles={}:force_style="Fontsize={}" {}'
                  .format(video_path, subs_path, size, output))
    except Exception as e:
        print_help()
