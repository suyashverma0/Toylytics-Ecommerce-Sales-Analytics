CREATE DATABASE toylytics;
USE toylytics;
SELECT DATABASE();
SHOW TABLES;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE products;
DESCRIBE order_item_refunds;

DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE products;
DESCRIBE order_item_refunds;


SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'order_item_refunds', COUNT(*) FROM order_item_refunds;



SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM order_item_refunds LIMIT 5;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM orders;

SELECT
    COUNT(*) AS total_rows,

    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,

    SUM(CASE WHEN created_at IS NULL THEN 1 ELSE 0 END) AS null_created_at,

    SUM(CASE WHEN website_session_id IS NULL THEN 1 ELSE 0 END) AS null_session_id,

    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,

    SUM(CASE WHEN primary_product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,

    SUM(CASE WHEN items_purchased IS NULL THEN 1 ELSE 0 END) AS null_items,

    SUM(CASE WHEN price_usd IS NULL THEN 1 ELSE 0 END) AS null_price,

    SUM(CASE WHEN cogs_usd IS NULL THEN 1 ELSE 0 END) AS null_cogs

FROM orders;

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;



SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_item_id) AS unique_order_items,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT product_id) AS unique_products
FROM order_items;

