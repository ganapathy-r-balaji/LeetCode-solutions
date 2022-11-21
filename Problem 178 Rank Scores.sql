-- Problem 178 Rank Scores
-- Problem Statement:
	-- Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:
		-- The scores should be ranked from the highest to the lowest.
		-- If there is a tie between two scores, both should have the same ranking.
		-- After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
	-- Return the result table ordered by score in descending order.

-- Table: Scores
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | score       | decimal |
-- +-------------+---------+
-- id is the primary key for this table.
-- Each row of this table contains the score of a game. Score is a floating point value with two decimal places.

-- MySQL query solution
SELECT 
    score, 
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores 
ORDER BY score desc

-- Alternate Solution

with cte as (
    select 
        score,
        dense_rank() OVER(order by score desc) as 'rank'
    from Scores
)

select * from cte