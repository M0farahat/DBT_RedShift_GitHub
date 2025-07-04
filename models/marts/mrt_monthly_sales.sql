select

extract(year from sale_date) as year,
extract(month from sale_date) as month,
count (sale_id) as total_transactions,
sum (total_amount) as total_salesو
total_sales / total_transactions AS avg_sales_per_transaction

from {{ref('stg_retail__fact_sales')}}

group by 1,2

order by year,month ;