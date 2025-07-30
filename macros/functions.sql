-- margin_percent = margin/revenue

{% macro margin_percent(margin, turnover, decimals=2) %}
    ROUND(SAFE_DIVIDE({{ margin }}, {{ turnover }}), {{ decimals }})
{% endmacro %}
