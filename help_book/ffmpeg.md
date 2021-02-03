# ffmpeg


```
# Split video into segments
# Replace 30 after -segment_time with desired length (in seconds)
ffmpeg -i input.mp4 -acodec copy -f segment -segment_time 30 -vcodec copy -reset_timestamps 1 -map 0 fff%d.mp4

# Convert to mp4 H.264 AAC
ffmpeg -i {} -vcodec h264 -acodec aac {}
```

And also remember to check the full scripts:
- [cut](https://github.com/pr0gramista/godlike-scripts/blob/master/ffmpeg-cut.py)
- [to-mp4](https://github.com/pr0gramista/godlike-scripts/blob/master/ffmpeg-to-mp4.py)
- [hardbake subtitles](https://github.com/pr0gramista/godlike-scripts/blob/master/ffmpeg-subtitles.py)
