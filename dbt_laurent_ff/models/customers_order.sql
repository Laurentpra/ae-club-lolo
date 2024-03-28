{{ config(
    materialized='table'
) }}

SELECT
    *
FROM `analytics-engineers-club.coffee_shop.orders`
