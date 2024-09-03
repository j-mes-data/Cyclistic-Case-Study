-- Exploratory data analysis on each quarter 
Select
COUNT(DISTINCT ride_id) AS unique_count
FROM
`big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
ride_id IS NOT NULL;
-- Unique_count = 669,724

-- Excluding null values for start_station and end-station
Select
COUNT(DISTINCT ride_id) AS unique_count
FROM
`big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
start_station_name IS NOT NULL OR
end_station_name IS NOT NULL;
-- Unique_count = 630,748. that means there were 38,976 null values in Q1 alone. Moving forward we will have to include a clause to remove null values for start_station and end_station

-- Total Trips and percentages by User type; Q1
SELECT
 TotalTrips,
 TotalMemberTrips,
 TotalCasualTrips,
 ROUND(TotalMemberTrips/TotalTrips,2)*100 AS MemberPercentage,
 ROUND(TotalCasualTrips/TotalTrips,2)*100 AS CasualPercentage
FROM (
 SELECT
 COUNT(ride_id) AS TotalTrips,
 COUNTIF(member_casual = 'member') AS TotalMemberTrips,
 COUNTIF(member_casual = 'casual') AS TotalCasualTrips,
 FROM
 `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2);

-- Total Trips and percentages by User type; Q2
SELECT
 TotalTrips,
 TotalMemberTrips,
 TotalCasualTrips,
 ROUND(TotalMemberTrips/TotalTrips,2)*100 AS MemberPercentage,
 ROUND(TotalCasualTrips/TotalTrips,2)*100 AS CasualPercentage
FROM (
 SELECT
 COUNT(ride_id) AS TotalTrips,
 COUNTIF(member_casual = 'member') AS TotalMemberTrips,
 COUNTIF(member_casual = 'casual') AS TotalCasualTrips,
 FROM
 `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2);

-- Total Trips and percentages by User type; Q3
SELECT
 TotalTrips,
 TotalMemberTrips,
 TotalCasualTrips,
 ROUND(TotalMemberTrips/TotalTrips,2)*100 AS MemberPercentage,
 ROUND(TotalCasualTrips/TotalTrips,2)*100 AS CasualPercentage
FROM (
 SELECT
 COUNT(ride_id) AS TotalTrips,
 COUNTIF(member_casual = 'member') AS TotalMemberTrips,
 COUNTIF(member_casual = 'casual') AS TotalCasualTrips,
 FROM
 `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2);

-- Total Trips and percentages by User type; Q4
SELECT
 TotalTrips,
 TotalMemberTrips,
 TotalCasualTrips,
 ROUND(TotalMemberTrips/TotalTrips,2)*100 AS MemberPercentage,
 ROUND(TotalCasualTrips/TotalTrips,2)*100 AS CasualPercentage
FROM (
 SELECT
 COUNT(ride_id) AS TotalTrips,
 COUNTIF(member_casual = 'member') AS TotalMemberTrips,
 COUNTIF(member_casual = 'casual') AS TotalCasualTrips,
 FROM
 `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2);

-- Average ride length broken down by member_casual type; Q1
SELECT
AVG(duration_minutes) AS AVG_Ride_Length,
AVG(CASE WHEN member_casual = 'member' THEN duration_minutes END) AS AVG_Member_Ride,
AVG(CASE WHEN member_casual = 'casual' THEN duration_minutes END) AS AVG_Casual_Ride,
FROM
 `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2;

-- Average ride length broken down by member_casual type; Q2
SELECT
AVG(duration_minutes) AS AVG_Ride_Length,
AVG(CASE WHEN member_casual = 'member' THEN duration_minutes END) AS AVG_Member_Ride,
AVG(CASE WHEN member_casual = 'casual' THEN duration_minutes END) AS AVG_Casual_Ride,
FROM
 `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2;

