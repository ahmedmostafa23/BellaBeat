/*This file will compare the MET at work hours against the avg MET outside work hours (9:00 am to 5:00pm)*/
WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteMET USING(device_id, date, time)
	INNER JOIN MinuteIntensity USING(device_id, date, time)
	INNER JOIN MinuteSteps USING(device_id, date, time)
	LEFT JOIN MinuteSleep USING(device_id, date, time)
)
SELECT
	time,
	CAST(AVG(MET) AS NUMERIC(3,1)) AS "work_met"
FROM Minute
WHERE
	time BETWEEN '09:00:00' AND '17:00:00'
GROUP BY
	time
ORDER BY
	1 ASC;