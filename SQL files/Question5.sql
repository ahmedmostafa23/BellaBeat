/*This is a file that fetches records for users with both active minutes > 0, and active
distance > 0 for all days of the study, and calculates their speed. it should be filtered so
that it only produces runners. for moderately active speed is (1.86-4.2)km/h, for very
active it is > 4.2km/h*/
SELECT
	lightly_active_distance,
	lightly_active_minutes,
	CAST((lightly_active_distance*60/lightly_active_minutes) AS NUMERIC(3,1)) AS "lightly_active_speed"
FROM DailyActivity
WHERE
	lightly_active_distance > 0
	AND lightly_active_minutes > 0
ORDER BY
	1 ASC;
