--Which managers have won the TSN Manager of the Year award in both the National League (NL) and 
--the American League (AL)? Give their full name and the teams that they were managing when they won the award.
WITH combined AS(
					(SELECT p.namefirst, p.namelast, am.awardid, am.lgid, am.yearid
					FROM awardsmanagers as am
 					INNER JOIN people AS p USING(playerid)
					WHERE awardid ILIKE 'TSN Manager of the Year'
					AND am.lgid = 'NL')
			union all
					(SELECT p1.namefirst, p1.namelast, am1.awardid, am1.lgid, am1.yearid
					FROM awardsmanagers AS am1
 					INNER JOIN people AS p1 USING(playerid)
					WHERE awardid ILIKE 'TSN Manager of the Year'
					AND am1.lgid = 'AL')
				)
SELECT COUNT(distinct lgid) as counted, namefirst, namelast
FROM combined
GROUP BY namefirst, namelast
HAVING COUNT(distinct lgid) >= 2 
					
					
WITH NL_AL_league AS (SELECT playerid, COUNT(DISTINCT awardid)
                        FROM public.awardsmanagers
                  	WHERE lgid <> 'ML'
	     			AND awardid = 'TSN Manager of the Year'
					GROUP BY playerid
					HAVING COUNT(DISTINCT lgid) >1)
					
SELECT 	DISTINCT namefirst,namelast, 
		CASE WHEN am.lgid <> 'ML' THEN 'yes'
		ELSE 'no' END AS IN_nl_al
FROM public.awardsmanagers as am
INNER JOIN public.people
USING(playerid)
INNER JOIN NL_AL_league
USING (playerid)
INNER JOIN public.managers
USING(playerid)
group by namefirst, namelast, am.lgid

WITH persons as (	SELECT p.namefirst, p.namelast, am.awardid, am.playerid
					FROM awardsmanagers as am
 					INNER JOIN people AS p USING(playerid)
					WHERE awardid ILIKE 'TSN Manager of the Year'
					AND am.lgid = 'NL'
			intersect
				 
					SELECT p1.namefirst, p1.namelast, am1.awardid, am1.playerid
					FROM awardsmanagers AS am1
 					INNER JOIN people AS p1 USING(playerid)
					WHERE awardid ILIKE 'TSN Manager of the Year'
					AND am1.lgid = 'AL'
				)
Select distinct t.name, p1.namefirst, p1.namelast, am.playerid, am.lgid, am.awardid, am.yearid
FROM managers INNER JOIN persons as p1 USING(playerid)
			INNER JOIN awardsmanagers as am USING(playerid, awardid, yearid, lgid)
			INNER JOIN teams as t USING(teamid, yearid, lgid)

					
					

