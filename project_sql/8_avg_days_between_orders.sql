--Average days between orders
SELECT
    ROUND(AVG(days_since_prior_order) :: numeric, 0) as average_days_between_orders
FROM
    orders
WHERE
    days_since_prior_order IS NOT NULL;