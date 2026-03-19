WITH subq1 AS (
SELECT
EXTRACT(MONTH FROM date_date) as datemonth,
ads_margin,
ads_cost,
ads_impression,
ads_clicks,
nb_transactions,
revenue,
average_basket,
operational_margin,
purchase_cost,
shipping_fee,
logcost,
quantity
FROM {{ ref('finance_campaigns_day') }}
)
SELECT datemonth,
SUM(ads_margin) AS ads_margin,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) AS ads_impression,
SUM(ads_clicks) AS ads_clicks,
SUM(nb_transactions) AS nb_transactions,
SUM(revenue) AS revenue,
SUM(average_basket) AS average_basket,
SUM(operational_margin) AS operational_margin,
SUM(purchase_cost) AS purchase_cost,
SUM(shipping_fee) AS shipping_fee,
SUM(logcost) AS logcost,
SUM(quantity) AS quantity
FROM subq1
GROUP BY datemonth