-- Problem 1699 Number of Calls Between Two Persons
-- Problem Statement:
	-- Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2.
	-- Return the result table in any order.


-- Table: Calls
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | from_id     | int     |
-- | to_id       | int     |
-- | duration    | int     |
-- +-------------+---------+
-- This table does not have a primary key, it may contain duplicates.
-- This table contains the duration of a phone call between from_id and to_id.
-- from_id != to_id

-- MySQL query solution
with cte as (
    select from_id, to_id, duration
    from Calls where from_id < to_id
    union all
    select to_id as from_id, from_id as to_id, duration 
    from Calls where from_id > to_id
)

SELECT 
    from_id as person1,
    to_id as person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM cte
GROUP BY from_id, to_id