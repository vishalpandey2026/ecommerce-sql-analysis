USE ecommerce_analytics;

-- 1. Customer-wise spending
SELECT c.customer_name,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 2. Repeat customers
SELECT c.customer_name,
       COUNT(o.order_id) AS delivered_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY delivered_orders DESC;

-- 3. Revenue by city
SELECT c.city,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY revenue DESC;

-- 4. Customer spending category
SELECT c.customer_name,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent,
       CASE
           WHEN SUM(oi.quantity * oi.unit_price) >= 3000 THEN 'High Value'
           WHEN SUM(oi.quantity * oi.unit_price) >= 1500 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;
