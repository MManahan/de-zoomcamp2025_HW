# Homework #3 - Data Warehousing

## Create external table referring to gcs path

```
CREATE OR REPLACE EXTERNAL TABLE `de_zoomcamp.yellow_trip_data_2024_01_to_06`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dtc-de-course-448403-zoomcamp-bucket/yellow_tripdata_2024-*.parquet']
);
```

### Question 1: What is count of records for the 2024 Yellow Taxi Data?

```
SELECT COUNT(*) FROM `de_zoomcamp.yellow_trip_data_2024_01_to_06` ;
```

`20,332,093`


### Question # 2 
#### Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.

```
SELECT COUNT(DISTINCT(PULocationID)) FROM `de_zoomcamp.yellow_trip_data_2024_01_to_06`;
```
```
SELECT COUNT(DISTINCT(PULocationID)) FROM `de_zoomcamp.yellow_trip_data_2024_01_to_06_NON-Partitioned`;
```
### What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?
 
 `0 MB for the External Table and 155.12 MB for the Materialized Table`

### Question # 3 
#### Write a query to retrieve the PULocationID from the table (not the external table) in BigQuery.

```
SELECT PULocationID from `de_zoomcamp.yellow_trip_data_2024_01_to_06_NON-Partitioned`;
```
#### Now write a query to retrieve the PULocationID and DOLocationID on the same table. Why are the estimated number of Bytes different?

```
SELECT PULocationID, DOLocationID from `de_zoomcamp.yellow_trip_data_2024_01_to_06_NON-Partitioned`;
```

`BigQuery is a columnar database, and it only scans the specific columns requested in the query. Querying two columns (PULocationID, DOLocationID) requires reading more data than querying one column (PULocationID), leading to a higher estimated number of bytes processed.`

### Question # 4 : How many records have a fare_amount of 0?

```
SELECT COUNT(*) FROM `de_zoomcamp.yellow_trip_data_2024_01_to_06` WHERE fare_amount = 0;
```
`8,333`

### Question # 5 : What is the best strategy to make an optimized table in Big Query if your query will always filter based on tpep_dropoff_datetime and order the results by VendorID (Create a new table with this strategy)

`Partition by tpep_dropoff_datetime and Cluster on VendorID`

### Question # 6 

`310.24 MB for non-partitioned table and 26.84 MB for the partitioned table`

```
SELECT distinct(VendorID)
FROM `de_zoomcamp.yellow_trip_data_2024_01_to_06_NON-Partitioned`
WHERE tpep_dropoff_datetime between '2024-03-01' and '2024-03-15';
```
```
SELECT distinct(VendorID)
FROM `de_zoomcamp.yellow_trip_data_2024_01_to_06_Partitioned`
WHERE tpep_dropoff_datetime between '2024-03-01' and '2024-03-15';
```

### Question # 7 : Where is the data stored in the External Table you created?

`GCP Bucket`

### Question # 8 : It is best practice in Big Query to always cluster your data
`False`


