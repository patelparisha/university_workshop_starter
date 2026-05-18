with source as (

    select * from {{ source('jaffle_shop', 'raw_orders') }}

),

renamed as (

    select
        id as order_id,
        customer as customer_id,
        ordered_at as ordered_at,
        store_id as store_id,
        subtotal as subtotal,
        tax_paid as tax_paid,
        order_total as order_total

    from source

)

select * from renamed