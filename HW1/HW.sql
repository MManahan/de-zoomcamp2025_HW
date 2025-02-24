-- Question 3 (104802, 198924, 109603, 27678, 35189)

SELECT 
	SUM(CASE WHEN trip_distance <= 1.00 THEN 1 ELSE 0 END) AS One_Mile
	, SUM(CASE WHEN trip_distance > 1.00 AND trip_distance <= 3.00 THEN 1 ELSE 0 END) AS One_to_Three_Miles
	, SUM(CASE WHEN trip_distance > 3.00 AND trip_distance <= 7.00 THEN 1 ELSE 0 END) AS Three_to_Seven_Miles 
	, SUM(CASE WHEN trip_distance > 7.00 AND trip_distance <= 10.00 THEN 1 ELSE 0 END) AS Seven_to_Ten_Miles
	, SUM(CASE WHEN trip_distance > 10.00 THEN 1 ELSE 0 END) AS Greater_Than_Ten_Miles
FROM 
	yellow_taxi_trips
WHERE 
	lpep_dropoff_datetime::date BETWEEN '2019-10-01' AND '2019-10-31'


-- Question 4 (10/31/2019)

SELECT 
	lpep_pickup_datetime::date as Pickup_Date 
	, MAX(trip_distance) as max_trip
FROM 
	yellow_taxi_trips
GROUP BY 1 
ORDER BY 2 DESC

-- Question 5 (East Harlem North, East Harlem South, Morningside Heights)

SELECT
	"Zone" AS zone
	, SUM(total_amount) AS sum_total_amount
FROM 
	public.yellow_taxi_trips 
INNER JOIN 
	public.zones 
ON 
	"PULocationID" = "LocationID"
WHERE 
	lpep_pickup_datetime::date = '2019-10-18'
GROUP BY 1 
ORDER BY 2 DESC

-- Question 6 (JFK Airport)

SELECT
	puzone."Zone" as pickup_zone
	, dozone."Zone" as dropoff_zone
	, y.tip_amount
FROM 
	public.yellow_taxi_trips y
LEFT JOIN 
	public.zones puzone
ON 
	y."PULocationID" = puzone."LocationID"
LEFT JOIN 
	public.zones dozone
ON 
	y."DOLocationID" = dozone."LocationID"
WHERE 
	EXTRACT(YEAR FROM y.lpep_pickup_datetime::date)= 2019
		AND EXTRACT(MONTH FROM y.lpep_pickup_datetime::date) = 10
		AND puzone."Zone" = 'East Harlem North'

ORDER BY 3 DESC