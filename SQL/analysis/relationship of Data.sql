--  ORDER_ITEMS → ORDERS RELATIONSHIP


SELECT
    oi.order_item_id,
    oi.order_id
FROM order_items AS oi

LEFT JOIN orders AS o
    ON oi.order_id = o.order_id

WHERE o.order_id IS NULL;


-- ORDER_ITEMS → PRODUCTS RELATIONSHIP
SELECT
    oi.order_item_id,
    oi.product_id
FROM order_items AS oi

LEFT JOIN products AS p
    ON oi.product_id = p.product_id

WHERE p.product_id IS NULL;

-- REFUNDS → ORDERS RELATIONSHIP


SELECT
    r.order_id
FROM refunds AS r

LEFT JOIN orders AS o
    ON r.order_id = o.order_id

WHERE o.order_id IS NULL;

 -- REFUNDS → ORDER_ITEMS RELATIONSHIP
 SELECT
    r.order_item_refund_id,
    r.order_item_id
FROM refunds AS r

LEFT JOIN order_items AS oi
    ON r.order_item_id = oi.order_item_id

WHERE oi.order_item_id IS NULL;