WITH day_avg AS (
	SELECT
		device_id,
		CAST(AVG(HRV) AS INT) AS "day_avg_hrv"
	FROM SecondHRV
	WHERE
		time BETWEEN '07:00:00' AND '22:00:00'
	GROUP BY
		device_id
),
night_avg AS (
	SELECT
		device_id,
		CAST(AVG(HRV) AS INT) AS "night_avg_hrv"
	FROM SecondHRV
	WHERE
		time > '22:00:00' OR time < '07:00:00' 
	GROUP BY
		device_id
)
SELECT
	d.device_id,
	day_avg_hrv,
	night_avg_hrv
FROM day_avg AS "d"
FULL OUTER JOIN night_avg AS "n" USING(device_id)



