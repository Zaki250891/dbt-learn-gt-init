{{ config(materialized='table') }}

with customer_base as (

    select
        customer_id,
        first_name,
        last_name
    from {{ ref('stg_customers') }}

),

orders_agg as (

    select
        customer_id,
        sum(amount) as lifetime_value
    from {{ ref('fct_orders') }}
    group by customer_id

)

select
    cb.customer_id,
    cb.first_name,
    cb.last_name,
    coalesce(oa.lifetime_value, 0) as lifetime_value
from customer_base cb
left join orders_agg oa
    on cb.customer_id = oa.customer_id
