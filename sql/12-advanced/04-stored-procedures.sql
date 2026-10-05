-- =========================================================
-- STORED PROCEDURES
-- MySQL 8.0+
-- =========================================================

USE sql_learning;

DROP PROCEDURE IF EXISTS get_all_students;
DROP PROCEDURE IF EXISTS get_students_by_department;

DELIMITER //

CREATE PROCEDURE get_all_students()
BEGIN
    SELECT student_id,
           CONCAT(first_name, ' ', last_name) AS full_name,
           city
    FROM students
    ORDER BY student_id;
END //

CREATE PROCEDURE get_students_by_department(IN p_department_id INT)
BEGIN
    SELECT student_id,
           CONCAT(first_name, ' ', last_name) AS full_name,
           department_id
    FROM students
    WHERE department_id = p_department_id
    ORDER BY first_name;
END //

DELIMITER ;

-- Execute procedures
CALL get_all_students();
CALL get_students_by_department(1);

-- Show procedures
SHOW PROCEDURE STATUS
WHERE Db = 'sql_learning';

-- Remove procedures when finished
DROP PROCEDURE get_all_students;
DROP PROCEDURE get_students_by_department;
