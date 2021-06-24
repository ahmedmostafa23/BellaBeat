/*This file will give me a count of sleep records by time of day for all users in all days*/
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