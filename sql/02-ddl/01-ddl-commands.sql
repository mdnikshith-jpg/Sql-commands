-- =========================================================
-- 02 DDL: CREATE, ALTER, DROP, TRUNCATE, RENAME
-- =========================================================

USE sql_learning;

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS ddl_demo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT
);

-- ADD COLUMN
ALTER TABLE ddl_demo
ADD email VARCHAR(100);

-- ADD MULTIPLE COLUMNS
ALTER TABLE ddl_demo
ADD city VARCHAR(50),
ADD created_on DATE;

-- MODIFY COLUMN
ALTER TABLE ddl_demo
MODIFY name VARCHAR(100) NOT NULL;

-- RENAME COLUMN
ALTER TABLE ddl_demo
RENAME COLUMN city TO hometown;

-- CHANGE COLUMN (MySQL)
ALTER TABLE ddl_demo
CHANGE hometown city VARCHAR(50);

-- DROP COLUMN
ALTER TABLE ddl_demo
DROP COLUMN email;

-- RENAME TABLE
RENAME TABLE ddl_demo TO ddl_demo_renamed;

-- Empty all rows while keeping structure
TRUNCATE TABLE ddl_demo_renamed;

-- Remove the table completely
DROP TABLE ddl_demo_renamed;
