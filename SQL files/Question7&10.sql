/*This SQL code will group by days of the week for w/e table your heart desires*/
SELECT
	fn_downumber2Name(EXTRACT(dOW FROM date)) AS "day_of_week",
	COUNT(*)
FROM DailyACtivity
GROUP BY
	fn_downumber2name(EXTRACT(dOW FROM date))

/*The function EXTRACT(DOW FROM date) returns the days of the week as a double precision numerical type
such that Sunday = 0, and Saturday = 6. I have created the following function to take that number, and return the name
of the day of the week for me, so that my life becomes easier.*/
CREATE OR REPLACE FUNCTION fn_downumber2name(dow double precision) RETURNS TEXT AS
$$
	SELECT
	(
		CASE
		WHEN dow = 0 THEN 'Sun'
		WHEN dow = 1 THEN 'Mon'
		WHEN dow = 2 THEN 'Tue'
		WHEN dow = 3 THEN 'Wed'
		WHEN dow = 4 THEN 'Thu'
		WHEN dow = 5 THEN 'Fri'
		ELSE 'Sat'
		END
	)
$$ LANGUAGE SQL

	
