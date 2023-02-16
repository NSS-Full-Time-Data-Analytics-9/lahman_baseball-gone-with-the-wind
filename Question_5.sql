--5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?

--strikeout/homeruns columns in batting, pitching, teams (strikeout by batters), battingpost, pitchingpost tables

--batting SO = strikeout, HR = homeruns
--pitching SO = strikeout, HR = homeruns
--teams HR = homeruns by batters, SOA strikeout by pitchers
--battingpost SO = strikeouts, HR = homeruns
--pitchingpost SO = strikeouts, HR = homeruns

--From pitching and batting table
--took awhile to compute so copied table

SELECT 10*(yearid / 10) AS decade,
	ROUND(SUM(p.so::numeric + b.so::numeric)/SUM(p.g::numeric + b.g::numeric), 2) AS strikeouts_per_game,
	ROUND(SUM(p.hr::numeric + b.hr::numeric)/SUM(p.g::numeric + b.g::numeric), 2) AS homeruns_per_game
FROM pitching AS p
INNER JOIN batting AS b
USING(yearid)
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade

decades, strikeouts, homeruns
1920	0.62	0.09
1930	0.71	0.12
1940	0.73	0.11
1950	0.83	0.16
1960	1.01	0.14
1970	0.93	0.13
1980	0.90	0.14
1990	0.91	0.14
2000	0.90	0.15
2010	1.00	0.13

--FROM teams table
SELECT 10*(yearid / 10) AS decade, 
	ROUND(SUM(soa::numeric)/SUM(g::numeric), 2) AS strikeout_per_game,
	ROUND(SUM(hr::numeric)/SUM(g::numeric), 2) AS homerun_per_game
FROM teams
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade;

decade, strikeouts, homeruns
1920	2.81	0.40
1930	3.32	0.55
1940	3.55	0.52
1950	4.40	0.84
1960	5.72	0.82
1970	5.14	0.75
1980	5.36	0.81
1990	6.15	0.96
2000	6.56	1.07
2010	7.52	0.98

--Answer: The average numbers of strikeouts per game and homeruns per game throughout the decades have remained consistent. The average numbers of strikeouts and homeruns appear to have grown with 1920s having the lowest averages 

