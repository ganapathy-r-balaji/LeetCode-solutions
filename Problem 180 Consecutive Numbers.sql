-- Problem 1076 Project Employees II
-- Problem Statement:
	-- Write an SQL query that reports all the projects that have the most employees.
	-- Return the result table in any order.

-- Table: Project
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this table.
-- employee_id is a foreign key to Employee table.
-- Each row of this table indicates that the employee with employee_id is working on the project with project_id.

-- Table: Employee
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this table.
-- Each row of this table contains information about one employee.

-- MySQL query solution
WITH CTE AS
    (
        SELECT 
            project_id,
            RANK() OVER(ORDER BY COUNT(employee_id) DESC) Ranking
        FROM 
            Project
        GROUP BY project_id
    )
    
SELECT project_id FROM CTE 
WHERE Ranking = 1