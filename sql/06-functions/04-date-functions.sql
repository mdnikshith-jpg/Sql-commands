-- =========================================================
-- DATE/TIME FUNCTIONS (MySQL)
-- =========================================================

USE sql_learning;

SELECT CURDATE() AS current_date_value;
SELECT CURTIME() AS current_time_value;
SELECT NOW() AS current_datetime;

SELECT YEAR(CURDATE()) AS current_year;
SELECT MONTH(CURDATE()) AS current_month;
SELECT DAY(CURDATE()) AS current_day;
SELECT DAYNAME(CURDATE()) AS day_name;
SELECT MONTHNAME(CURDATE()) AS month_name;

SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY) AS date_after_7_days;
SELECT DATE_SUB(CURDATE(), INTERVAL 7 DAY) AS date_before_7_days;

SELECT DATEDIFF('2026-12-31', '2026-01-01') AS days_between;

SELECT TIMESTAMPDIFF(YEAR, '2005-01-01', CURDATE()) AS years_passed;

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS formatted_date;

SELECT hire_date,
       DATE_FORMAT(hire_date, '%d %M %Y') AS readable_hire_date
FROM employees;
