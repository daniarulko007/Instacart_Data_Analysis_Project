--Orders distribution by time of day
SELECT
    time_of_day,
    COUNT(order_id) AS total_orders
FROM (
    SELECT
        CASE
            WHEN order_hour_of_day BETWEEN 0 AND 5 THEN 'Night (12AM-5AM)'
            WHEN order_hour_of_day BETWEEN 6 AND 11 THEN 'Morning (6AM-11AM)'
            WHEN order_hour_of_day BETWEEN 12 AND 17 THEN 'Afternoon (12PM-5PM)'
            WHEN order_hour_of_day BETWEEN 18 AND 23 THEN 'Evening (6PM-11PM)'
        END AS time_of_day,
        order_id
    FROM orders
) AS sub
GROUP BY time_of_day
ORDER BY
    CASE
        WHEN time_of_day = 'Night (12AM-5AM)' THEN 1
        WHEN time_of_day = 'Morning (6AM-11AM)' THEN 2
        WHEN time_of_day = 'Afternoon (12PM-5PM)' THEN 3
        WHEN time_of_day = 'Evening (6PM-11PM)' THEN 4
    END;
