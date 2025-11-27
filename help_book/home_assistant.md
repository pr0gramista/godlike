# Home Assistant

## Docker
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

## Configuration
Home Assistant will create `configuration.yaml` file in the config directory.

## Debug
Run bash inside container
```
docker exec -it homeassistant bash
```

## Using File device
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