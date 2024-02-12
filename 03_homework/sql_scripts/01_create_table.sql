-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `my-de-zoomcamp-project.nytaxi.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://de-zoomcamp-sh-taxi-data-gcs/green/green_tripdata_2022-*.parquet']
);


CREATE OR REPLACE TABLE `my-de-zoomcamp-project.nytaxi.green_tripdata` AS 
SELECT * FROM `my-de-zoomcamp-project.nytaxi.external_green_tripdata`;