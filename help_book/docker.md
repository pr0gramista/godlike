Example Dockerfile (notice no extension)
```
FROM python:3

WORKDIR /app

ADD . /app

ADD requirements.txt /

RUN pip install -r requirements.txt

CMD [ "python", "./workdone.py" ]
```
Commands
```
// Build, notice the dot at the end
docker build -t name_of_image .

// List all containers
docker ps -a

// Run in detached mode
docker run -d name_of_image

// Run bash inside container
docker exec -it name_of_container bash

// Copy file from container to host
docker cp name_of_container:/app/workdone.log host_path_logs.txt

// Archive container image (it's usually big)
docker export name_of_container > container.tar

// Remove all images from this machine
docker image rm $(docker image ls -a -q)

// Remove all containers
docker rm $(docker ps -a -q)

// Attach volume with bind mounts (host directory to container directory)
docker run -v /host/wow:/container/wow ...

docker run --name test -it debian
// Docs: This example runs a container named test using the debian:latest image. The -it instructs Docker to
allocate a pseudo-TTY connected to the container’s stdin; creating an interactive bash shell in the container.

// Get id of container running your app
docker ps | grep my_awesome_app_run | awk '{print $1}'

// Get id of contaienr running your app and connect to it by bash
docker exec -it $(docker ps | grep my_awesome_app_run | awk '{print $1}') bash 
