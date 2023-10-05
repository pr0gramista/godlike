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

# Copy files over ssh
scp -r /path/to/local/dir user@host:/path/to/remote/dir

# Background jobs (Ctrl+Z to go background)
jobs
bg [job_number]
fg [job_number]
```