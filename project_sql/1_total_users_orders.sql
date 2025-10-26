--Total number of unique users and orders
SELECT
    COUNT(DISTINCT user_id) AS unique_user_count,
    COUNT(DISTINCT order_id) AS unique_order_count
FROM
    ORDERS;