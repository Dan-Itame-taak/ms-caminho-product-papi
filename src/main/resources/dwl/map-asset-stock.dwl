%dw 2.0
import * from Modules::productsFunctions
output application/json
---
{
        attributes: {
            "type": "Asset"
        },
        "Account": {
        	"ExternalId__c": payload."codigoCliente" default payload.codConcessionaria
    	},
        "ExternalId__c": payload."Cod do Veiculo",
        "Dealership__r":{
        	"ExternalId__c":payload.codConcessionaria default payload."codigoCliente"
        } ,
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
        "Status": mapStock(payload."Tipo do Estoque"),
        "Price": if(!isBlank(payload.valorVendaUsado)) payload.valorVendaUsado 
        else if (!isBlank(payload."valorVendaMVAP")) payload."valorVendaMVAP"
        else if (!isBlank(payload."ValorVendaMVP")) payload."ValorVendaMVP"
        else if (!isBlank(payload."valorPromocao")) payload."valorPromocao"
        else 0,
        "AcquisitionValue__c": payload."Valor Compra",
        "ModelCode__c": payload."Cod Modelo do Veiculo",
        "Model__c": payload."Modelo do Veiculo",
        "ProductFamilyCode__c": payload."Cod Familia do Veiculo",
        "ProductFamilyDescription__c": payload."Familia do Veiculo",
        "CombustivelCode__c": payload."Cod Combustivel",
        "EngineSpecification__c": payload."Motorizacao Veiculo",
        "CarTransmission__c": payload."Cod Transmissao",
        "ExternalColorCode__c": payload."codigoCorExterna",
        "ColorName__c": payload.nomeCorExterna,
        "InternalColorName__c": payload.nomeCorInterna,
        "InternalColorCode__c": payload.codigoCorInterna,
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
