--Find the player who had the most success stealing bases in 2016, where success is measured as the percentage of stolen base attempts which are successful. (A stolen base 
--attempt results either in a stolen base or being caught stealing.) Consider only players who attempted at least 20 stolen bases.
SELECT namefirst, namelast, yearid, ROUND((SB::numeric/(CS::numeric+SB::numeric)*100),2) as perc_stolen
FROM people INNER JOIN batting USING(playerid)
WHERE yearid = 2016
AND (CS+SB) > 20
ORDER BY perc_stolen DESC
