--8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average ---attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

--Top 5 average attendance per all games

WITH top_attendance AS (SELECT DISTINCT p.park_name, h.team, h.attendance/h.games AS avg_attendance
							FROM homegames AS h
							INNER JOIN parks AS p
							USING (park)
							WHERE year = 2016 AND h.games >= 10
							GROUP BY p.park_name, h.attendance, h.games, h.team
							ORDER BY avg_attendance DESC
							LIMIT 5)
SELECT park_name, avg_attendance, t.name
FROM top_attendance
INNER JOIN teams AS t
ON top_attendance.team = t.teamid
WHERE yearid = 2016 AND t.g >= 10;

--Lowest 5 average attendance per all games

WITH lowest_attendance AS (SELECT DISTINCT p.park_name, h.team, h.attendance/h.games AS avg_attendance
							FROM homegames AS h
							INNER JOIN parks AS p
							USING (park)
							WHERE year = 2016 AND h.games >= 10
							GROUP BY p.park_name, h.attendance, h.games, h.team
							ORDER BY avg_attendance
							LIMIT 5)
SELECT park_name, avg_attendance, t.name
FROM lowest_attendance
INNER JOIN teams AS t
ON lowest_attendance.team = t.teamid
WHERE yearid = 2016 AND t.g >= 10;



SELECT *
FROM homegames
WHERE year = 2016 AND games <= 10