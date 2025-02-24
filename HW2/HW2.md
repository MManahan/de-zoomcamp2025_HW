# HW 2 (Kestra) solutions. 

### #1 Within the execution for Yellow Taxi data for the year 2020 and month 12: what is the uncompressed file size (i.e. the output file yellow_tripdata_2020-12.csv of the extract task)?

### `128.3 mb`

### #2 What is the rendered value of the variable file when the inputs taxi is set to green, year is set to 2020, and month is set to 04 during execution?

### `green_tripdata_2020-04.csv`

### #3 How many rows are there for the Yellow Taxi data for all CSV files in the year 2020?

```
SELECT COUNT(unique_row_id)
FROM public.yellow_tripdata
WHERE filename LIKE 'yellow_tripdata_2020%'
```
### `24,648,499`

### #4 How many rows are there for the Green Taxi data for all CSV files in the year 2020?

```
SELECT COUNT(unique_row_id)
FROM public.green_tripdata
WHERE filename LIKE 'green_tripdata_2020%'
```

### `1,734,051`

### #5 How many rows are there for the Yellow Taxi data for the March 2021 CSV file?

```
SELECT COUNT(unique_row_id)
FROM public.yellow_tripdata
WHERE filename LIKE 'yellow_tripdata_2021-03%'
```

### `1,925,152`

### #6 How would you configure the timezone to New York in a Schedule trigger?

### `Add a timezone property set to UTC-5 in the Schedule trigger configuration`