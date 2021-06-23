/*This is file to summarize date and time data for date and time columns in the joined Minute Table*/

/*datetime together*/
WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteMET USING(device_id, date, time)
	INNER JOIN MinuteSteps USING(device_id, date, time)
	INNER JOIN MinuteIntensity USING(device_id, date, time)
	LEFT JOIN MinuteSleep USING(device_id, date, time)
)
SELECT
	date,
	time
FROM Minute
GROUP BY
	date,
	time
ORDER BY
	1 DESC,
	2 DESC
LIMIT 1;

--------------------------------------------------

/*date and time*/
WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteMET USING(device_id, date, time)
	INNER JOIN MinuteSteps USING(device_id, date, time)
	INNER JOIN MinuteIntensity USING(device_id, date, time)
	LEFT JOIN MinuteSleep USING(device_id, date, time)
)
SELECT
	date
FROM Minute
GROUP BY
	date

	