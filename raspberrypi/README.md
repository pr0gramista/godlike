# Raspberry Pi Setup
## Before you even boot
Set all necessary options in RPi Imager like SSH, hostname, username and password, WiFi access.

## OctoPrint
[Good forum post](https://community.octoprint.org/t/setting-up-octoprint-on-a-raspberry-pi-running-raspbian-or-raspberry-pi-os/2337)

```
# Add user octo
sudo useradd -m -r octo

# Append (-a) groups (-G) to octo user
# dialout gives access to serial
sudo usermod -a -G dialout octo
# video gives access to vcgencmd so OctoPrint get check for throtling (whatever that means)
sudo usermod -a -G video octo\

# See groups at https://wiki.debian.org/SystemGroups
# Ensure groups by
groups octo
# Should output: octo : octo dialout video

# Sign in as octo
sudo su octo

# As octo user
cd ~
python3 -m venv OctoPrint
OctoPrint/bin/pip install OctoPrint
./OctoPrint/bin/octoprint serve
# Go and complete the setup on OctoPrint - port 5000
# Install temperature readigs fix plugin for Ender 3

exit
```

Then create a service file octoprint.service
```
[Unit]
Description=The snappy web interface for your 3D printer
After=network-online.target
Wants=network-online.target

[Service]
Environment="LC_ALL=C.UTF-8"
Environment="LANG=C.UTF-8"
Type=exec
User=octo
ExecStart=/home/octo/OctoPrint/bin/octoprint

[Install]
WantedBy=multi-user.target
```
Then move it to services
```
sudo mv octoprint.service /etc/systemd/system/octoprint.service
# Start it
sudo systemctl start octoprint.service
```

## Nextcloud
Based mostly on [this post](http://unixetc.co.uk/2016/11/20/simple-nextcloud-installation-on-raspberry-pi/) with some little tweaks

```
sudo apt-get update
sudo apt-get install apache2
sudo apt-get -y install php php-gd sqlite3 php-sqlite3 php-curl php-zip php-xml php-mbstring libapache2-mod-php
sudo systemctl restart apache2

# Install Nextcloud
cd /var/www/html
sudo wget wget https://download.nextcloud.com/server/releases/latest.zip
sudo unzip -q latest.zip
sudo rm latest.zip

# Create data folder
sudo mkdir -p /var/nextcloud/data
sudo chown www-data:www-data /var/nextcloud/data
sudo chmod 750 /var/nextcloud/data

# Fix permissions on Nextcloud folders
cd /var/www/html/nextcloud
sudo chown www-data:www-data config apps

# Go http://IP/nextcloud and complete the installation
# Note that we are using custom location for data - I had to manually specify it in installer
```

## Home Assistant
This works on Raspberry Pi with Docker installed.
```
sudo docker run -d \
--name homeassistant \
--privileged \
--restart=unless-stopped \
-e TZ=Europe/Warsaw \
-v /home/caveman/homeconfig:/config \
--network=host \
ghcr.io/home-assistant/home-assistant:stable
```
Replace `/home/caveman/homeconfig` with your path to your config directory (can be empty).

Note: sudo is required for rootless install - this can be probably avoided with [post install steps](https://docs.docker.com/engine/install/linux-postinstall/).

The app should be ready to setup at port 8123.

### Configuration
Home Assistant will create `configuration.yaml` file in the config directory.

### Debug
Run bash inside container
```
docker exec -it homeassistant bash
```

### Using File device
Considering JSON file `{"temperature": 26, "humidity": 44}` (dht.json).

The value template is:
```
{{ value_json.temperature }}
```

In configuration.yaml I added, but not sure if that is necessary.
```
homeassistant:
  allowlist_external_dirs:
    - "/config"
```