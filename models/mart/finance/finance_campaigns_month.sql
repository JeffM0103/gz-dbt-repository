SELECT
  DATE_TRUNC(date_date, MONTH) AS month,
  SUM(operational_margin - ads_cost) AS ads_margin,
  AVG(average_basket) AS average_basket,
  SUM(operational_margin) AS operational_margin,
  SUM(ads_cost) AS ads_cost,
  SUM(impression) AS impression,
  SUM(click) AS click,
  SUM(quantity) AS quantity,
  SUM(turnover) AS turnover,
  SUM(purchase_cost) AS purchase_cost,
  SUM(margin) AS margin,
  SUM(shipping_fee) AS shipping_fee,
  SUM(logcost) AS logcost,
  SUM(ship_cost) AS ship_cost
FROM {{ ref('finance_days') }}
JOIN {{ ref('int_campaigns_day') }}
USING (date_date)
GROUP BY month
ORDER BY ads_margin DESC
