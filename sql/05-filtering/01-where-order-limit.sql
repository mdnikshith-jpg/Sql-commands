-- =========================================================
-- 05 FILTERING: WHERE, AND, OR, NOT, LIKE, IN, BETWEEN,
-- NULL, ORDER BY, LIMIT, OFFSET
-- =========================================================

USE sql_learning;

-- WHERE with equality
SELECT * FROM students
WHERE age = 20;

-- Comparison operators: =, !=, <>, >, <, >=, <=
SELECT * FROM students
WHERE age >= 21;

SELECT * FROM students
WHERE age <> 20;

-- AND
SELECT * FROM students
WHERE age >= 20 AND city = 'Bengaluru';

-- OR
SELECT * FROM students
WHERE city = 'Bengaluru' OR city = 'Mysuru';

-- NOT
SELECT * FROM students
WHERE NOT city = 'Bengaluru';

-- IN
SELECT * FROM students
WHERE city IN ('Bengaluru', 'Mysuru', 'Dharwad');

-- NOT IN
SELECT * FROM students
WHERE city NOT IN ('Bengaluru', 'Mysuru');

-- BETWEEN (inclusive)
SELECT * FROM students
WHERE age BETWEEN 19 AND 21;

-- LIKE: starts with A
SELECT * FROM students
WHERE first_name LIKE 'A%';

-- LIKE: ends with a
SELECT * FROM students
WHERE first_name LIKE '%a';

-- LIKE: contains "ra"
SELECT * FROM students
WHERE first_name LIKE '%ra%';

-- Underscore = one character
SELECT * FROM students
WHERE first_name LIKE '_a%';

-- NULL checks
SELECT * FROM students
WHERE email IS NULL;

SELECT * FROM students
WHERE email IS NOT NULL;

-- Sort ascending
SELECT * FROM students
ORDER BY age ASC;

-- Sort descending
SELECT * FROM students
ORDER BY age DESC;

-- Sort by more than one column
SELECT * FROM students
ORDER BY city ASC, age DESC;

-- LIMIT
SELECT * FROM students
LIMIT 5;

-- LIMIT + OFFSET
SELECT * FROM students
LIMIT 3 OFFSET 2;
