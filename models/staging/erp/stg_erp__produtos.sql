with
    fonte_produtos as (
        select *
        from {{ source('erp', 'PRODUCTS') }}
    )

    , renomeado as (
        select
            cast(ID as int) as pk_produto
            , cast(SUPPLIERID as int) as fk_fornecedor
            , cast(CATEGORYID as int) as fk_categoria
            , cast(PRODUCTNAME as string) as nome_produto
            , cast(QUANTITYPERUNIT as string) as quantidade_por_unidade
            , cast(UNITPRICE as numeric(18,2)) as preco_por_unidade
            , cast(UNITSINSTOCK as int) as unidades_em_estoque
            , cast(UNITSONORDER as int) as unidades_por_pedido
            , cast(REORDERLEVEL as int) as nivel_de_pedido
            , DISCONTINUED as eh_descontinuado
        from fonte_produtos
    )

select *
from renomeado