WITH sub1 as (
    select sales.date_date,
        sales.orders_id,
        sales.products_id,
        sales.revenue,
        sales.quantity,
        product.purchase_price
    FROM {{ ref('stg_gz__sales') }} as sales
    INNER JOIN {{ ref('stg_gz__product') }} as product
    ON sales.products_id = product.products_id
)
    SELECT
        sub1.date_date,
        sub1.orders_id,
        sub1.products_id,
        sub1.revenue,
        sub1.quantity,
        sub1.purchase_price
        ,ROUND(safe_multiply(quantity, purchase_price),2) as purchase_cost
        ,ROUND(safe_subtract(revenue, (Safe_multiply(quantity, purchase_price))), 2) AS margin
    FROM sub1