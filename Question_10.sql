
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
	   AND hr = max_homeruns

	   
	   


