Raspberry Pi had great doc at [https://www.raspberrypi.org/documentation/linux/usage/systemd.md](https://www.raspberrypi.org/documentation/linux/usage/systemd.md) but now it is gone. Here's the copy:

# The systemd Daemon
Edit this on GitHub

In order to have a command or program run when the Raspberry Pi boots, you can add it as a service. Once this is done, you can start/stop enable/disable from the linux prompt.

Creating a Service
On your Raspberry Pi, create a .service file for your service, for example: myscript.service
```shell
[Unit]
Description=My service
After=network.target

[Service]
ExecStart=/usr/bin/python3 -u main.py
WorkingDirectory=/home/pi/myscript
StandardOutput=inherit
StandardError=inherit
Restart=always
User=pi

[Install]
WantedBy=multi-user.target
```
So in this instance, the service would run Python 3 from our working directory /home/pi/myscript which contains our python program to run main.py. But you are not limited to Python programs: simply change the ExecStart line to be the command to start any program or script that you want running from booting.

Copy this file into /etc/systemd/system as root, for example:
```shell
sudo cp myscript.service /etc/systemd/system/myscript.service
```
Once this has been copied, you have to inform systemd that a new service has been added. This is done with the following command:
```shell
sudo systemctl daemon-reload
```
Now you can attempt to start the service using the following command:
```shell
sudo systemctl start myscript.service
```
Stop it using following command:
```shell
sudo systemctl stop myscript.service
```
When you are happy that this starts and stops your app, you can have it start automatically on reboot by using this command:
```shell
sudo systemctl enable myscript.service
```
The systemctl command can also be used to restart the service or disable it from boot up.