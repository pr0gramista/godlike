# Mongo

```
mongodump "mongodb+srv://username:password@trololololo.mongodb.net/my-db"

# Restore everything (from dump directory)
mongorestore "mongodb://test:test@localhost:27017"

# Restore single collection
mongorestore "mongodb://test:test@localhost:27017/my-db?authSource=admin" dump/my-db/contents.bson

# Connect and do stuff
mongosh "mongodb://test:test@localhost:27017"
show dbs
use my-db
show tables
db.users.find({ id: "X9oY2dFJZsb8OS9BCXYWHt0PlTD3" })
db.contents.find({ ownerId: "X9oY2dFJZsb8OS9BCXYWHt0PlTD3" })
db.contents.deleteMany({})

# You can use JavaScript things
JSON.stringify(db.contents.findOne({}))
```
