# SQL Quick Cheat Sheet

## Database

```sql
CREATE DATABASE database_name;
SHOW DATABASES;
USE database_name;
DROP DATABASE database_name;
```

## Table

```sql
CREATE TABLE table_name (...);
SHOW TABLES;
DESC table_name;
ALTER TABLE table_name ADD column_name VARCHAR(50);
ALTER TABLE table_name DROP COLUMN column_name;
TRUNCATE TABLE table_name;
DROP TABLE table_name;
RENAME TABLE old_name TO new_name;
```

## Data

```sql
INSERT INTO table_name (col1, col2) VALUES (value1, value2);
SELECT * FROM table_name;
UPDATE table_name SET col1 = value1 WHERE id = 1;
DELETE FROM table_name WHERE id = 1;
```

## Filtering

```sql
WHERE
AND
OR
NOT
IN
NOT IN
BETWEEN
LIKE
IS NULL
IS NOT NULL
ORDER BY
LIMIT
OFFSET
```

## Aggregation

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
```

## Joins

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
CROSS JOIN
SELF JOIN
```

## Constraints

```sql
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
DEFAULT
CHECK
AUTO_INCREMENT
```

## Advanced

```sql
UNION
UNION ALL
CASE
EXISTS
SUBQUERY
VIEW
INDEX
START TRANSACTION
COMMIT
ROLLBACK
SAVEPOINT
WITH
ROW_NUMBER()
RANK()
DENSE_RANK()
```
