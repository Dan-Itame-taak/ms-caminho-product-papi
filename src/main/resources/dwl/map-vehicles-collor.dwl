%dw 2.0
output application/json
---
{
	"attributes": {
		"type": "VehicleParameter__c"
	},
	ExternalId__c: payload.Cor_Codigo ++ "_Collor",
	Description__c: payload.Cor_Descricao,
	Name: payload.Cor_Descricao,
	IsActive__c: payload.Cor_Ativo,
	RecordTypeId: vars.recordTypeCor
}