# Screen
```
screen -S [name] creates new session
# To end screen type 'exit'
# To detach press Ctrl+A and then Ctrl+D.

# Show sessions
screen -ls

# Restore session
screen -r [name]

# Creates new session and runs command inside it fe. screen -dmS memes java -jar memes-api.jar
screen -dmS [name] [command]

# Attach to a not detached screen
screen -x [name] 

# Kill session
screen -S [name] -X quit
```
