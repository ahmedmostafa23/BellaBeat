/*This is the SQL code that gives us the count of the number of sleep records at different
times of day */

SELECT
	time,
	COUNT(*)
FROM MinuteSleep
WHERE
	EXTRACT(SECOND FROM time) = 0
GROUP BY
	time
ORDER BY
	time ASC;