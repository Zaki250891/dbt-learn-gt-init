select
    o.order_id as order_id,
    o.customer_id as customer_id,
    o.order_date as order_date,
    sum(p.amount) as amount
from {{ ref('stg_orders') }} o
left join {{ ref('stg_stripe_payments') }} p
    on o.order_id = p.order_id
group by 
    o.order_id,
    o.customer_id,
    o.order_date