{% macro start_date_to_day(started_at) -%}

    FORMAT_DATE('%A', DATE(started_at))

{%- endmacro %}


{% macro end_date_to_day(ended_at) -%}

    FORMAT_DATE('%A', DATE(ended_at))

{%- endmacro %}


{% macro test(start_lat) -%}
    start_lat + 1

{%- endmacro %}

{% macro get_region(region_type, city, region) %}
    CASE 
        WHEN {{ region_type }} = 'place' THEN {{ city }}
        ELSE {{ region }}
    END
{% endmacro %}