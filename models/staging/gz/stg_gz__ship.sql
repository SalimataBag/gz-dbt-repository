with 

source as (

    select * from {{ source('gz', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        safe_subtract(shipping_fee, shipping_fee_1) as diff_shipping_fee,
        logcost,
        CAST(ship_cost AS float64) AS ship_cost

    from source

)

select * from renamed