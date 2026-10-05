-- =========================================================
-- 08 CONSTRAINTS
-- PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL,
-- DEFAULT, CHECK, AUTO_INCREMENT
-- =========================================================

USE sql_learning;

CREATE TABLE constraints_demo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    age INT CHECK (age >= 18),
    status VARCHAR(20) DEFAULT 'Active',
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- Valid insert
INSERT INTO constraints_demo (username, age, department_id)
VALUES ('demo_user', 20, 1);

SELECT * FROM constraints_demo;

-- Uncomment to observe constraint errors
-- INSERT INTO constraints_demo (username, age) VALUES ('demo_user', 21); -- UNIQUE
-- INSERT INTO constraints_demo (username, age) VALUES (NULL, 21); -- NOT NULL
-- INSERT INTO constraints_demo (username, age) VALUES ('young_user', 15); -- CHECK
-- INSERT INTO constraints_demo (username, age, department_id) VALUES ('bad_fk', 21, 999); -- FOREIGN KEY

DROP TABLE constraints_demo;
