"""Convert any video file to mp4 with H264/AAC."""
import os
import sys


def print_help():
    print("{}\n"
          "-i -interactive\n"
          "[path to video] [output file]".format(sys.argv[0]))


if '-i' in sys.argv or '-interactive' in sys.argv:
    print("ffmpeg-to-mp4")
    f = input("Path to file:\n")
    o = input("Output file (with extension):\n")

    os.system('ffmpeg -i {} -vcodec h264 -acodec aac {}'.format(f, o))
elif '-h' in sys.argv or '-help' in sys.argv or len(sys.argv) == 1:
    print_help()
else:
    try:
        f = sys.argv[-2]
        o = sys.argv[-1]

        os.system('ffmpeg -i {} -vcodec h264 -acodec aac {}'.format(f, o))
    except Exception as e:
        print_help()
