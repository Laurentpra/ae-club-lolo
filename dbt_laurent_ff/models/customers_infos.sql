{{ config(
    materialized='table'
) }}

WITH customer_orders AS (
    SELECT 
        customer_id, 
        COUNT(*) AS number_of_orders,
        MIN(created_at) AS first_order_at
    FROM {{ ref('customers_order') }}
    GROUP BY 1 
)

SELECT 
    customers.id AS customer_id,
    customers.name,
    customers.email,
    customer_orders.first_order_at,
    customer_orders.number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS customers 
LEFT JOIN customer_orders
    ON customers.id = customer_orders.customer_id
