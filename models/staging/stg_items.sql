with source as (

    select * from {{ source('jaffle_shop', 'raw_items') }}

),

renamed as (

    select
        id as item_id,
        order_id as order_id,
        sku as product_sku

    from source

)

select * from renamed