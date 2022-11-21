-- Problem 184 Department Highest Salary
-- Problem Statement:
	-- Write an SQL query to find employees who have the highest salary in each of the departments.
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
-- id is the primary key for this table.
-- Each row of this table indicates the ID of a department and its name.

-- MySQL query solution
SELECT 
    d.name as Department,
    e.name as Employee,
    e.salary as Salary
FROM Employee e , Department d 
WHERE e.departmentId = d.id
AND (e.departmentId, (e.salary)) IN (
    SELECT e2.departmentId , MAX(e2.salary) FROM Employee e2 WHERE e2.departmentId  = e.departmentId 
)