-- Average ride length broken down by member_casual type; Q3
SELECT
AVG(duration_minutes) AS AVG_Ride_Length,
AVG(CASE WHEN member_casual = 'member' THEN duration_minutes END) AS AVG_Member_Ride,
AVG(CASE WHEN member_casual = 'casual' THEN duration_minutes END) AS AVG_Casual_Ride,
FROM
 `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2;

-- Average ride length broken down by member_casual type; Q4
SELECT
AVG(duration_minutes) AS AVG_Ride_Length,
AVG(CASE WHEN member_casual = 'member' THEN duration_minutes END) AS AVG_Member_Ride,
AVG(CASE WHEN member_casual = 'casual' THEN duration_minutes END) AS AVG_Casual_Ride,
FROM
 `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2;

-- To get bike type by member type; Q1
SELECT
 rideable_type,
 COUNT(CASE WHEN member_casual = 'member' THEN ride_id END) AS member_rides,
 COUNT(CASE WHEN member_casual = 'casual' THEN ride_id END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 rideable_type
ORDER BY
 rideable_type;

-- bike type by member type; Q2
SELECT
 rideable_type,
 COUNT(CASE WHEN member_casual = 'member' THEN ride_id END) AS member_rides,
 COUNT(CASE WHEN member_casual = 'casual' THEN ride_id END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 rideable_type
ORDER BY
 rideable_type;

-- bike type by member type; Q3
SELECT
 rideable_type,
 COUNT(CASE WHEN member_casual = 'member' THEN ride_id END) AS member_rides,
 COUNT(CASE WHEN member_casual = 'casual' THEN ride_id END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 rideable_type
ORDER BY
 rideable_type;

-- bike type by member type; Q4
SELECT
 rideable_type,
 COUNT(CASE WHEN member_casual = 'member' THEN ride_id END) AS member_rides,
 COUNT(CASE WHEN member_casual = 'casual' THEN ride_id END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 rideable_type
ORDER BY
 rideable_type;

-- To output rides per day, for each membership category. Broken down by day; Q1
SELECT
day_of_week,
COUNT(day_of_week) AS TotalRPD,
COUNT(CASE WHEN member_casual = 'member' THEN day_of_week END) AS member_rides,
COUNT(CASE WHEN member_casual = 'casual' THEN day_of_week END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 day_of_week
Order BY
 CASE
   WHEN day_of_week = 'Sunday' THEN 1
   WHEN day_of_week = 'Monday' THEN 2
   WHEN day_of_week = 'Tuesday' THEN 3
   WHEN day_of_week = 'Wednesday' THEN 4
   WHEN day_of_week = 'Thursday' THEN 5
   WHEN day_of_week = 'Friday' THEN 6
   WHEN day_of_week = 'Saturday' THEN 7
   END;

-- To output rides per day, for each membership category. Broken down by day; Q2
SELECT
day_of_week,
COUNT(day_of_week) AS TotalRPD,
COUNT(CASE WHEN member_casual = 'member' THEN day_of_week END) AS member_rides,
COUNT(CASE WHEN member_casual = 'casual' THEN day_of_week END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 day_of_week
Order BY
 CASE
   WHEN day_of_week = 'Sunday' THEN 1
   WHEN day_of_week = 'Monday' THEN 2
   WHEN day_of_week = 'Tuesday' THEN 3
   WHEN day_of_week = 'Wednesday' THEN 4
   WHEN day_of_week = 'Thursday' THEN 5
   WHEN day_of_week = 'Friday' THEN 6
   WHEN day_of_week = 'Saturday' THEN 7
   END;

-- To output rides per day, for each membership category. Broken down by day; Q3
SELECT
day_of_week,
COUNT(day_of_week) AS TotalRPD,
COUNT(CASE WHEN member_casual = 'member' THEN day_of_week END) AS member_rides,
COUNT(CASE WHEN member_casual = 'casual' THEN day_of_week END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 day_of_week
Order BY
 CASE
   WHEN day_of_week = 'Sunday' THEN 1
   WHEN day_of_week = 'Monday' THEN 2
   WHEN day_of_week = 'Tuesday' THEN 3
   WHEN day_of_week = 'Wednesday' THEN 4
   WHEN day_of_week = 'Thursday' THEN 5
   WHEN day_of_week = 'Friday' THEN 6
   WHEN day_of_week = 'Saturday' THEN 7
   END;

-- To output rides per day, for each membership category. Broken down by day; Q4
SELECT
day_of_week,
COUNT(day_of_week) AS TotalRPD,
COUNT(CASE WHEN member_casual = 'member' THEN day_of_week END) AS member_rides,
COUNT(CASE WHEN member_casual = 'casual' THEN day_of_week END) AS casual_rides
FROM
 `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
WHERE
 duration_minutes IS NOT NULL
 AND start_station_name IS NOT NULL
 AND end_station_name IS NOT NULL
 AND duration_minutes >= 2
 AND rideable_type != "docked_bike"
GROUP BY
 day_of_week
Order BY
 CASE
   WHEN day_of_week = 'Sunday' THEN 1
   WHEN day_of_week = 'Monday' THEN 2
   WHEN day_of_week = 'Tuesday' THEN 3
   WHEN day_of_week = 'Wednesday' THEN 4
   WHEN day_of_week = 'Thursday' THEN 5
   WHEN day_of_week = 'Friday' THEN 6
   WHEN day_of_week = 'Saturday' THEN 7
   END;

-- To find out what time of day saw ridership peak for casuals; Q1
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('casual')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
Hour;

-- To find out what time of day saw ridership peak for casuals; Q2
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('casual')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
Hour;

-- To find out what time of day saw ridership peak for casuals; Q3
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('casual')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
Hour;

-- To find out what time of day saw ridership peak for casuals; Q4
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('casual')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
Hour;

-- And for members; Q1
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('members')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
hour;

-- And for members; Q2
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('members')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
hour;

-- And for members; Q3
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('members')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
hour;

-- And for members; Q4
WITH times AS (
SELECT
  started_at,
  day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour,
  EXTRACT(MINUTE FROM started_at) AS minute,
  (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
FROM
  `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
WHERE
  started_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND duration_minutes >= 2
  AND member_casual IN ('members')
)
SELECT
hour,
COUNT(*) AS ride_count,
FROM
times
GROUP BY
hour
ORDER BY
hour;

-- To find out what the peak times were for Casuals during their peak days; Q1
WITH times AS (
 SELECT
   started_at,
   day_of_week,
   EXTRACT(HOUR FROM started_at) AS hour,
   EXTRACT(MINUTE FROM started_at) AS minute,
   (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
 FROM
   `big-query-practice-413618.Cyclistic_data.Q1_24_trips`
 WHERE
   started_at IS NOT NULL
   AND start_station_name IS NOT NULL
   AND end_station_name IS NOT NULL
   AND duration_minutes >= 2
   AND day_of_week IN ('Saturday', 'Sunday')
   AND member_casual IN ('casual')
)
SELECT
 hour,
 COUNT(*) AS ride_count,
 COUNT(CASE WHEN day_of_week = 'Saturday' THEN day_of_week END) AS saturday_rides,
 COUNT(CASE WHEN day_of_week = 'Sunday' THEN day_of_week END) AS sunday_rides
FROM
 times
GROUP BY
 hour
ORDER BY
 hour;

-- To find out what the peak times were for Casuals during their peak days; Q2
WITH times AS (
 SELECT
   started_at,
   day_of_week,
   EXTRACT(HOUR FROM started_at) AS hour,
   EXTRACT(MINUTE FROM started_at) AS minute,
   (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
 FROM
   `big-query-practice-413618.Cyclistic_data.Q2_24_trips`
 WHERE
   started_at IS NOT NULL
   AND start_station_name IS NOT NULL
   AND end_station_name IS NOT NULL
   AND duration_minutes >= 2
   AND day_of_week IN ('Saturday', 'Sunday')
   AND member_casual IN ('casual')
)
SELECT
 hour,
 COUNT(*) AS ride_count,
 COUNT(CASE WHEN day_of_week = 'Saturday' THEN day_of_week END) AS saturday_rides,
 COUNT(CASE WHEN day_of_week = 'Sunday' THEN day_of_week END) AS sunday_rides
FROM
 times
GROUP BY
 hour
ORDER BY
 hour;

-- To find out what the peak times were for Casuals during their peak days; Q3
WITH times AS (
 SELECT
   started_at,
   day_of_week,
   EXTRACT(HOUR FROM started_at) AS hour,
   EXTRACT(MINUTE FROM started_at) AS minute,
   (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
 FROM
   `big-query-practice-413618.Cyclistic_data.Q3_23_trips`
 WHERE
   started_at IS NOT NULL
   AND start_station_name IS NOT NULL
   AND end_station_name IS NOT NULL
   AND duration_minutes >= 2
   AND day_of_week IN ('Saturday', 'Sunday')
   AND member_casual IN ('casual')
)
SELECT
 hour,
 COUNT(*) AS ride_count,
 COUNT(CASE WHEN day_of_week = 'Saturday' THEN day_of_week END) AS saturday_rides,
 COUNT(CASE WHEN day_of_week = 'Sunday' THEN day_of_week END) AS sunday_rides
FROM
 times
GROUP BY
 hour
ORDER BY
 hour;

-- To find out what the peak times were for Casuals during their peak days; Q4
WITH times AS (
 SELECT
   started_at,
   day_of_week,
   EXTRACT(HOUR FROM started_at) AS hour,
   EXTRACT(MINUTE FROM started_at) AS minute,
   (EXTRACT(HOUR FROM started_at) * 60 + EXTRACT(MINUTE FROM started_at)) AS total_minutes
 FROM
   `big-query-practice-413618.Cyclistic_data.Q4_23_trips`
 WHERE
   started_at IS NOT NULL
   AND start_station_name IS NOT NULL
   AND end_station_name IS NOT NULL
   AND duration_minutes >= 2
   AND day_of_week IN ('Saturday', 'Sunday')
   AND member_casual IN ('casual')
)
SELECT
 hour,
 COUNT(*) AS ride_count,
 COUNT(CASE WHEN day_of_week = 'Saturday' THEN day_of_week END) AS saturday_rides,
 COUNT(CASE WHEN day_of_week = 'Sunday' THEN day_of_week END) AS sunday_rides
FROM
 times
GROUP BY
 hour
ORDER BY
 hour;

-- to find out the most popular stations for casual riders on their peak days. This will help the marketing team if they decide to pursue customer interviews; Q1
Select
 start_station_name,
 COUNT(start_station_name) AS rides_from,
 start_lat,
 start_lng
FROM
big-query-practice-413618.Cyclistic_data.Q1_24_trips
WHERE
duration_minutes IS NOT NULL
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL
AND duration_minutes >= 2
AND rideable_type != "docked_bike"
AND day_of_week IN ("Saturday", "Sunday")
AND member_casual IN ('casual')
GROUP BY
 start_station_name,
 start_lat,
 start_lng
ORDER BY
 rides_from
 DESC LIMIT 10;

-- Q2
Select
 start_station_name,
 COUNT(start_station_name) AS rides_from,
 start_lat,
 start_lng
FROM
big-query-practice-413618.Cyclistic_data.Q2_24_trips
WHERE
duration_minutes IS NOT NULL
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL
AND duration_minutes >= 2
AND rideable_type != "docked_bike"
AND day_of_week IN ("Saturday", "Sunday")
AND member_casual IN ('casual')
GROUP BY
 start_station_name,
 start_lat,
 start_lng
ORDER BY
 rides_from
 DESC LIMIT 10;

--Q3
Select
 start_station_name,
 COUNT(start_station_name) AS rides_from,
 start_lat,
 start_lng
FROM
big-query-practice-413618.Cyclistic_data.Q3_23_trips
WHERE
duration_minutes IS NOT NULL
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL
AND duration_minutes >= 2
AND rideable_type != "docked_bike"
AND day_of_week IN ("Saturday", "Sunday")
AND member_casual IN ('casual')
GROUP BY
 start_station_name,
 start_lat,
 start_lng
ORDER BY
 rides_from
 DESC LIMIT 10;

-- Q4
Select
 start_station_name,
 COUNT(start_station_name) AS rides_from,
 start_lat,
 start_lng
FROM
big-query-practice-413618.Cyclistic_data.Q4_23_trips
WHERE
duration_minutes IS NOT NULL
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL
AND duration_minutes >= 2
AND rideable_type != "docked_bike"
AND day_of_week IN ("Saturday", "Sunday")
AND member_casual IN ('casual')
GROUP BY
 start_station_name,
 start_lat,
 start_lng
ORDER BY
 rides_from
 DESC LIMIT 10;
