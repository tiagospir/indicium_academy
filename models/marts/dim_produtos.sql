with
    dim_produtos as (
        select *
        from {{ ref('int_venda__prep_produtos') }}
    )

select *
from dim_produtos