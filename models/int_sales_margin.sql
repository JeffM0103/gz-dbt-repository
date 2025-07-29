

SELECT *,
purchase_price * quantity AS purchase_cost,
revenue - (purchase_price * quantity) AS margin
FROM {{ref('stg_raw__sales')}}
JOIN {{ref('stg_raw__product')}}
USING (products_id)
