-- =========================================================
-- 10 VIEWS AND INDEXES
-- =========================================================

USE sql_learning;

-- Create a view
CREATE OR REPLACE VIEW student_department_view AS
SELECT s.student_id,
       CONCAT(s.first_name, ' ', s.last_name) AS full_name,
       d.department_name,
       s.city
FROM students s
LEFT JOIN departments d
    ON s.department_id = d.department_id;

-- Query the view
SELECT *
FROM student_department_view;

-- Another view for marks
CREATE OR REPLACE VIEW student_marks_view AS
SELECT s.student_id,
       CONCAT(s.first_name, ' ', s.last_name) AS full_name,
       sub.subject_name,
       m.marks
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN subjects sub ON sub.subject_id = e.subject_id
JOIN marks m ON m.enrollment_id = e.enrollment_id;

SELECT * FROM student_marks_view;

-- Create an index
CREATE INDEX idx_students_city
ON students(city);

CREATE INDEX idx_marks_score
ON marks(marks);

-- Show indexes
SHOW INDEX FROM students;
SHOW INDEX FROM marks;

-- Drop indexes
DROP INDEX idx_students_city ON students;
DROP INDEX idx_marks_score ON marks;

-- Drop views
DROP VIEW student_department_view;
DROP VIEW student_marks_view;
