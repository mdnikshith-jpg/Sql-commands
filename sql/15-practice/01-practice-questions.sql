-- =========================================================
-- 15 PRACTICE QUESTIONS
-- Use the sql_learning database.
-- Try solving these without looking at the answers.
-- =========================================================

USE sql_learning;

-- BEGINNER
-- 1. Display all students.
-- 2. Display only first_name, last_name and city.
-- 3. Find students older than 20.
-- 4. Find students from Bengaluru.
-- 5. Sort students by age from highest to lowest.
-- 6. Display only the first 3 students.

-- INTERMEDIATE
-- 7. Count the total number of students.
-- 8. Find the average mark.
-- 9. Find the highest mark.
-- 10. Count students in each department.
-- 11. Display departments having more than 1 student.
-- 12. Find students whose name starts with 'R'.
-- 13. Join students with departments.
-- 14. Display each student's subject and marks.
-- 15. Find students whose mark is greater than the overall average mark.

-- ADVANCED
-- 16. Find the top 3 marks.
-- 17. Rank marks using RANK().
-- 18. Calculate each student's average marks.
-- 19. Display only students with average marks >= 80.
-- 20. Use a CTE to find top students.
-- 21. Create a view containing student names and departments.
-- 22. Create an index on students(city).
-- 23. Demonstrate COMMIT and ROLLBACK.
-- 24. Create a stored procedure that returns students from a department.
-- 25. Create a trigger that writes inserts into an audit table.

-- =========================================================
-- SAMPLE ANSWERS
-- =========================================================

-- 1
SELECT * FROM students;

-- 2
SELECT first_name, last_name, city
FROM students;

-- 3
SELECT * FROM students
WHERE age > 20;

-- 4
SELECT * FROM students
WHERE city = 'Bengaluru';

-- 5
SELECT * FROM students
ORDER BY age DESC;

-- 6
SELECT * FROM students
LIMIT 3;

-- 7
SELECT COUNT(*) AS total_students
FROM students;

-- 8
SELECT AVG(marks) AS average_mark
FROM marks;

-- 9
SELECT MAX(marks) AS highest_mark
FROM marks;

-- 10
SELECT department_id, COUNT(*) AS student_count
FROM students
GROUP BY department_id;

-- 11
SELECT department_id, COUNT(*) AS student_count
FROM students
GROUP BY department_id
HAVING COUNT(*) > 1;

-- 12
SELECT * FROM students
WHERE first_name LIKE 'R%';

-- 13
SELECT s.first_name, d.department_name
FROM students s
JOIN departments d
ON s.department_id = d.department_id;

-- 14
SELECT s.first_name, sub.subject_name, m.marks
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN subjects sub ON sub.subject_id = e.subject_id
JOIN marks m ON m.enrollment_id = e.enrollment_id;

-- 15
SELECT *
FROM marks
WHERE marks > (SELECT AVG(marks) FROM marks);

-- 16
SELECT DISTINCT marks
FROM marks
ORDER BY marks DESC
LIMIT 3;

-- 17
SELECT marks,
       RANK() OVER (ORDER BY marks DESC) AS rank_no
FROM marks;

-- 18
SELECT s.student_id,
       CONCAT(s.first_name, ' ', s.last_name) AS full_name,
       AVG(m.marks) AS average_marks
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN marks m ON m.enrollment_id = e.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name;

-- 19
SELECT s.student_id,
       CONCAT(s.first_name, ' ', s.last_name) AS full_name,
       AVG(m.marks) AS average_marks
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN marks m ON m.enrollment_id = e.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING AVG(m.marks) >= 80;

-- 20
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
WHERE average_marks >= 85
ORDER BY average_marks DESC;
