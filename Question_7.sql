--Q7.From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

--PART (a)what is the largest number of wins for a team that did not win the world series?
-- Team seatle wins the largest number of wins with 116 in 2001.
SELECT MAX(w) AS max_num_wins,teamid
FROM public.teams
WHERE wswin ILIKE '%N%'
      AND yearid BETWEEN 1970 AND 2016
GROUP BY teamid
ORDER BY max_num_wins DESC
LIMIT 1;


--PART (b) What is the smallest number of wins for a team that did win the world series?
--  Team LAN has the smallest number of wins with 63 and also won the world series
SELECT MIN(w) AS min_num_wins,teamid
FROM public.teams
WHERE wswin ILIKE '%Y%'
      AND yearid BETWEEN 1970 AND 2016
GROUP BY teamid
ORDER BY min_num_wins ASC
LIMIT 1;


--PART(c) Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year.
-- in 1981 there was a strike so i excluded year 1981.

SELECT MIN(w) AS min_num_wins,teamid,yearid
FROM public.teams
WHERE wswin ILIKE '%Y%'
      AND yearid BETWEEN 1970 AND 2016
	  AND yearid <> 1981
GROUP BY teamid,yearid
ORDER BY min_num_wins ASC
LIMIT 1;


--PART (d) How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?


with max_team AS (SELECT yearid, MAX(w) AS max_wins -- Create CTE of each team with the max wins each yr
					FROM teams
					WHERE yearid BETWEEN 1970 AND 2016
					AND yearid <> 1981                   -- Strike year
					GROUP BY yearid
				  	ORDER BY yearid)
SELECT SUM(CASE WHEN t.wswin = 'Y' THEN 1 ELSE 0 END) AS max_champ, -- Count of max win champs
     --((SUM(CASE WHEN t.wswin = 'Y' THEN 1 ELSE 0 END))::numeric/COUNT(*)::numeric)*100 AS percent_max_champ
		AVG(CASE WHEN t.wswin = 'Y' THEN 1 ELSE 0 END)*100 AS percent_max_is_champ -- % max win team is champ
FROM max_team AS wt
INNER JOIN teams AS t 
ON wt.yearid = t.yearid and wt.max_wins = t.w





SELECT
	DISTINCT yearid,
	name,
	wswin,
	wins,
	mostwins
FROM(
	SELECT
		DISTINCT yearid,
		name,
		wswin,
		w AS wins,
		MAX(w) OVER(PARTITION BY yearid) AS mostwins
	FROM teams
	WHERE yearid >= 1970
	ORDER BY yearid DESC) AS subquery
WHERE wswin LIKE 'Y'
	AND wins = mostwins
ORDER BY yearid DESC;




SELECT *
FROM teams
