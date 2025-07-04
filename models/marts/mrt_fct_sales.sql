select
c.customer_name,
p.product_name,
s.store_name,
sale_date,
quantity_sold,
total_amount

from {{ref('stg_retail__fact_sales')}}

join {{ref('stg_retail__dim_customers')}} c

using customer_id

join {{ref('stg_retail__dim_stores')}} s 

using store_id

join {{ref('stg_retail__dim_products')}} p 

using product_id