# Use ffmpeg to hardbake subtitles
# Use ffmpeg to hardbake subtitles into video
import os

print("ffmpeg-subtitles")
video_path = input("Path to video: ")
subs_path = input("Path to subtitles: ")
output = input("Output file: ")
size = 24

try:
	size = int(input("Font size (default 24): "))
except ValueError:
	size = 24

os.system('ffmpeg -i {} -vf subtitles={}:force_style="Fontsize={}" {}'.format(video_path, subs_path, size, output))
