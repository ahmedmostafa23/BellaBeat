/*This is a file that is used to summarize categorical columns in the Minute Joined Table*/

WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteIntensity
	INNER JOIN MinuteMET
	INNER JOIN MinuteSteps
	LEFT JOIN MinuteSleep
)
SELECT
	device_id,
	COUNT(*)
FROM Minute
GROUP BY
	device_id;