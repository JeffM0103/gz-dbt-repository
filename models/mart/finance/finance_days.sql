{{config(materialized="table")}}
SELECT
  ### Key ###
  date_date
  ###########
  -- orders infos --
	,COUNT(orders_id) AS nb_transaction
    ,SUM(quantity) AS quantity 
    ,ROUND(SUM(revenue),0) AS turnover 
	,ROUND(AVG(revenue),1) AS average_basket
	,ROUND(SUM(revenue)/COUNT(orders_id),1) AS average_basket_bis
    ,ROUND(SUM(purchase_cost),0) AS purchase_cost 
    ,ROUND(SUM(margin),0) AS margin 
  -- ship infos --
    ,ROUND(SUM(shipping_fee),0) AS shipping_fee 
    ,ROUND(SUM(logcost),0) AS logcost 
    ,ROUND(SUM(CAST(ship_cost AS FLOAT64)), 0) AS ship_cost
  -- Operational margin --
    ,ROUND(SUM(operational_margin), 0) AS operational_margin
FROM {{ref("int_orders_operational")}}
GROUP BY
  date_date
ORDER BY
  date_date DESC