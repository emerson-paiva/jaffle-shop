WITH customers AS (
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'customers') }}
),
customer_orders_lifetime_sql AS (
  SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    LIFETIME_SPEND,
    COUNT_LIFETIME_ORDERS,
    CASE
      WHEN COUNT_LIFETIME_ORDERS = 0 THEN NULL
      ELSE LIFETIME_SPEND * 1.0 / COUNT_LIFETIME_ORDERS
    END AS avg_order_value
  FROM customers
)

SELECT * FROM customer_orders_lifetime_sql