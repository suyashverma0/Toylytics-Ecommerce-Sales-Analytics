-- Basic kpi
 -- TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;
--  TOTAL UNIQUE USERS
SELECT COUNT(DISTINCT user_id) AS total_users
FROM orders;

-- total item purchased 
SELECT SUM(items_purchased) AS total_items
FROM orders;

--  AVERAGE ITEMS PER ORDER
SELECT
    AVG(items_purchased) AS avg_items_per_order
FROM orders;

 -- TOTAL REVENUE
 SELECT
    SUM(items_purchased * price_usd) AS total_revenue
FROM orders;

-- REVENUE, COGS AND PROFIT
SELECT

    -- Total sales revenue
    SUM(items_purchased * price_usd) AS total_revenue,

    -- Total product cost
    SUM(cogs_usd) AS total_cogs,

    -- Revenue minus cost
    SUM(items_purchased * price_usd)
        - SUM(cogs_usd) AS total_profit

FROM orders;

-- AVERAGE ORDER VALUE
SELECT

    SUM(items_purchased * price_usd)
    / COUNT(DISTINCT order_id) AS average_order_value

FROM orders;