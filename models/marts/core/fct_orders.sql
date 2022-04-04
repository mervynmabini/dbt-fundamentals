with orders as (    
    select * from {{ ref('stg_orders')}}
),

payment as (
    select * from raw.stripe.payment
),

fct_orders as (
    select 
        orders.order_id,
        orders.customer_id,
        payment.amount

    from orders
    
    left join payment on orders.order_id = payment.orderid
)

select * from fct_orders