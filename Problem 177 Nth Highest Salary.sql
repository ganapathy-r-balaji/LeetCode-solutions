-- Problem 177 Nth Highest Salary
-- Problem Statement:
	-- Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

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
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH cte AS (
          SELECT 
            salary,
            dense_rank() OVER(ORDER BY salary DESC) as rnk
          FROM Employee
      )
      
      SELECT IFNULL(
          (
              SELECT 
                salary 
              FROM cte
              WHERE rnk = n 
              LIMIT 1
          ), NULL
      ) AS NthHighestSalary
      
  );
END