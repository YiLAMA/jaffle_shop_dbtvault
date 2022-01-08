{{
    config(
        enabled=True,
        materialized = 'view'
    )
}}

select
    customer_pk,
    first_name,
    last_name,
    email,
    sat_effective_from,
    relevant_date
from {{ref('pit_customers')}} as pit
WHERE customer_pk IN ('ec8956637a99787bd197eacd77acce5e')
