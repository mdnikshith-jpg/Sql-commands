-- =========================================================
-- 11 TRANSACTIONS
-- START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT
-- =========================================================

USE sql_learning;

-- See original value
SELECT student_id, city
FROM students
WHERE student_id = 1;

-- Start transaction
START TRANSACTION;

UPDATE students
SET city = 'Transaction City'
WHERE student_id = 1;

-- See uncommitted change in this session
SELECT student_id, city
FROM students
WHERE student_id = 1;

-- Undo the transaction
ROLLBACK;

-- Verify original value is back
SELECT student_id, city
FROM students
WHERE student_id = 1;

-- Transaction with SAVEPOINT
START TRANSACTION;

UPDATE students
SET city = 'City A'
WHERE student_id = 1;

SAVEPOINT point_a;

UPDATE students
SET city = 'City B'
WHERE student_id = 2;

-- Undo only changes after point_a
ROLLBACK TO point_a;

COMMIT;

-- Reset the demo rows for repeatable learning
UPDATE students SET city = 'Bengaluru' WHERE student_id = 1;
UPDATE students SET city = 'Mysuru' WHERE student_id = 2;
