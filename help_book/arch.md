# Arch Linux

## Running in Docker on macOS
The official image is only built for AMD64 platform.

[The unofficial image](https://hub.docker.com/r/ogarcia/archlinux) is available for ARM64. It can be run using the following command:
```sh
docker run -it --rm ogarcia/archlinux:devel bash
```

Then you can install the packages you need using pacman.
```sh
pacman -S git
```