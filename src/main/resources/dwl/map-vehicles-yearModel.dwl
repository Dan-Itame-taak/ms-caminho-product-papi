%dw 2.0
var vPayload = payload map (value, index) ->{
	"attributes": {
		"type": "VehicleParameter__c"
	},
	ExternalId__c: value.VeiculoAno_Codigo ++ "_Year",
	ManufacturingYear__c: value.VeiculoAno_Fabricacao,
	ModelYear__c: value.VeiculoAno_Modelo,
	Name: value.VeiculoAno_Exibicao,
	Display__c: value.VeiculoAno_Exibicao,
	IsActive__c: value.VeiculoAno_Ativo,
	YearOrderBankType__c: value.VeiculoAno_TipoBancoPedido,
	RecordTypeId: vars.recordTypeYear
	}
output application/json
---
{
	allOrNone: false,
	records: vPayload
}