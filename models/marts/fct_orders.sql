with orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select
        order_id,
        customer_id,
        store_id,
        ordered_at,
        subtotal,
        tax_paid,
        order_total
    from orders
)

select * from final
