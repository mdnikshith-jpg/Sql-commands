-- =========================================================
-- 12 ADVANCED: CASE, EXISTS, UNION, UNION ALL
-- =========================================================

USE sql_learning;

-- CASE expression
SELECT first_name,
       last_name,
       CASE
           WHEN age < 20 THEN 'Teen'
           WHEN age BETWEEN 20 AND 21 THEN 'Young Adult'
           ELSE 'Adult'
       END AS age_group
FROM students;

-- CASE for grades
SELECT m.marks,
       CASE
           WHEN m.marks >= 90 THEN 'A+'
           WHEN m.marks >= 80 THEN 'A'
           WHEN m.marks >= 70 THEN 'B'
           WHEN m.marks >= 60 THEN 'C'
           ELSE 'F'
       END AS grade
FROM marks m;

-- EXISTS
SELECT s.student_id, s.first_name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.student_id
      AND e.semester = 1
);

-- UNION removes duplicates
SELECT city FROM students
UNION
SELECT 'Bengaluru';

-- UNION ALL keeps duplicates
SELECT city FROM students
UNION ALL
SELECT 'Bengaluru';
