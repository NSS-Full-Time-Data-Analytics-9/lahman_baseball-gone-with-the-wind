--2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT p.height, p.namefirst, p.namelast, b.g, t.name
FROM people AS p
INNER JOIN batting AS b
USING(playerid)
INNER JOIN teams AS t
USING (teamid)
ORDER BY height
LIMIT 1;

--Answer: Eddie Gaedel is the shortest player in the database and he is 43 inches tall (3 feet 7 inches). He played 1 game for the St.Louis Browns