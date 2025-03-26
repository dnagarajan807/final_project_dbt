{{ config(materialized='view') }}

    SELECT
	    month,
        year,
        region_type,
        region,
        state_code,
        property_type,
        AVG(median_sale_price) as median_sale_price,
        AVG(median_list_price) as median_list_price,
        AVG(homes_sold) as homes_sold,
        AVG(pending_sales) as pending_sales,
        AVG(new_listings) as new_listings,
        AVG(inventory) as inventory,
        AVG(avg_sale_to_list) as avg_sale_to_list,
        AVG(sold_above_list) as sold_above_list,
        AVG(off_market_in_two_weeks) as off_market_in_two_weeks
    FROM {{ ref('fact_monthly_housing_data') }}
    WHERE year = EXTRACT(YEAR FROM Current_date())
    GROUP BY
    month,
    year,
    region_type,
    region,
    state_code,
    property_type