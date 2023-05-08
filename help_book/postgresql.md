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
```

```sql
# Set password
ALTER USER username WITH PASSWORD 'password';

# Creating user
CREATE USER wow WITH PASSWORD 'securepassword';

# Select elements from `files` table where JSONB `metadata` field is not empty or null
# More functions: https://www.postgresql.org/docs/9.3/functions-json.html
SELECT * FROM public.files
WHERE json_array_length("metadata"->'errors') > 1
LIMIT 1;
```
