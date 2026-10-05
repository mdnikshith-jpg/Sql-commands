-- =========================================================
-- 06 FUNCTIONS: AGGREGATE FUNCTIONS
-- =========================================================

USE sql_learning;

-- COUNT rows
SELECT COUNT(*) AS total_students
FROM students;

-- COUNT non-NULL values
SELECT COUNT(email) AS students_with_email
FROM students;

-- SUM
SELECT SUM(marks) AS total_marks
FROM marks;

-- AVG
SELECT AVG(marks) AS average_marks
FROM marks;

-- MIN
SELECT MIN(marks) AS minimum_marks
FROM marks;

-- MAX
SELECT MAX(marks) AS maximum_marks
FROM marks;

-- Aggregates by group
SELECT semester,
       COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY semester;

-- Average marks per semester
SELECT e.semester,
       AVG(m.marks) AS average_marks
FROM enrollments e
JOIN marks m ON m.enrollment_id = e.enrollment_id
GROUP BY e.semester;

-- HAVING filters groups
SELECT e.semester,
       AVG(m.marks) AS average_marks
FROM enrollments e
JOIN marks m ON m.enrollment_id = e.enrollment_id
GROUP BY e.semester
HAVING AVG(m.marks) >= 80;
