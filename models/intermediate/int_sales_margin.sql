WITH base AS (
  SELECT
    *,
    purchase_price * quantity AS purchase_cost,
    revenue - (purchase_price * quantity) AS margin
  FROM {{ ref('stg_raw__sales') }}
  JOIN {{ ref('stg_raw__product') }}
  USING (products_id)
)

SELECT
  *,
  ROUND(purchase_cost, 2) AS purchase_cost,
  ROUND(margin, 2) AS margin,
  {{ margin_percent('margin', 'revenue') }} AS margin_percent
FROM base
