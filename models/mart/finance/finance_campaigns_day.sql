SELECT
date_date,
operational_margin - ads_cost AS ads_margin,
average_basket,
operational_margin,
ads_cost,
impression,
click,
quantity,
turnover,
purchase_cost,
margin,
shipping_fee,
logcost,
ship_cost
FROM {{ ref('finance_days') }}
JOIN {{ ref('int_campaigns_day') }}
USING (date_date)
ORDER BY ads_margin DESC