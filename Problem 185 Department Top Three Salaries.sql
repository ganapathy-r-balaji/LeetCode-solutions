-- Problem 185 Department Top Three Salaries
-- Problem Statement:
	-- Write an SQL query that reports all the projects that have the most employees.
	-- Return the result table in any order.

-- Table: Employee
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id is the primary key column for this table.
-- departmentId is a foreign key of the ID from the Department table.
-- Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.

-- Table: Department
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID of a department and its name.

-- MySQL query solution
WITH cte AS 
(
    SELECT
        e.id,
        e.name as Employee,
        e.salary as Salary,
        e.departmentId,
        d.name as Department
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
),
cte1 AS
(
    SELECT 
        Department,
        Employee,
        Salary,
        DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS rnk
    FROM cte
)

SELECT 
    Department,
    Employee,
    Salary
FROM cte1
WHERE rnk <= 3