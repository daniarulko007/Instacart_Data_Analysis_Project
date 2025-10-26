--Average number of products per order
SELECT
    ROUND(AVG(product_count)::numeric, 2) AS average_products_per_order
FROM
    (
        SELECT
            order_id,
            COUNT(product_id) AS product_count
        FROM
            order_products__prior
        GROUP BY
            order_id
    ) AS order_product_counts;