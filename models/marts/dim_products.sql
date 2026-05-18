with products as (
    select * from {{ ref('stg_products') }}
),

supplies as (
    select * from {{ ref('stg_supplies') }}
),

product_costs as (
    select
        supply_sku as product_sku,
        sum(supply_cost) as total_supply_cost
    from supplies
    group by 1
),

final as (
    select
        products.product_sku,
        products.product_name,
        products.product_type,
        products.product_price as retail_price,
        coalesce(product_costs.total_supply_cost, 0) as production_cost,
        (products.product_price - coalesce(product_costs.total_supply_cost, 0)) as unit_profit_margin
    from products
    left join product_costs using (product_sku)
)

select * from final
