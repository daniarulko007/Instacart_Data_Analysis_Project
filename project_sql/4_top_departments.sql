--Top 5 departments by number of orders
SELECT
    d.department,
    COUNT(opp.product_id) AS total_orders
FROM
    order_products__prior opp
JOIN products p ON opp.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY
    d.department
ORDER BY
    total_orders DESC
LIMIT 5;