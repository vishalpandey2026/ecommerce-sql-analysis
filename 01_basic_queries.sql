USE ecommerce_analytics;

-- 1. View all customers
SELECT * FROM customers;

-- 2. View products above a chosen price
SELECT product_name, price
FROM products
WHERE price > 1000
ORDER BY price DESC;

-- 3. Find customers from Maharashtra or Uttar Pradesh
SELECT customer_name, city, state
FROM customers
WHERE state = 'Maharashtra' OR state = 'Uttar Pradesh';

-- 4. Show delivered orders
SELECT *
FROM orders
WHERE order_status = 'Delivered'
ORDER BY order_date;

-- 5. Count customers by state
SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC;
