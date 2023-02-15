SELECT namefirst, namelast, schoolname, sum(salary::numeric::money) as total
FROM people as p 
			INNER JOIN collegeplaying USING(playerid)
			INNER JOIN schools USING(schoolid)
			INNER JOIN salaries USING(playerid)
WHERE schoolname ilike 'Vanderbilt%'
GROUP BY namefirst, namelast, schoolname
ORDER BY total desc NULLS LAST
LIMIT 1

		