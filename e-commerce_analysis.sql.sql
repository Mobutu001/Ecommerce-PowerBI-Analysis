
CREATE DATABASE olist_ecommerce;

USE olist_ecommerce;

SELECT * FROM customers;

SELECT order_id FROM orders;

SELECT * FROM [dbo].[order_items]

SELECT * FROM [dbo].[products]

SELECT * FROM [dbo].[sellers]

SELECT * FROM [dbo].[payments]

SELECT * FROM [dbo].[reviews]

SELECT * FROM [dbo].[geolocation]

SELECT * FROM [dbo].[category_translation]

DELETE FROM [dbo].[category_translation]
WHERE product_category_name = 'product_category_name'
AND product_category_name_english = 'product_category_name_english';




SELECT 
    SUM(payment_value) AS total_revenue
FROM payments;


SELECT 
    payment_type,
    SUM(payment_value) AS total_revenue
FROM payments
GROUP BY payment_type
ORDER BY total_revenue DESC;


SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

SELECT product_category_name_english AS product_category,
      SUM(price) AS product_revenue
FROM [dbo].[order_items] AS oi
JOIN [dbo].[products] AS p
ON oi.product_id = p.product_id
JOIN [dbo].[category_translation] AS ct
ON p.product_category_name = ct.product_category_name
GROUP BY product_category_name_english
ORDER BY product_revenue DESC;


SELECT TOP 10 product_id,
    COUNT(*) AS total_items_sold,
    SUM(price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC;



SELECT product_id,
    COUNT(*) AS total_items_sold,
    SUM(price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC;


SELECT 
    DATEDIFF(day,order_purchase_timestamp, order_delivered_customer_date) AS delivery_days,
   review_score
FROM orders AS o
JOIN reviews AS r
ON o.order_id = r.order_id
WHERE order_delivered_customer_date IS NOT NULL;


SELECT 
   AVG(DATEDIFF(day,order_purchase_timestamp, order_delivered_customer_date)) AS delivery_days,
   review_score
FROM orders AS o
JOIN reviews AS r
ON o.order_id = r.order_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;


SELECT 
    seller_id,
    SUM(price) AS total_revenue,
    COUNT(*) AS items_sold
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC;


SELECT TOP 10
    seller_id,
    SUM(price) AS total_revenue,
    COUNT(*) AS items_sold
FROM order_items 
GROUP BY seller_id
ORDER BY total_revenue DESC;


SELECT TOP 10
    seller_state,
    SUM(price) AS total_revenue
FROM order_items oi
JOIN sellers s
ON oi.seller_id = s.seller_id
GROUP BY seller_state
ORDER BY total_revenue DESC;



SELECT customer_unique_id,
     SUM (payment_value) AS total_spent
FROM [dbo].[customers] AS c
JOIN [dbo].[orders] AS o
ON c.customer_id = o.customer_id
JOIN [dbo].[payments] AS p
ON o.order_id = p.order_id
GROUP BY customer_unique_id
ORDER BY total_spent DESC;


SELECT TOP 10
     customer_unique_id,
     SUM (payment_value) AS total_spent
FROM [dbo].[customers] AS c
JOIN [dbo].[orders] AS o
ON c.customer_id = o.customer_id
JOIN [dbo].[payments] AS p
ON o.order_id = p.order_id
GROUP BY customer_unique_id
ORDER BY total_spent DESC;


SELECT 
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers 
GROUP BY customer_state
ORDER BY total_customers DESC;


SELECT 
    customer_state,
    AVG(DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date)) AS avg_delivery_days,
    COUNT(order_id) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY customer_state
ORDER BY avg_delivery_days DESC;


SELECT 
    COUNT(*) AS late_deliveries
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;


SELECT 
    COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) * 100.0 
    / COUNT(*) AS late_delivery_percentage
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


SELECT 
    FORMAT(order_purchase_timestamp,'yyyy-MM') AS order_month,
    SUM(payment_value) AS total_revenue
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY FORMAT(order_purchase_timestamp,'yyyy-MM')
ORDER BY order_month;


SELECT 
    FORMAT(order_purchase_timestamp,'yyyy-MM') AS order_month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY FORMAT(order_purchase_timestamp,'yyyy-MM')
ORDER BY order_month;


SELECT 
    SUM(payment_value) / COUNT(DISTINCT order_id) AS avg_order_value
FROM payments;


SELECT 
    product_category_name_english AS category,
    AVG(review_score) AS avg_review_score,
    COUNT(review_id) AS total_reviews
FROM order_items AS oi
JOIN products AS p
ON oi.product_id = p.product_id
JOIN category_translation AS ct
ON p.product_category_name = ct.product_category_name
JOIN reviews AS r
ON oi.order_id = r.order_id
GROUP BY product_category_name_english
ORDER BY avg_review_score DESC;


ALTER TABLE reviews
ALTER COLUMN review_score INT;


SELECT 
    review_score,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;


SELECT 
    DATEPART(HOUR, order_purchase_timestamp) AS purchase_hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, order_purchase_timestamp)
ORDER BY purchase_hour;