-- =========================================================
-- 09 SUBQUERIES AND EXISTS
-- =========================================================

USE sql_learning;

-- Scalar subquery: students older than average age
SELECT student_id, first_name, age
FROM students
WHERE age > (
    SELECT AVG(age)
    FROM students
);

-- Subquery with IN
SELECT first_name, last_name
FROM students
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name LIKE '%Engineering%'
);

-- Correlated subquery using EXISTS
SELECT s.student_id, s.first_name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.student_id
);

-- NOT EXISTS
SELECT s.student_id, s.first_name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.student_id
);

-- Highest mark
SELECT MAX(marks) AS highest_mark
FROM marks;

-- Rows having highest mark
SELECT *
FROM marks
WHERE marks = (
    SELECT MAX(marks)
    FROM marks
);
