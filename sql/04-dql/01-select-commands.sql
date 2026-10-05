-- =========================================================
-- 04 DQL: SELECT
-- =========================================================

USE sql_learning;

-- Select every column
SELECT * FROM students;

-- Select specific columns
SELECT student_id, first_name, last_name
FROM students;

-- Column aliases
SELECT first_name AS name,
       email AS email_address
FROM students;

-- Table alias
SELECT s.student_id, s.first_name
FROM students AS s;

-- DISTINCT values
SELECT DISTINCT city
FROM students;

-- DISTINCT combinations
SELECT DISTINCT city, department_id
FROM students;

-- Select calculated values
SELECT first_name, age, age + 1 AS age_next_year
FROM students;
