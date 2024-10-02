{{
    config(
        materialized = 'incremental'
    )
}}

select
    customer_id::integer customer_id,
    first_name::varchar first_name,
    last_name::varchar last_name,
    date_joined::timestamp date_joined,
    loaded_at::timestamp loaded_at


from {{ ref("raw_customers") }}

{% if is_incremental() %}
where loaded_at::timestamp >= (select max(loaded_at) from {{ this }} )
{% endif %}