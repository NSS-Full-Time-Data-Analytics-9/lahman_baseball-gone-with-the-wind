--5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?

--strikeout/homeruns columns in batting, pitching, teams (strikeout by batters), battingpost, pitchingpost tables

--batting SO = strikeout, HR = homeruns
--pitching SO = strikeout, HR = homeruns
--teams HR = homeruns by batters, SOA strikeout by pitchers
--battingpost SO = strikeouts, HR = homeruns
--pitchingpost SO = strikeouts, HR = homeruns

--From pitching and batting table

--FROM teams table
SELECT 10*(yearid / 10) AS decade, 
	ROUND(SUM(so)::numeric/(SUM(g)/2), 2) AS strikeout_per_game,
	ROUND(SUM(hr)::numeric/(SUM(g)/2), 2) AS homerun_per_game
FROM teams
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade;

--Answer: The average numbers of strikeouts per game and homeruns per game throughout the decades have remained consistent. The average numbers of strikeouts and homeruns appear to have grown with 1920s having the lowest averages 
