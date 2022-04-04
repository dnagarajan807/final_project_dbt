{{ config(materialized='view') }}

SELECT distinct start_station_name as StationName
FROM {{ source('staging','external_divvy_trips')}}
union distinct
SELECT distinct end_station_name as StationName
FROM {{ source('staging','external_divvy_trips')}}