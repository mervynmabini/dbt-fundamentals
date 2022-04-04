 with payments as (
    
    select
        -- amount is stored in cents, converted to dollars
        amount / 100 as amount,
        created as created_at,
        id as payment_id, 
        orderid as order_id,
        paymentmethod as payment_method,
        status

    from raw.stripe.payment
)

select * from payments