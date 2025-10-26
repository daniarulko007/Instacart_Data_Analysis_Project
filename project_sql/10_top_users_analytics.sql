WITH user_orders AS (
    SELECT
        o.user_id,
        o.order_id,
        o.order_dow,
        o.days_since_prior_order,
        COUNT(product_id) AS products_in_order
    FROM
        orders o
        JOIN order_products__prior opp ON o.order_id = opp.order_id
    GROUP BY
        o.user_id,
        o.order_id,
        o.order_dow,
        o.days_since_prior_order
),
user_summary AS (
    SELECT
        user_id,
        COUNT(order_id) AS total_orders,
        SUM(products_in_order) AS total_products,
        ROUND(AVG(products_in_order) :: numeric, 0) AS avg_products_per_order,
        ROUND(AVG(days_since_prior_order) :: numeric, 0) AS avg_days_between_orders
    FROM
        user_orders
    GROUP BY
        user_id
),
user_top_department AS (
    SELECT
        u.user_id,
        d.department,
        COUNT(*) AS dept_orders,
        RANK() OVER (PARTITION BY u.user_id ORDER BY COUNT(*) DESC) AS rank
    FROM
        user_orders u
        JOIN order_products__prior opp ON u.order_id = opp.order_id
        JOIN products p ON opp.product_id = p.product_id
        JOIN departments d ON p.department_id = d.department_id
    GROUP BY u.user_id, d.department
)
SELECT
    us.user_id,
    total_products,
    total_orders,
    avg_products_per_order,
    avg_days_between_orders,
    utd.department AS favorite_department
FROM user_summary us
LEFT JOIN user_top_department utd ON us.user_id = utd.user_id AND utd.rank = 1
ORDER BY total_products DESC
LIMIT 10;