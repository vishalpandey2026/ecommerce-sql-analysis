USE ecommerce_analytics;

-- 1. Top 3 products by revenue
SELECT product_name, revenue
FROM (
    SELECT p.product_name,
           SUM(oi.quantity * oi.unit_price) AS revenue,
           DENSE_RANK() OVER (
               ORDER BY SUM(oi.quantity * oi.unit_price) DESC
           ) AS product_rank
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
) ranked_products
WHERE product_rank <= 3
ORDER BY revenue DESC;

-- 2. Customer revenue using a CTE
WITH customer_sales AS (
    SELECT c.customer_id,
           c.customer_name,
           SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name,
       ROUND(total_spent, 2) AS total_spent
FROM customer_sales
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_sales)
ORDER BY total_spent DESC;

-- 3. Rank products within each category
SELECT c.category_name,
       p.product_name,
       SUM(oi.quantity * oi.unit_price) AS revenue,
       RANK() OVER (
           PARTITION BY c.category_id
           ORDER BY SUM(oi.quantity * oi.unit_price) DESC
       ) AS category_rank
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_id, c.category_name, p.product_id, p.product_name
ORDER BY c.category_name, category_rank;
