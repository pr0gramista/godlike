# curl

Sending POST with FormData including file
```
curl -X POST \
-F 'key=75f35ff0-7ef5-45d2-b96a-37cf43e9e518' \
-F 'file=@~/myfile.mov' https://s3.amazonaws.com/my-super-bucket
```