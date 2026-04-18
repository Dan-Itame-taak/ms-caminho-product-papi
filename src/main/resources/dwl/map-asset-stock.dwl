%dw 2.0
import * from Modules::productsFunctions
output application/json
---
{
        attributes: {
            "type": "Asset"
        },
        "Account": {
        "DealerNetExternalId__c": payload."Cod Empresa"
    	},
        "ExternalId__c": payload."Cod do Veiculo",
        "Name": payload."Modelo do Veiculo",
        "Chassis__c": payload.Chassi,
        "FullChassisNumber__c": payload."Chassi Completo",
        "Plate__c": payload.Placa,
        "IsBrandNewVehicle__c": if(payload."Tipo do Estoque" == "VN") true else false,
        "YearModel__c": payload."Ano do Modelo",
        "YearOfManufacture__c": payload."Ano Fabricacao",
        "LastKmImformed__c": payload."Km Veiculo",
        //"StockDays__c": payload.,
        "Type__c": "Vehicle",
        "Status": "Disponivel",
        "Price": payload."ValorVenda",
        "AcquisitionValue__c": payload."Valor Compra",
        "ModelCode__c": payload."Cod Modelo do Veiculo",
        "Model__c": payload."Modelo do Veiculo",
        "ProductFamilyCode__c": payload."Cod Familia do Veiculo",
        "ProductFamilyDescription__c": payload."Familia do Veiculo",
        "CombustivelCode__c": payload."Cod Combustivel",
        "Combustivel__c": if (value.combustivel contains  ("HIBRIDO")) "Híbrido" 
	else if (value.combustivel contains ("NENH")) null
	else value.combustivel,
        "EngineSpecification__c": payload."Motorizacao Veiculo",
        "CarTransmission__c": payload."Cod Transmissao",
        "ExternalColorCode__c": payload."Codigo da Cor",
        "ColorName__c": payload.Cor,
        "StockCode__c": payload."Cod Estoque",
        "StockDescription__c": payload."Nome do Estoque",
        "StockType__c": payload."Tipo do Estoque",
        "StatePlate__c": payload."Nome Estado/UF da Placa)",
        "MolicarCode__c": payload."Cod Molicar",
        "IsActive__c":  true,
        "NumberOfDoors__c": payload.numeroPortas,
        "Store__r":
        {
        	"ExternalId__c": mapStore(payload."Nome da Empresa")
        }
    }
