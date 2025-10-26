--Top 10 products
SELECT
    product_name,
    COUNT(*) AS count_products
FROM
    order_products__prior opp
JOIN products p ON opp.product_id = p.product_id
GROUP BY
    product_name
ORDER BY
    count_products DESC
LIMIT 10;