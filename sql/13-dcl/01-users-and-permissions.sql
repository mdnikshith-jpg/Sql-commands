-- =========================================================
-- 13 DCL: USERS AND PERMISSIONS
-- WARNING: Run these commands only when you have sufficient
-- MySQL privileges. Do not use real passwords in a public repo.
-- =========================================================

-- Create a demo user.
-- Replace the password with a local-only password.
CREATE USER IF NOT EXISTS 'sql_student'@'localhost'
IDENTIFIED BY 'ChangeThisPassword!123';

-- Give a user permission to read the learning database.
GRANT SELECT
ON sql_learning.*
TO 'sql_student'@'localhost';

-- Give more permissions.
GRANT INSERT, UPDATE, DELETE
ON sql_learning.*
TO 'sql_student'@'localhost';

-- Show permissions.
SHOW GRANTS FOR 'sql_student'@'localhost';

-- Remove one permission.
REVOKE DELETE
ON sql_learning.*
FROM 'sql_student'@'localhost';

-- Give all permissions on the learning database.
-- Use carefully.
-- GRANT ALL PRIVILEGES ON sql_learning.* TO 'sql_student'@'localhost';

-- Reload privilege tables when required by a manual privilege change.
-- FLUSH PRIVILEGES;

-- Change password.
-- ALTER USER 'sql_student'@'localhost'
-- IDENTIFIED BY 'NewLocalPassword!123';

-- Delete demo user when finished.
-- DROP USER 'sql_student'@'localhost';
