with
    categorias as (
        select *
        from {{ ref('stg_erp__categorias') }}
    )

    , fornecedores as (
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )

    , produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

    , enriquecer_produtos as (
        select
            produtos.PK_PRODUTO
            , produtos.NOME_PRODUTO
            , produtos.QUANTIDADE_POR_UNIDADE
            , produtos.PRECO_POR_UNIDADE
            , produtos.UNIDADES_EM_ESTOQUE
            , produtos.UNIDADES_POR_PEDIDO
            , produtos.NIVEL_DE_PEDIDO
            , produtos.EH_DESCONTINUADO
            , categorias.NOME_CATEGORIA
            , fornecedores.NOME_FORNECEDOR
            , fornecedores.CIDADE_FORNECEDOR
            , fornecedores.PAIS_FORNECEDOR
        from produtos
        left join categorias on produtos.fk_categoria = categorias.pk_categoria
        left join fornecedores on produtos.fk_fornecedor = fornecedores.pk_fornecedor
    )

select *
from enriquecer_produtos