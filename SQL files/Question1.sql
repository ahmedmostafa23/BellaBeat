/*Question 1*/
SELECT 
	CAST(AVG(very_active_minutes) AS INT) AS "very",
	CAST(AVG(moderately_active_minutes) AS INT) AS "moderate",
	CAST(AVG(lightly_active_minutes) AS INT) AS "light", 
	CAST(AVG(sedentary_active_minutes) AS INT) AS "inactive"
FROM DailyActivity;