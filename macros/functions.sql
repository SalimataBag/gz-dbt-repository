{% macro margin_percent (margin, revenue) %}
     ROUND(safe_divide
        ({{margin}},{{revenue}}),2
     )
 {% endmacro %}