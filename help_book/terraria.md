# Terraria Setup

## VPS
1. Create new VPS on OVH with Debian (Docker)
2. Add public SSH key
3. You'll find password in the installation email
4. Login, create new password

## Create world
Run as interactive mode:
```bash
mkdir worlds
docker run -it --rm -p 7777:7777 -v ./worlds:/root/.local/share/Terraria/Worlds ryshe/terraria:vanilla-1.4.5.6
mkdir config
touch config/serverconfig.txt
nano config/serverconfig.txt
```

Paste this config:

```conf
# Use the command 'TerrariaServer -config serverconfig.txt' to use this configuration.
# Please report crashes by emailing crashlog.txt to <support@terraria.org>.

# Sets the max number of players allowed on a server. Value must be between 1 and 255.
maxplayers=8

# Set the port number
port=7777

# Set the server password.
password=superhaslo

# Set the message of the day.
motd=Hello there

# Sets the folder where world files will be stored.
worldpath=/root/.local/share/Terraria/Worlds/

# The location of the banlist. Defaults to banlist.txt in the working directory.
banlist=banlist.txt

# Adds addition cheat protection.
secure=1

# Sets the server language from its language code. 
# Available codes:
#   en-US = English
#   de-DE = German
#   it-IT = Italian
#   fr-FR = French
#   es-ES = Spanish
#   ru-RU = Russian
#   zh-Hans = Chinese
#   pt-BR = Portuguese
#   pl-PL = Polish
language=pl-PL

# Automatically forward ports with uPNP.
#upnp=1

# Reduces enemy skipping but increases bandwidth usage. The lower the number the less skipping will happen, but more data is sent. 0 is off.
#npcstream=60

# Default system priority 0:Realtime, 1:High, 2:AboveNormal, 3:Normal, 4:BelowNormal, 5:Idle
#priority=1

# Journey mode power permissions for every individual power. 0: Locked for everyone, 1: Can only be changed by host, 2: Can be changed by everyone
#journeypermission_time_setfrozen=2
#journeypermission_time_setdawn=2
#journeypermission_time_setnoon=2
#journeypermission_time_setdusk=2
#journeypermission_time_setmidnight=2
#journeypermission_godmode=2
#journeypermission_wind_setstrength=2
#journeypermission_rain_setstrength=2
#journeypermission_time_setspeed=2
#journeypermission_rain_setfrozen=2
#journeypermission_wind_setfrozen=2
#journeypermission_increaseplacementrange=2
#journeypermission_setdifficulty=2
#journeypermission_biomespread_setfrozen=2
#journeypermission_setspawnrate=2
```

Let's say you made a world called SunnyVillage.wld.

## Terraria Server
Create file `compose.yml` with the following contents:
```yml
services:
  terraria:
    container_name: terraria
    image: ryshe/terraria:vanilla-1.4.5.6
    stdin_open: true
    tty: true
    environment:
      - WORLD_FILENAME=SunnyVillage.wld
      - CONFIGPATH=/config
    ports:
      - 7777:7777
    volumes:
      - "./worlds:/root/.local/share/Terraria/Worlds"
      - "./config:/config"
    restart: unless-stopped
```

Run `docker compose up -d`. Check logs for any errors.

Enjoy.
