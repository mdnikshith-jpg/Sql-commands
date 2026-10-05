-- =========================================================
-- 01 BASICS: DATABASE AND TABLE COMMANDS
-- =========================================================

-- Create a database
CREATE DATABASE IF NOT EXISTS demo_db;

-- List databases
SHOW DATABASES;

-- Select a database
USE sql_learning;

-- List tables
SHOW TABLES;

-- Describe a table
DESC students;
DESCRIBE students;

-- Show the SQL used to create a table
SHOW CREATE TABLE students;

-- Create a simple table
CREATE TABLE IF NOT EXISTS demo_students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Rename a table
RENAME TABLE demo_students TO demo_students_renamed;

-- Drop the demo table
DROP TABLE demo_students_renamed;

-- Drop the demo database when you no longer need it
-- DROP DATABASE demo_db;
