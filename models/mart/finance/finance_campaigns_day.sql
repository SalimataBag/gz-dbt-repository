SELECT
c.date_date,
ROUND(operational_margin - ads_cost) as ads_margin,
ads_cost,
impression AS ads_impression,
click ads_clicks,
nb_transactions,
revenue,
average_basket,
operational_margin,
purchase_cost,
shipping_fee,
logcost,
total_quantity AS quantity
FROM {{ ref('int_campaigns_day') }} as c
JOIN {{ ref('finance_days') }} as f
ON c.date_date = f.date_date