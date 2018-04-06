```
screen -S [name] creates new session
To end screen type 'exit'
To detach press Ctrl+A and then Ctrl+D.

screen -ls show sessions
screen -r [name] restore session
screen -dmS [name] [command] creates new session and runs command inside it

screen -x [name] attach to a not detached screen
screen -S [name] -X quit kill session
```
