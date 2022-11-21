-- Problem 176 Second Highest Salary
-- Problem Statement:
	-- Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key column for this table.
-- Each row of this table contains information about the salary of an employee.

-- MySQL query solution
Select salary AS SecondHighestSalary FROM 
    (
        SELECT *,
        dense_rank() OVER(ORDER BY salary DESC) as Ranking
        FROM Employee    
    ) b
WHERE ranking = 2

-- Alternate Solution

WITH CTE AS (
    SELECT 
        salary,
        dense_rank() OVER(ORDER BY salary DESC) as Ranking
    FROM Employee
)

SELECT IFNULL(
    (
        SELECT salary FROM CTE
        WHERE Ranking = 2
        LIMIT 1
    ), NULL
) AS SecondHighestSalary