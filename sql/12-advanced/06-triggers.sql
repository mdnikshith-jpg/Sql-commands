-- =========================================================
-- TRIGGERS
-- MySQL 8.0+
-- =========================================================

USE sql_learning;

DROP TRIGGER IF EXISTS before_student_insert;
DROP TRIGGER IF EXISTS after_mark_insert;
DROP TABLE IF EXISTS marks_audit;

-- Audit table
CREATE TABLE marks_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    mark_id INT,
    marks INT,
    action_name VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

-- BEFORE INSERT trigger example
CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    SET NEW.first_name = TRIM(NEW.first_name);
    SET NEW.last_name = TRIM(NEW.last_name);
END //

-- AFTER INSERT trigger example
CREATE TRIGGER after_mark_insert
AFTER INSERT ON marks
FOR EACH ROW
BEGIN
    INSERT INTO marks_audit (mark_id, marks, action_name)
    VALUES (NEW.mark_id, NEW.marks, 'INSERT');
END //

DELIMITER ;

-- Test BEFORE INSERT trigger
INSERT INTO students
(first_name, last_name, email, age, gender, city, department_id, admission_year)
VALUES
('  Test ', ' Student  ', 'trigger_test@example.com', 20, 'Male', 'Bengaluru', 1, 2026);

SELECT first_name, last_name
FROM students
WHERE email = 'trigger_test@example.com';

-- Test AFTER INSERT trigger
INSERT INTO marks (enrollment_id, marks, exam_type)
VALUES (1, 88, 'Internal Test');

SELECT *
FROM marks_audit
ORDER BY audit_id DESC;

-- Trigger metadata
SHOW TRIGGERS;

-- Clean up demo objects/rows
DELETE FROM students
WHERE email = 'trigger_test@example.com';

DROP TRIGGER before_student_insert;
DROP TRIGGER after_mark_insert;
DROP TABLE marks_audit;
