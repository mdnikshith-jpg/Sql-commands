-- =========================================================
-- STORED FUNCTIONS
-- MySQL 8.0+
-- =========================================================

USE sql_learning;

DROP FUNCTION IF EXISTS grade_from_marks;

DELIMITER //

CREATE FUNCTION grade_from_marks(p_marks INT)
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_marks >= 90 THEN 'A+'
        WHEN p_marks >= 80 THEN 'A'
        WHEN p_marks >= 70 THEN 'B'
        WHEN p_marks >= 60 THEN 'C'
        ELSE 'F'
    END;
END //

DELIMITER ;

-- Use the function
SELECT 95 AS marks, grade_from_marks(95) AS grade;
SELECT 84 AS marks, grade_from_marks(84) AS grade;
SELECT 62 AS marks, grade_from_marks(62) AS grade;

-- Use it with a table
SELECT mark_id,
       marks,
       grade_from_marks(marks) AS grade
FROM marks;

DROP FUNCTION grade_from_marks;
