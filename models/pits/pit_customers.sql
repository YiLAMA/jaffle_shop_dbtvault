{{
    config(
        enabled=True,
        materialized = 'table'
    )
}}

select
    hub.customer_key::integer,
    hub.customer_pk,
    sat.first_name,
    sat.last_name,
    sat.email,
    sat.effective_from as sat_effective_from,
    {{var('relevant_date')}} as relevant_date
from {{ref('hub_customer')}} as hub
join {{ref('sat_customer_details')}} as sat
on hub.customer_pk = sat.customer_pk
where sat.effective_from < {{var('relevant_date')}}::timestamp
order by 1, sat_effective_from
