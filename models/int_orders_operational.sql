SELECT
orders_id,
date_date,
margin + shipping_fee - logcost - ship_cost AS operational_margin
FROM {{"int_orders_margin"}}