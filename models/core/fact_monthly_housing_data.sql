{{ config(
        materialized='table',
        partition_by={
            "field": "period_begin",
            "data_type": "DATE"
        }
    ) }}

with fact_monthly_housing_data as(
    SELECT
        EXTRACT(MONTH FROM period_begin) AS month,
        EXTRACT(YEAR FROM period_begin) AS year,
        period_begin,
        period_end,
        period_duration,
        region_type,
        region,
        state_code,
        property_type,
        median_sale_price,
        median_sale_price_mom,
        median_sale_price_yoy,
        median_list_price,
        median_list_price_mom,
        median_list_price_yoy,
        homes_sold,
        homes_sold_mom,
        homes_sold_yoy,
        pending_sales,
        pending_sales_mom,
        pending_sales_yoy,
        new_listings,
        new_listings_mom,
        new_listings_yoy,
        inventory,
        inventory_mom,
        inventory_yoy,
        avg_sale_to_list,
        avg_sale_to_list_mom,
        avg_sale_to_list_yoy,
        sold_above_list,
        sold_above_list_mom,
        sold_above_list_yoy,
        off_market_in_two_weeks,
        off_market_in_two_weeks_mom,
        off_market_in_two_weeks_yoy
    FROM {{ ref('stg_monthly_housing_data_union') }}
)


SELECT 
* 
FROM fact_monthly_housing_data