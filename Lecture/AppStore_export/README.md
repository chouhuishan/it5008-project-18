## Postgres config

username: shan
password: postgres
host: localhost
port: 5432
db_name: lecturedb

## Create schema 

```sql
CREATE SCHEMA IF NOT EXISTS app_store; 
SET search_path TO app_store;
```

Select code block and use cmd EE
After CREATE is successfully executed, go to PGAdmin and refresh
Check if tables is created in PGAdmin