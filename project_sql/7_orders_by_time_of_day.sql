--Orders distribution by time of day
SELECT
    CASE
        WHEN order_hour_of_day BETWEEN 0
        AND 5 THEN 'Night (12AM-5AM)'
        WHEN order_hour_of_day BETWEEN 6
        AND 11 THEN 'Morning (6AM-11AM)'
        WHEN order_hour_of_day BETWEEN 12
        AND 17 THEN 'Afternoon (12PM-5PM)'
        WHEN order_hour_of_day BETWEEN 18
        AND 23 THEN 'Evening (6PM-11PM)'
    END AS time_of_day,
    COUNT(order_id) as total_orders
FROM
    orders
GROUP BY
    time_of_day
ORDER BY
    time_of_day;