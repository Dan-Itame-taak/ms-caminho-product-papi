%dw 2.0
import * from Modules::productsFunctions
output application/json
---
{
	attributes: {
		"type": "HourlyRate__c"
	},
    ExternalId__c: payload.codigoMoeda ++ "_" ++ payload.codigoEmpresa ++ "_" ++ payload.codigoTipoOS,
    Store__r: {
        ExternalId__c: mapStore(payload.nomeEmpresa)
    },
    WorkOrderType__r: {
        ExternalId__c: payload.codigoTipoOS
    },
    HourlyRate__c: payload.valorHora
}