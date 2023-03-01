
--Q10.Find all players who hit their career highest number of home runs in 2016. 
--Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
--Report the players' first and last names and the number of home runs they hit in 2016.

WITH hr_2016 AS (SELECT  DISTINCT playerid,MAX(hr) AS max_homeruns
				 FROM public.batting
				 WHERE hr >=1
				 --AND (2016-(LEFT(debut,4)::numeric)) >=10
				 GROUP BY playerid)
				 
SELECT DISTINCT CONCAT(namefirst,' ',namelast),max_homeruns, b.yearid
FROM public.people AS p1
INNER JOIN hr_2016 AS h1
USING (playerid)
INNER JOIN public.batting AS b
USING (playerid)
WHERE (2016-(LEFT(debut,4)::numeric)) >=10
       AND b.yearid = 2016
	   AND hr = max_homeruns;

--ANS I got 8 players name who hit max home runs in 2016.
--"Adam Wainwright"	   2	2016
--"Angel Pagan"	          12	2016
--"Bartolo Colon"	   1	2016
--"Edwin Encarnacion"     42    2016
--"Francisco Liriano"      1    2016
--"Mike Napoli"	          34	2016
--"Rajai Davis"	          12	2016
--"Robinson Cano"	  39	2016
	   
	   
-- AS PER THE INSTRUCTOR'S CODE I GOT 9 PLAYERS.

WITH player_list AS	( SELECT 
							playerid,
					 		namefirst,
					 		namelast,
							hr
						FROM people
							INNER JOIN batting
							USING(playerid)
						WHERE yearid = 2016
							AND hr >0
							AND (2016 - EXTRACT(year FROM debut::date) + 1) >= 10),
	max_hr AS	(SELECT playerid,
						MAX(hr) AS hr
					FROM batting
					WHERE hr > 0
					GROUP BY playerid)
SELECT
	namefirst,
	namelast,
	hr AS hr_2016
FROM player_list
	INNER JOIN max_hr
	USING(playerid, hr);

--ANS   
"Robinson" "Cano"	39
"Bartolo"  "Colon"	1
"Rajai"	"Davis"	        12
"Edwin"	"Encarnacion"	42
"Francisco" "Liriano"	1
"Mike"	"Napoli"	34
"Angel"	"Pagan"	12
"Justin" "Upton"	        31
"Adam"	"Wainwright"	2

