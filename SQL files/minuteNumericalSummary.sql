/*this file contains the SQL code gist that joins the Minute tables into a single Minute CTE, that is which queried
to produce min, max, avg, and percentiles of numeric columns in the Minute table*/

WITH Minute AS (
	SELECT *
	FROM MinuteCalories
	INNER JOIN MinuteIntensity USING(device_id, date, time)
	INNER JOIN MinuteMET USING(device_id, date, time)
	INNER JOIN MinuteSteps USING(device_id, date, time)
	LEFT JOIN MinuteSleep USING(device_id, date, time)
)
SELECT
	MIN(met) AS "min",
	MAX(met) AS "max",
	CAST(AVG(met) AS NUMERIC(5,3)) AS "avg",
	PERCENTILE_DISC(0.01) WITHIN GROUP (ORDER BY met) AS "1st",
	PERCENTILE_DISC(0.05) WITHIN GROUP (ORDER BY met) AS "5th",
	PERCENTILE_DISC(0.1) WITHIN GROUP (ORDER BY met) AS "10th",
	PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY met) AS "25th",
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY met) AS "Median",
	PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY met) AS "75th",
	PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY met) AS "90th",
	PERCENTILE_DISC(0.95) WITHIN GROUP (ORDER BY met) AS "95th",
	PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY met) AS "99th",
FROM Minute
