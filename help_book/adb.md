# adb
### Debugging over Wi-Fi
First connect phone via USB. Enable debugging.
```
# Get WiFi IP address
adb shell ip -f inet addr show wlan0
# Helps with connectivity issue
adb kill-server
adb tcpip 5555
adb connect 10.3.0.151:5555
```
[Stack Overflow topic](https://stackoverflow.com/questions/2604727/how-can-i-connect-to-android-with-adb-over-tcp)

### Reverse proxy
```
adb reverse tcp:8000 tcp:8000
```
