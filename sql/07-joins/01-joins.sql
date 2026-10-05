-- =========================================================
-- 07 JOINS
-- =========================================================

USE sql_learning;

-- INNER JOIN: only matching rows
SELECT s.student_id,
       s.first_name,
       d.department_name
FROM students s
INNER JOIN departments d
    ON s.department_id = d.department_id;

-- LEFT JOIN: all students + matching department
SELECT s.student_id,
       s.first_name,
       d.department_name
FROM students s
LEFT JOIN departments d
    ON s.department_id = d.department_id;

-- RIGHT JOIN: all departments + matching students
SELECT s.first_name,
       d.department_name
FROM students s
RIGHT JOIN departments d
    ON s.department_id = d.department_id;

-- CROSS JOIN: every student combined with every subject
SELECT s.first_name,
       sub.subject_name
FROM students s
CROSS JOIN subjects sub;

-- SELF JOIN: employee and manager
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;

-- Multi-table JOIN
SELECT s.first_name,
       s.last_name,
       sub.subject_name,
       m.marks
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN subjects sub ON sub.subject_id = e.subject_id
JOIN marks m ON m.enrollment_id = e.enrollment_id
ORDER BY s.student_id, sub.subject_id;
