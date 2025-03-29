{{
    config(
        materialized='table' 
    )
}}

WITH monthly_housing_data_union AS (
    SELECT 
        {{ dbt.safe_cast("period_begin", api.Column.translate_type("DATE")) }} as period_begin,
        {{ dbt.safe_cast("period_end", api.Column.translate_type("DATE")) }} as period_end,
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
    FROM {{ source('staging', 'staging_national_housing_market_data') }}
    
    UNION ALL

    SELECT 
        {{ dbt.safe_cast("period_begin", api.Column.translate_type("DATE")) }} as period_begin,
        {{ dbt.safe_cast("period_end", api.Column.translate_type("DATE")) }} as period_end,
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
    FROM {{ source('staging', 'staging_state_housing_market_data') }}
    
    UNION ALL

    SELECT
        {{ dbt.safe_cast("period_begin", api.Column.translate_type("DATE")) }} as period_begin,
        {{ dbt.safe_cast("period_end", api.Column.translate_type("DATE")) }} as period_end,
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
    FROM {{ source('staging', 'staging_county_housing_market_data') }}
    
    UNION ALL
    
    SELECT
        {{ dbt.safe_cast("period_begin", api.Column.translate_type("DATE")) }} as period_begin,
        {{ dbt.safe_cast("period_end", api.Column.translate_type("DATE")) }} as period_end,
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
    FROM {{ source('staging', 'staging_metro_housing_market_data')}}
    
    UNION ALL
    
    SELECT
        {{ dbt.safe_cast("period_begin", api.Column.translate_type("DATE")) }} as period_begin,
        {{ dbt.safe_cast("period_end", api.Column.translate_type("DATE")) }} as period_end,
        period_duration,
        region_type,
        {{ get_region('region_type', 'city', 'region') }} AS region,
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
    FROM {{source('staging', 'staging_city_housing_market_data')}}
)

SELECT * FROM monthly_housing_data_union
