with items as (
    select * from {{ ref('stg_items') }}
),

products as (
    select * from {{ ref('dim_products') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select
        items.item_id,
        items.order_id,
        orders.store_id,
        orders.ordered_at,
        items.product_sku,
        products.product_name,
        products.product_type,
        products.retail_price,
        products.production_cost,
        products.unit_profit_margin
    from items
    left join orders using (order_id)
    left join products using (product_sku)
)

select * from final
