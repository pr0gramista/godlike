# Docker
## Commands
```
# Build, notice the dot at the end
docker build -t name_of_image .

# List all containers
docker ps -a

# Kill all
docker kill $(docker ps -q)

# Run in detached mode
docker run -d name_of_image

# Run bash inside container
docker exec -it name_of_container bash

# Copy file from container to host
docker cp name_of_container:/app/workdone.log host_path_logs.txt

# Archive container image (it's usually big)
docker export name_of_container > container.tar

# Remove all images from this machine
docker image rm $(docker image ls -a -q)

# Remove all containers
docker rm $(docker ps -a -q)

# Attach volume with bind mounts (host directory to container directory)
docker run -v /host/wow:/container/wow ...

docker run --name test -it debian
# From docs: This example runs a container named test using the debian:latest image. The -it instructs Docker to
allocate a pseudo-TTY connected to the container’s stdin; creating an interactive bash shell in the container.

# Get id of container running your app
docker ps | grep my_awesome_app_run | awk '{print $1}'

# Get id of container running your app and connect to it by bash
docker exec -it $(docker ps | grep my_awesome_app_run | awk '{print $1}') bash 

# docker-compose build; docker-compose up; docker-compose down
dcb; dcup; dcdn

# Docker run and expose all EXPOSE ports
docker run -P my_app
```
## Example Dockerfile (notice no extension)

Basic Python 3
```
FROM python:3

WORKDIR /app

ADD . /app

ADD requirements.txt /

RUN pip install -r requirements.txt

CMD [ "python", "./workdone.py" ]
```
Golang with multi-stage build
```
FROM golang AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /app

# Stage 2 aka Runtime
FROM gcr.io/distroless/base-debian10

ENV GIN_MODE release

WORKDIR /

COPY --from=build /app /app

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/app"]
```

## Install on Raspberry Pi
```
curl -sSL https://get.docker.com | sh
sudo apt-get install -y uidmap
dockerd-rootless-setuptool.sh install

# Add to ~/.bashrc
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# This showed up after:
# [INFO] Installed docker.service successfully.
# [INFO] To control docker.service, run: `systemctl --user (start|stop|restart) docker.service`
# [INFO] To run docker.service on system startup, run: `sudo loginctl enable-linger caveman`
```

[Source](https://raspberrytips.com/docker-on-raspberry-pi/)
