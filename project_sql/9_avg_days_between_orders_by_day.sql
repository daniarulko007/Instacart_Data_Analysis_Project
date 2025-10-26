--Average days between orders by day of the week
SELECT
    CASE
        order_dow
        WHEN 0 THEN 'Sunday'
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
    END AS day_of_week,
    ROUND(AVG(days_since_prior_order) :: numeric, 0) AS avg_days_between_orders
FROM
    orders
WHERE
    days_since_prior_order IS NOT NULL
GROUP BY
    order_dow
ORDER BY
    order_dow;