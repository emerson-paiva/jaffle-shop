WITH customers AS (
  /* Customer overview data mart, offering key details for each unique customer. One row per customer. */
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'customers') }}
), customer_orders_lifetime_sql AS (
  SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    LIFETIME_SPEND,
    COUNT_LIFETIME_ORDERS
  FROM customers
)
SELECT
  *
FROM customer_orders_lifetime_sql