--5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?

--Answer: The average numbers of strikeouts per game and homeruns per game throughout the decades have remained consistent. However, the 1950s and 1960s reported the top two largest amounts of homeruns and strikeouts while the 1920s had the lowest amount of strikeouts and homeruns.

SELECT 10*(yearid / 10) AS decade, 
	ROUND(SUM(so::numeric)/SUM(g::numeric), 2) AS strikeout_per_game,
	ROUND(SUM(hr::numeric)/SUM(g::numeric), 2) AS homerun_per_game
FROM pitching
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade;

