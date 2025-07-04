with customer_sales as (
    select
    s.customer_id,
    sum (s..quantity_sold) as total_purchases,
    sum (s.total_amount) as total_spend
    from {{ref('stg_retail__fact_sales')}} s
    group by 1
)

SELECT
   cs.customer_id,
   cs.total_purchases,
   cs.total_spend,
   CASE
       WHEN cs.total_purchases >= 50  THEN 'High-Value'
       WHEN cs.total_purchases BETWEEN 20 AND 49 THEN 'Medium-Value'
       WHEN cs.total_purchases < 20  THEN 'Low-Value'
       ELSE 'Unknown'
   END AS customer_segment
FROM customer_sales cs




