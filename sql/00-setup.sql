-- =========================================================
-- SQL LEARNING DATABASE - SETUP
-- MySQL 8.0+
-- Run this file first.
-- =========================================================

DROP DATABASE IF EXISTS sql_learning;
CREATE DATABASE sql_learning;
USE sql_learning;

-- -------------------------
-- Departments
-- -------------------------
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO departments (department_name) VALUES
('Artificial Intelligence and Machine Learning'),
('Computer Science and Engineering'),
('Electronics and Communication Engineering'),
('Mechanical Engineering');

-- -------------------------
-- Students
-- -------------------------
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 16),
    gender VARCHAR(10),
    city VARCHAR(50),
    department_id INT,
    admission_year YEAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO students
(first_name, last_name, email, age, gender, city, department_id, admission_year)
VALUES
('Rahul', 'Sharma', 'rahul@example.com', 20, 'Male', 'Bengaluru', 1, 2025),
('Aisha', 'Khan', 'aisha@example.com', 19, 'Female', 'Mysuru', 2, 2025),
('Rohan', 'Patil', 'rohan@example.com', 21, 'Male', 'Hubballi', 1, 2024),
('Sneha', 'Rao', 'sneha@example.com', 20, 'Female', 'Bengaluru', 3, 2025),
('Amit', 'Verma', 'amit@example.com', 22, 'Male', 'Dharwad', 2, 2023),
('Priya', 'Nair', 'priya@example.com', 19, 'Female', 'Mangaluru', 1, 2025),
('Vikram', 'Joshi', 'vikram@example.com', 23, 'Male', 'Belagavi', 4, 2022),
('Neha', 'Das', 'neha@example.com', 20, 'Female', 'Bengaluru', 2, 2025);

-- -------------------------
-- Subjects
-- -------------------------
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_code VARCHAR(20) NOT NULL UNIQUE,
    subject_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits BETWEEN 1 AND 6)
);

INSERT INTO subjects (subject_code, subject_name, credits) VALUES
('AIML101', 'Python Programming', 4),
('AIML102', 'Mathematics', 4),
('AIML103', 'Database Management Systems', 4),
('AIML104', 'Computer Networks', 3),
('AIML105', 'Artificial Intelligence', 4);

-- -------------------------
-- Enrollments
-- -------------------------
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    semester INT NOT NULL CHECK (semester BETWEEN 1 AND 8),
    enrolled_on DATE DEFAULT (CURRENT_DATE),
    UNIQUE (student_id, subject_id, semester),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE
);

INSERT INTO enrollments (student_id, subject_id, semester) VALUES
(1, 1, 1), (1, 2, 1), (1, 3, 1),
(2, 1, 1), (2, 3, 1), (2, 4, 1),
(3, 1, 3), (3, 3, 3), (3, 5, 3),
(4, 2, 1), (4, 3, 1), (4, 4, 1),
(5, 1, 5), (5, 3, 5), (5, 5, 5),
(6, 1, 1), (6, 2, 1), (6, 5, 1),
(7, 3, 7), (7, 4, 7),
(8, 1, 1), (8, 3, 1), (8, 4, 1);

-- -------------------------
-- Marks
-- -------------------------
CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    exam_type VARCHAR(30) DEFAULT 'Semester',
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id) ON DELETE CASCADE
);

INSERT INTO marks (enrollment_id, marks, exam_type) VALUES
(1, 92, 'Semester'),
(2, 85, 'Semester'),
(3, 78, 'Semester'),
(4, 88, 'Semester'),
(5, 81, 'Semester'),
(6, 74, 'Semester'),
(7, 90, 'Semester'),
(8, 84, 'Semester'),
(9, 76, 'Semester'),
(10, 69, 'Semester'),
(11, 72, 'Semester'),
(12, 95, 'Semester'),
(13, 67, 'Semester'),
(14, 80, 'Semester'),
(15, 91, 'Semester'),
(16, 87, 'Semester'),
(17, 79, 'Semester'),
(18, 73, 'Semester'),
(19, 64, 'Semester'),
(20, 82, 'Semester'),
(21, 77, 'Semester'),
(22, 89, 'Semester');

-- -------------------------
-- Employees for SQL examples
-- -------------------------
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_name, manager_id, department_id, salary, hire_date) VALUES
('Anil', NULL, 1, 90000.00, '2020-01-15'),
('Bhavna', 1, 1, 65000.00, '2021-06-10'),
('Charan', 1, 2, 70000.00, '2022-02-20'),
('Deepa', 2, 1, 55000.00, '2023-09-05'),
('Eshan', 3, 2, 60000.00, '2024-01-12');

-- -------------------------
-- Useful inspection commands
-- -------------------------
SHOW DATABASES;
SHOW TABLES;
DESC departments;
DESC students;
DESC subjects;
DESC enrollments;
DESC marks;
DESC employees;
