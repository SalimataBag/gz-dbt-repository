WITH sub1 as 
(
    SELECT o.*,
    s.* EXCEPT(orders_id)       
    FROM {{ ref('int_orders_margin') }} as o
    LEFT JOIN {{ ref('stg_gz__ship') }} as s
    ON o.orders_id = s.orders_id
)
SELECT
    sub1.orders_id,
    sub1.date_date,
    sub1.revenue, 
    sub1.margin,
    sub1.purchase_cost,
    sub1.shipping_fee,
    sub1.logcost,
    sub1.quantity,
    ((sub1.margin+ sub1.shipping_fee)-(sub1.logcost + sub1.ship_cost)) as Operational_margin
FROM sub1