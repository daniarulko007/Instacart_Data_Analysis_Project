--Orders distribution by dataset type
SELECT
    eval_set,
    count(*) AS orders_count
FROM
    orders
GROUP BY
    eval_set
ORDER BY
    eval_set DESC;