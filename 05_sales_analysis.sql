USE ecommerce_analytics;

-- 1. Revenue from delivered orders only
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';

-- 2. Revenue by product
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 3. Revenue by category
SELECT c.category_name,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_name
ORDER BY revenue DESC;

-- 4. Average order value
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT o.order_id,
           SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_id
) AS order_summary;

-- 5. Monthly revenue
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY sales_month
ORDER BY sales_month;
