```
// Enter postgres user
sudo -i -u postgres

// Enter SQL
psql

// Run file with SQL commands using psql
psql -h localhost -U postgres -f my_sql_file

// Help for psql
\?

// List databases
\l

// Connect to database
\connect mybase

// List tables
\dt

// Inspect table
\d+ users

// List schemas
\dn

// Set password
```sql
ALTER USER username WITH PASSWORD 'password';
```

// Creating a Postgres user
```sql
CREATE USER wow WITH PASSWORD 'securepassword';
```

// Change schema
```sql
SET schema 'temp';
```

// Example table
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users(name) VALUES ('John Doe');
SELECT * FROM users;
```


# Select elements from `files` table where JSONB `metadata` field is not empty or null
# More functions: https://www.postgresql.org/docs/9.3/functions-json.html
SELECT * FROM public.files
WHERE json_array_length("metadata"->'errors') > 1
LIMIT 1;
```
