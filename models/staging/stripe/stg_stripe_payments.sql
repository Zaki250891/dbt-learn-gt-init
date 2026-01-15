with payments as (

    select
        ID as order_id,
        AMOUNT as amount
    from {{ source('jaffle_shop', 'stripe_payments') }}

)

select *
from payments
