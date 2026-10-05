# SQL Commands and Examples

A beginner-friendly MySQL reference repository containing SQL commands from the basics to advanced topics, with runnable examples.

## Who is this for?

This repository is designed for beginners, college students, and anyone learning SQL/MySQL for Java projects, DBMS courses, interviews, or practice.

## Requirements

- MySQL Server 8.0+
- MySQL Workbench (recommended) or MySQL command-line client
- Git (only if you want to clone/push the repository)

## Repository Structure

```text
SQL-Commands-and-Examples/
├── README.md
├── cheat-sheet.md
└── sql/
    ├── 00-setup.sql
    ├── 01-basics/
    │   └── 01-database-table-commands.sql
    ├── 02-ddl/
    │   └── 01-ddl-commands.sql
    ├── 03-dml/
    │   └── 01-dml-commands.sql
    ├── 04-dql/
    │   └── 01-select-commands.sql
    ├── 05-filtering/
    │   └── 01-where-order-limit.sql
    ├── 06-functions/
    │   ├── 01-aggregate-functions.sql
    │   ├── 02-string-functions.sql
    │   ├── 03-numeric-functions.sql
    │   └── 04-date-functions.sql
    ├── 07-joins/
    │   └── 01-joins.sql
    ├── 08-constraints/
    │   └── 01-constraints.sql
    ├── 09-subqueries/
    │   └── 01-subqueries.sql
    ├── 10-views-indexes/
    │   └── 01-views-and-indexes.sql
    ├── 11-transactions/
    │   └── 01-transactions.sql
    └── 12-advanced/
        ├── 01-case-exists-union.sql
        ├── 02-cte.sql
        ├── 03-window-functions.sql
        ├── 04-stored-procedures.sql
        ├── 05-functions.sql
        └── 06-triggers.sql
```

## How to use it

### Step 1: Install MySQL

Install MySQL Server and optionally MySQL Workbench.

### Step 2: Open MySQL Workbench

Connect to your local MySQL server.

### Step 3: Run the setup file first

Open:

```text
sql/00-setup.sql
```

Run the complete file. It creates the `sql_learning` database and sample tables/data used by most examples.

### Step 4: Run examples by topic

After setup, open any SQL file and execute its statements.

### Command-line alternative

```bash
mysql -u root -p < sql/00-setup.sql
```

Then, for example:

```bash
mysql -u root -p sql_learning < sql/04-dql/01-select-commands.sql
```

## Main SQL Categories

| Category | Purpose | Commands |
|---|---|---|
| DDL | Structure | CREATE, ALTER, DROP, TRUNCATE, RENAME |
| DML | Data changes | INSERT, UPDATE, DELETE |
| DQL | Reading data | SELECT |
| DCL | Permissions | GRANT, REVOKE |
| TCL | Transactions | START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT |

## Important Topics

- Databases and tables
- INSERT, UPDATE, DELETE
- SELECT and aliases
- WHERE, AND, OR, NOT
- IN, BETWEEN, LIKE, NULL checks
- ORDER BY and LIMIT
- Aggregate functions
- GROUP BY and HAVING
- INNER, LEFT, RIGHT, CROSS and SELF joins
- Primary/foreign/unique keys
- NOT NULL, DEFAULT, CHECK, AUTO_INCREMENT
- Subqueries and EXISTS
- UNION and UNION ALL
- CASE expressions
- Views and indexes
- Transactions and savepoints
- CTEs
- Window functions
- Stored procedures
- Stored functions
- Triggers

## Safety note

The examples are for a learning database named `sql_learning`. Do not run destructive commands such as `DROP DATABASE`, `DROP TABLE`, or `TRUNCATE` on a production database unless you fully understand the consequences.

## Suggested learning order

1. Setup
2. Basics
3. DDL
4. DML
5. SELECT/filtering
6. Functions
7. Constraints
8. Joins
9. Subqueries
10. Views/indexes
11. Transactions
12. Advanced SQL

## License

You can use, modify, and reuse these examples for learning and college projects.

## Practice

The `sql/15-practice/01-practice-questions.sql` file contains 25 practice questions with sample answers.

## Notes about compatibility

These examples target MySQL 8.0+. A few features, such as CTEs, window functions, `CHECK` constraints, and `EXPLAIN ANALYZE`, depend on modern MySQL versions.

SQL syntax differs between database systems. For example, MySQL, PostgreSQL, SQL Server, and Oracle do not have identical commands or functions. This repository intentionally focuses on MySQL.
