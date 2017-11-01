"""Convert any video file to mp4 with H264/AAC."""
import os

print("ffmpeg-to-mp4")
f = input("Path to file:\n")
o = input("Output file (with extension):\n")

os.system('ffmpeg -i {} -vcodec h264 -acodec aac {}'.format(f, o))
