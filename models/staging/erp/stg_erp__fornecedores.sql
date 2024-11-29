with
    fonte_fornecedores as (
        select *
        from {{ source('erp', 'SUPPLIERS') }}
    )

    , renomeado as (
        select
            cast(ID as int) as pk_fornecedor
           , cast(COMPANYNAME as varchar) as nome_fornecedor
           , cast(CITY as varchar) as cidade_fornecedor
           , cast(COUNTRY as varchar) as pais_fornecedor
        from fonte_fornecedores
    )

select *
from renomeado