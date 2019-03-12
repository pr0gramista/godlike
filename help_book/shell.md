# Tips and tricks for sh
```
# Run detached
python3 -m http.server &

# Using jq get JSON propert
echo {"hello": "me"} | jq .hello 
> "me"

echo {"hello": "me"} | jq -r .hello 
> me

# Redo command with sudo
sudo !!
```
