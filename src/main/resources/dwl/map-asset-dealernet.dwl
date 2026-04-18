%dw 2.0
output application/json
---
payload map (value, index) -> {
	"attributes": {
		"type": "Asset"
	},
	"Account": {
        "DealerNetExternalId__c": value.codigoCliente
    },
    "IsActive__c": value.ativo default true,
	"ExternalId__c": value.codigoVeiculo,
	"Name": value.nomeVeiculo,
	"Chassis__c": value.chassi,
	"FullChassisNumber__c": value.chassi,
	"Type__c": "Vehicle",
	"Status": "Faturado", //tratar pra enviar o status real
	"Plate__c": value.placa,
	"Model__c": value.nomeVeiculo,
	"ModelCode__c": value.codigoModeloVeiculo,
	"ModelBrand__c": value.marca,
	"LastKmImformed__c": value.km,
	"YearModel__c": value.anoModelo,
	"YearOfManufacture__c": value.anoFabricacao,
	"ColorName__c": value.corExterna,
	"Renavam__c": value.renavam,
	"NumberOfDoors__c": value.numeroPortas,
	"Combustivel__c": if (value.combustivel contains  ("HIBRIDO")) "Híbrido" 
	else if (value.combustivel contains ("NENH")) null
	else value.combustivel,
	"ProductFamilyDescription__c": value.familiaFamilia
}
