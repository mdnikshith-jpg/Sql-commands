-- =========================================================
-- 03 DML: INSERT, UPDATE, DELETE
-- =========================================================

USE sql_learning;

-- INSERT one row
INSERT INTO students
(first_name, last_name, email, age, gender, city, department_id, admission_year)
VALUES
('Kiran', 'Kumar', 'kiran@example.com', 20, 'Male', 'Bengaluru', 1, 2026);

-- INSERT multiple rows
INSERT INTO students
(first_name, last_name, email, age, gender, city, department_id, admission_year)
VALUES
('Meera', 'Iyer', 'meera@example.com', 19, 'Female', 'Chennai', 2, 2026),
('Arjun', 'Menon', 'arjun@example.com', 21, 'Male', 'Kochi', 3, 2024);

-- UPDATE one row
UPDATE students
SET city = 'Mysuru'
WHERE student_id = 1;

-- UPDATE multiple columns
UPDATE students
SET city = 'Bengaluru', age = 21
WHERE student_id = 1;

-- DELETE one row
DELETE FROM students
WHERE email = 'arjun@example.com';

-- DELETE all rows (dangerous)
-- DELETE FROM students;
