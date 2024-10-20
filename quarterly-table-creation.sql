-- After uploading datasets to BigQuery via Google Cloud bucket, I created 4 new tables for each Quarter of the year. This allowed me to more easily analyze the datasets, as well as do it on a seasonal basis. I also added 2 new columns to these tables: duration_minutes and day_of_week


CREATE TABLE big-query-practice-413618.Cyclistic_data.Q1_24_trips_w_duration AS
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
FROM big-query-practice-413618.Cyclistic_data.Jan_24_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
FROM big-query-practice-413618.Cyclistic_data.Feb_24_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
FROM big-query-practice-413618.Cyclistic_data.Mar_24_trip_data;


CREATE TABLE big-query-practice-413618.Cyclistic_data.Q2_24_trips AS
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.April_24_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.May_24_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.June_24_trip_data;


CREATE TABLE big-query-practice-413618.Cyclistic_data.Q3_23_trips AS
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.July_23_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.Aug_23_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.Sept_23_trip_data;


CREATE TABLE big-query-practice-413618.Cyclistic_data.Q4_23_trips AS
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.Oct_23_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.Nov_23_trip_data
UNION ALL
SELECT
 *,
 TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
 FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
FROM big-query-practice-413618.Cyclistic_data.Dec_23_trip_data;


