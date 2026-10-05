-- =========================================================
-- STRING FUNCTIONS (MySQL)
-- =========================================================

USE sql_learning;

SELECT UPPER(first_name) AS upper_name
FROM students;

SELECT LOWER(first_name) AS lower_name
FROM students;

SELECT LENGTH(first_name) AS name_length
FROM students;

SELECT CHAR_LENGTH(first_name) AS character_count
FROM students;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM students;

SELECT CONCAT_WS(' - ', first_name, city) AS student_location
FROM students;

SELECT SUBSTRING(first_name, 1, 3) AS first_three_characters
FROM students;

SELECT LEFT(first_name, 2) AS first_two
FROM students;

SELECT RIGHT(first_name, 2) AS last_two
FROM students;

SELECT TRIM('   hello   ') AS trimmed_text;

SELECT REPLACE(city, 'Bengaluru', 'Bangalore') AS city_name
FROM students;

SELECT LOCATE('a', first_name) AS position_of_a
FROM students;
