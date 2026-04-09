%dw 2.0
output application/json
---
{
    Veiculo_Codigo: payload.Id,
    Veiculo_Descricao: payload.Name ,
    Veiculo_Chassi: payload.Chassis__c ,
    VeiculoAno_Codigo: payload.YearModelCode__c ,
    Veiculo_ModeloVeiculoCod: payload.ModelCode__c ,
    Veiculo_CorCodInterna: payload.InternalColorCode__c ,
    Veiculo_CorCodExterna: payload.ExternalColorCode__c ,
    Veiculo_PessoaCodCliente: payload.Account.ExternalId__c ,
    Veiculo_PessoaCodConcessionaria: payload.Store__r.DealerNetExternalId__c ,
    Veiculo_Placa: payload.Store__r.Plate__c ,
    Veiculo_Km: payload.LastKmImformed__c ,
    Veiculo_NroRenavam: payload.Renavam__c ,
    Veiculo_UsoSevero: 0 ,
    Veiculo_DataVendaOriginal: payload.DeliveryDate__c ,
    Veiculo_UsuCodCriacao: payload.Createdby.DealerNetCode__c ,
    Veiculo_DataCriacao: payload.CreatedDate ,
    Veiculo_CombustivelIdoneo: 1
}