-- STEP 23: YEAR-WISE REVENUE
SELECT

    YEAR(created_at) AS year,

    SUM(items_purchased * price_usd) AS revenue

FROM orders

GROUP BY YEAR(created_at)

ORDER BY year;

-- MONTHLY REVENUE
SELECT

    YEAR(created_at) AS year,

    MONTH(created_at) AS month,

    SUM(items_purchased * price_usd) AS revenue

FROM orders

GROUP BY
    YEAR(created_at),
    MONTH(created_at)

ORDER BY
    year,
    month;
    
    
    
-- PRODUCT ANALYSIS
-- PRODUCT-WISE 

SELECT

    p.product_id,

    p.product_name,

    SUM(oi.price_usd) AS revenue

FROM order_items AS oi

JOIN products AS p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY revenue DESC;

   -- PRODUCT-WISE UNITS SOLD
    SELECT

    p.product_id,

    p.product_name,

    COUNT(*) AS units_sold

FROM order_items AS oi

JOIN products AS p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY units_sold DESC;
   
-- PRODUCT-WISE PROFIT
SELECT

    p.product_id,

    p.product_name,

    -- Revenue
    SUM(oi.price_usd) AS revenue,

    -- Cost
    SUM(oi.cogs_usd) AS cogs,

    -- Profit
    SUM(oi.price_usd - oi.cogs_usd) AS profit

FROM order_items AS oi

JOIN products AS p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY profit DESC;


-- USER ANALYSIS   

 -- ORDERS PER USER
 SELECT

    user_id,

    COUNT(DISTINCT order_id) AS total_orders

FROM orders

GROUP BY user_id

ORDER BY total_orders DESC;

-- REVENUE PER USER
SELECT

    user_id,

    SUM(items_purchased * price_usd) AS total_revenue

FROM orders

GROUP BY user_id

ORDER BY total_revenue DESC;

-- REFUND ANALYSIS

 -- TOTAL REFUND RECORDS
 
 SELECT
    COUNT(*) AS total_refunds
FROM order_item_refunds;

-- NUMBER OF REFUNDED ORDERS
SELECT

    COUNT(DISTINCT order_id) AS refunded_orders

FROM order_item_refunds;


-- REFUND RATE
SELECT

    COUNT(DISTINCT r.order_id) * 100.0
    / COUNT(DISTINCT o.order_id) AS refund_rate_percent

FROM orders AS o

LEFT JOIN order_item_refunds AS r
    ON o.order_id = r.order_id;


--  PRODUCT-WISE REFUNDS
SELECT

    p.product_id,

    p.product_name,

    -- Number of refund records
    COUNT(DISTINCT r.order_item_refund_id) AS refund_count,

    -- Total refunded money
    SUM(r.refund_amount_usd) AS total_refund_amount

FROM order_item_refunds AS r

JOIN order_items AS oi
    ON r.order_item_id = oi.order_item_id

JOIN products AS p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY total_refund_amount DESC;
