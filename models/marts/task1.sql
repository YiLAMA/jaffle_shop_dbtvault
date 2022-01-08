{{
    config(
        enabled=True,
        materialized = 'view'
    )
}}

select
    extract(week from order_date) as number_week,
    status,
    count(*) as count_orders
from {{ref('sat_order_details')}}
group by 1, 2
order by 1, 2
