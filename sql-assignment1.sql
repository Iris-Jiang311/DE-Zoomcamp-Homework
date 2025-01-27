SELECT 
    SUM(CASE WHEN trip_distance <= 1 THEN 1 ELSE 0 END) AS "Up to 1 mile",
    SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS "1 (exclusive) to 3 miles (inclusive)",
    SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS "3 (exclusive) to 7 miles (inclusive)",
    SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS "7 (exclusive) to 10 miles (inclusive)",
    SUM(CASE WHEN trip_distance > 10 THEN 1 ELSE 0 END) AS "Over 10 miles"
FROM green_tripdata
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00'
  AND lpep_pickup_datetime < '2019-11-01 00:00:00';


SELECT 
    DATE(lpep_pickup_datetime) AS pickup_date,
    MAX(trip_distance) AS max_trip_distance
FROM green_tripdata
GROUP BY DATE(lpep_pickup_datetime)
ORDER BY max_trip_distance DESC
LIMIT 1;


SELECT 
    t."PULocationID",
    z."Zone" AS pickup_zone,
    SUM(t."total_amount") AS total_amount
FROM green_tripdata t
JOIN zones z
  ON t."PULocationID" = z."LocationID"
WHERE DATE(t."lpep_pickup_datetime") = '2019-10-18'
GROUP BY t."PULocationID", z."Zone"
HAVING SUM(t."total_amount") > 13000
ORDER BY total_amount DESC;

SELECT 
    z_drop."Zone" AS dropoff_zone,
    MAX(t."tip_amount") AS max_tip
FROM green_tripdata t
JOIN zones z_pick
  ON t."PULocationID" = z_pick."LocationID"
JOIN zones z_drop
  ON t."DOLocationID" = z_drop."LocationID"
WHERE DATE(t."lpep_pickup_datetime") BETWEEN '2019-10-01' AND '2019-10-31'
  AND z_pick."Zone" = 'East Harlem North'
GROUP BY z_drop."Zone"
ORDER BY max_tip DESC
LIMIT 1;

