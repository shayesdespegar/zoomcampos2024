/** Q1 **/
SELECT count(1) FROM `my-de-zoomcamp-project.nytaxi.external_green_tripdata`;
--840402

/** Q2 **/
SELECT count(distinct PULocationID) FROM `my-de-zoomcamp-project.nytaxi.external_green_tripdata` 
SELECT count(distinct PULocationID) FROM `my-de-zoomcamp-project.nytaxi.green_tripdata` 
--258


/** Q3 **/
SELECT count(1) FROM `my-de-zoomcamp-project.nytaxi.green_tripdata` where fare_amount = 0; 
--1622


/** Q4 **/
CREATE OR REPLACE TABLE `my-de-zoomcamp-project.nytaxi.green_tripdata_partitioned_clustered`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS
SELECT * FROM `my-de-zoomcamp-project.nytaxi.green_tripdata`;


/** Q5 **/
SELECT count(distinct PULocationID) FROM `my-de-zoomcamp-project.nytaxi.green_tripdata` WHERE TIMESTAMP_TRUNC(lpep_pickup_datetime, DAY) between TIMESTAMP("2022-06-01") and TIMESTAMP("2022-06-30")
--12.82 MB
SELECT count(distinct PULocationID) FROM `my-de-zoomcamp-project.nytaxi.green_tripdata_partitioned_clustered` WHERE TIMESTAMP_TRUNC(lpep_pickup_datetime, DAY) between TIMESTAMP("2022-06-01") and TIMESTAMP("2022-06-30")
--1.12 MB

