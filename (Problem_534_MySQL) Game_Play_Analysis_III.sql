'''
	Problem 534 - Game Play Analysis III
	Problem Statement:
 		Write a solution to report for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity.
   		Return the result table in any order.

	Table: Activity
	
	+--------------+---------+
	| Column Name  | Type    |
	+--------------+---------+
	| player_id    | int     |
	| device_id    | int     |
	| event_date   | date    |
	| games_played | int     |
	+--------------+---------+
	(player_id, event_date) is the primary key (column with unique values) of this table.
	This table shows the activity of players of some games.
	Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
'''

-- Write your MySQL query statement below
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM activity
