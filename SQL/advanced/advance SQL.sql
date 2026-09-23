-- ADVANCED SQL

 -- PRODUCT REVENUE RANKING
 
 SELECT

    p.product_name,

    SUM(oi.price_usd) AS revenue,

    RANK() OVER (
        ORDER BY SUM(oi.price_usd) DESC
    ) AS revenue_rank

FROM order_items AS oi

JOIN products AS p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name;
    
-- CTE EXAMPLE
-- Common Table Expression
WITH monthly_sales AS (

    SELECT

        YEAR(created_at) AS year,

        MONTH(created_at) AS month,

        SUM(items_purchased * price_usd) AS revenue

    FROM orders

    GROUP BY
        YEAR(created_at),
        MONTH(created_at)
)

SELECT *

FROM monthly_sales

ORDER BY
    year,
    month;
-- MONTH-OVER-MONTH REVENUE
WITH monthly_sales AS (

    SELECT

        YEAR(created_at) AS year,

        MONTH(created_at) AS month,

        SUM(items_purchased * price_usd) AS revenue

    FROM orders

    GROUP BY
        YEAR(created_at),
        MONTH(created_at)
),

sales_with_previous AS (

    SELECT

        year,

        month,

        revenue,

        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_month_revenue

    FROM monthly_sales
)

SELECT

    year,

    month,

    revenue,

    previous_month_revenue,

    -- Month-over-month growth %
    (
        (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0)
    ) * 100 AS mom_growth_percent

FROM sales_with_previous

ORDER BY
    year,
    month;
    
    
    
-- CUMULATIVE REVENUE
WITH monthly_sales AS (

    SELECT

        YEAR(created_at) AS year,

        MONTH(created_at) AS month,

        SUM(items_purchased * price_usd) AS revenue

    FROM orders

    GROUP BY
        YEAR(created_at),
        MONTH(created_at)
)

SELECT

    year,

    month,

    revenue,

    SUM(revenue) OVER (
        ORDER BY year, month
    ) AS cumulative_revenue

FROM monthly_sales

ORDER BY
    year,
    month;
