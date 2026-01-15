with orders as (

    select
        ID as order_id,
        USER_ID as customer_id,
        ORDER_DATE as order_date,
        STATUS as status

    from {{ ref('raw_orders') }}

)

select *
from orders