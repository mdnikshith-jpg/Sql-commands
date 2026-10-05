-- =========================================================
-- WINDOW FUNCTIONS
-- MySQL 8.0+
-- =========================================================

USE sql_learning;

-- ROW_NUMBER
SELECT m.mark_id,
       m.marks,
       ROW_NUMBER() OVER (ORDER BY m.marks DESC) AS row_number_value
FROM marks m;

-- RANK
SELECT m.mark_id,
       m.marks,
       RANK() OVER (ORDER BY m.marks DESC) AS rank_value
FROM marks m;

-- DENSE_RANK
SELECT m.mark_id,
       m.marks,
       DENSE_RANK() OVER (ORDER BY m.marks DESC) AS dense_rank_value
FROM marks m;

-- Ranking within each exam type
SELECT m.mark_id,
       m.exam_type,
       m.marks,
       RANK() OVER (
           PARTITION BY m.exam_type
           ORDER BY m.marks DESC
       ) AS exam_rank
FROM marks m;

-- Running total
SELECT m.mark_id,
       m.marks,
       SUM(m.marks) OVER (
           ORDER BY m.mark_id
       ) AS running_total
FROM marks m;

-- Average over all rows
SELECT m.mark_id,
       m.marks,
       AVG(m.marks) OVER () AS overall_average
FROM marks m;
