%dw 2.0
import * from Modules::productsFunctions
output application/json
---
{
    attributes: {
        "type": "Product2"
    },
    ExternalId__c: if(!isBlank(payload.codigoModeloVeiculo)) payload.codigoTMO ++ "_" ++ payload.codigoEmpresa ++ "_" ++ payload.codigoModeloVeiculo
    else payload.codigoTMO ++ "_" ++ payload.codigoEmpresa,
    Store__r: {
    	ExternalId__c: mapStore(payload.codigoEmpresa)
    },
    Name: payload.nomeTMO,
    ProductType__c: payload.tipoTMO,
    TmoReference__c: payload.referencia,
    DepartmentCode__c: payload.codigoSetorServico,
    PaymentType__c: payload.tipoPrecificacao,
    TmoDependency__c: payload.dependencia,
    TmoCharges__c:  payload.cobrar,
    TmoThirdPartyService__c: payload.servicoTerceiros,
    TmoRequiresEngineNumber__c: payload.exigeNumeroMotor,
    TmoRequiresTransmissionNumber__c: payload.exigeNumeroCambio,
    TmoRequiresPurchaseRequest__c: payload.exigeRequisicaoCompra,
    TmoRequiresFuelCheck__c: payload.exigeVerificarCombustivel,
    TmoQuickService__c: payload.servicoRapido,
    IsActive: payload.ativo,
    ServiceType__c: payload.codigoTipoServico,
    TmoFiscalClassificationCode__c: payload.codigoClassificacaoFiscal,
    TmoExecutes__c: payload.executa,
    Price__c: payload.valorFixoTMO,
    TmoRevision__c: payload.revisao,
    TmoOwnProduction__c: payload.producaoPropria default false,
    TmoTempoDealership__c: payload.tempoConcessionaria,
    TmoTempoAutomaker__c: payload.tempoMontadora,
    TmoRequiresTest__c: payload.exigeTesteVeiculo,
    RecordTypeId: vars.recordTypeTMO,
    (TMO__r: {
        ExternalId__c: payload.codigoPai
    }) if !isBlank(payload.codigoPai)
}