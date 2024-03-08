{{ config(tags = ['location']) }}

with nation as (
    
    select * from {{ ref('stg_tpch_nations') }}

),
region as (
    
    select * from {{ ref('stg_tpch_regions') }}

),

final as (
    
    select
        nation.nation_key,
        nation.name as nation_name,
        nation.region_key,
        region.name as region_name
    from
        nation
    inner join region
            on nation.region_key = region.region_key
)
select
    *
from
    final
order by
    nation_key
