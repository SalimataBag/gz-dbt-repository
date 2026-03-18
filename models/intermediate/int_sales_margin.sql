WITH sub1 as (
    select*
    FROM {{ ref('stg_gz__sales') }} as sales
    INNER JOIN {{ ref('stg_gz__product') }} as product
    ON sales.products_id = product.products_id
)
    SELECT
        *
        ,ROUND(safe_multiply(quantity, purchase_price),2) as purchase_cost
        ,ROUND(safe_subtract(revenue, (Safe_multiply(quantity, purchase_price))), 2) AS margin
    FROM sub1