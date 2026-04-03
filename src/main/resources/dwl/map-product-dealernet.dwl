%dw 2.0
// Mapeamento Grupo Caminho (DealerNet produto) -> Salesforce Product2 (patch/upsert).
// Payload de entrada: array de itens. Campos podem vir achatados ou aninhados (PM, P, TP, GP).
// Chave de upsert: ExternalId__c = P.Produto_Codigo
var mapped = (payload as Array) map (item) -> do {
    var produtoCodigo = item.P.Produto_Codigo default item.Produto_Codigo default ""
    var produtoAtivo = (item.P.Produto_Ativo default item.Produto_Ativo default "0") == "1"
    var produtoEstocavel = (item.P.Produto_Estocavel default item.Produto_Estocavel default "0") == "1"
    var produtoQtdeFracionada = (item.P.Produto_QtdeFracionada default item.Produto_QtdeFracionada default "0") == "1"
    var produtoDescricaoDetalhada = item.P.Produto_DescricaoDetalhada default item.Produto_DescricaoDetalhada default null
    ---
    {
        attributes: {
            "type": "Product2"
        },
        ProductCode: item.PM.ProdutoMarca_Referencia default item.ProdutoMarca_Referencia default null,
        ExternalId__c: produtoCodigo,
        Name: item.P.Produto_Descricao default item.Produto_Descricao default null,
        Description__c: produtoDescricaoDetalhada,
        Description: produtoDescricaoDetalhada,
        IsActive: produtoAtivo,
        Stock__c: produtoEstocavel,
        QuantityUnitOfMeasure: item.P.Produto_UnidadeCod default item.Produto_UnidadeCod default null,
        NCM__c: item.P.Produto_NCMCod default item.Produto_NCMCod default null,
        DisplayUrl: item.P.Produto_Imagem default item.Produto_Imagem default null,
        ANPCode__c: item.P.Produto_CodigoANP default item.Produto_CodigoANP default null,
        TypeScrap__c: item.P.Produto_TipoSucata default item.Produto_TipoSucata default null,
        ProductType__c: item.TP.TipoProduto_Descricao default item.TipoProduto_Descricao default null,
        CEST__c: item.P.Produto_Cest default item.Produto_Cest default null,
        Weight__c: item.P.Produto_Peso default item.Produto_Peso default null,
        Brand__c: item.GP.GrupoProduto_Descricao default item.GrupoProduto_Descricao default null,
        RoundingMethod__c: item.P.Produto_PermiteArredondarTruncar default item.Produto_PermiteArredondarTruncar default null,
        Provenance__c: item.P.Produto_ProcedenciaCod default item.Produto_ProcedenciaCod default null,
        QuantitySplit__c: produtoQtdeFracionada
    }
}
output application/json
---
{
    allOrNone: false,
    records: mapped
}
