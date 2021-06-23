/*Question 2*/
--This should give you a count of number of records per user
WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteMET
	INNER JOIN MinuteIntensity
	INNER JOIN MinuteSteps
	LEFT JOIN MinuteSleep
)
SELECT
	device_id,
	COUNT(*)
FROM Minute
GROUP BY
	device_id
	
----
--This should give a count of number of records per day
WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteMET
	INNER JOIN MinuteIntensity
	INNER JOIN MinuteSteps
	LEFT JOIN MinuteSleep
)
SELECT
	date,
	COUNT(*)
FROM Minute
GROUP BY
	date
ORDER BY
	date ASC;