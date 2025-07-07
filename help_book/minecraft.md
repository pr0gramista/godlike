# Minecraft Setup

## VPS
1. Create new VPS on OVH with Debian (Docker)
2. Add public SSH key
3. You'll find password in the installation email
4. Login, create new password

## Minecraft Server
Create file `compose.yml` with the following contents:
```yml
services:
  mc:
    restart: always
    image: itzg/minecraft-server:latest
    tty: true
    stdin_open: true
    ports:
      - "25565:25565"
    environment:
      EULA: "TRUE"
      VERSION: "1.21.7"
      MEMORY: "3072M"
      MOTD: "Mmmm Minecrafcik"
      ICON: "https://assets.turbofuro.com/mc.jpg"
      OPS: |-
        RoninSS
    volumes:
      - "./data:/data"
```

Run `docker compose up -d`. Check logs for any errors.

Enjoy.
