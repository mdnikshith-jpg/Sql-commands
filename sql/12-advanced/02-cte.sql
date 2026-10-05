-- =========================================================
-- COMMON TABLE EXPRESSIONS (CTE)
-- MySQL 8.0+
-- =========================================================

USE sql_learning;

-- Simple CTE
WITH high_mark_students AS (
    SELECT enrollment_id, marks
    FROM marks
    WHERE marks >= 80
)
SELECT *
FROM high_mark_students;

-- CTE with joins
WITH student_scores AS (
    SELECT s.student_id,
           CONCAT(s.first_name, ' ', s.last_name) AS full_name,
           AVG(m.marks) AS average_marks
    FROM students s
    JOIN enrollments e ON e.student_id = s.student_id
    JOIN marks m ON m.enrollment_id = e.enrollment_id
    GROUP BY s.student_id, s.first_name, s.last_name
)
SELECT *
FROM student_scores
WHERE average_marks >= 80
ORDER BY average_marks DESC;

-- Multiple CTEs
WITH student_scores AS (
    SELECT s.student_id,
           CONCAT(s.first_name, ' ', s.last_name) AS full_name,
           AVG(m.marks) AS average_marks
    FROM students s
    JOIN enrollments e ON e.student_id = s.student_id
    JOIN marks m ON m.enrollment_id = e.enrollment_id
    GROUP BY s.student_id, s.first_name, s.last_name
), top_students AS (
    SELECT *
    FROM student_scores
    WHERE average_marks >= 85
)
SELECT *
FROM top_students
ORDER BY average_marks DESC;
