%dw 2.0
output application/json
---
{
  "Chassis__c": payload.Chassi,
  "Plate__c": payload.Placa,
  "Model__c": payload."Modelo do Veiculo",
  "ModelBrand__c": payload."Modelo do Veiculo",
  "MolicarCode__c": payload."Cod Molicar",
  "LastKmImformed__c": payload."Km Veiculo",
  "YearModelDealer__c": payload."Ano do Modelo",
  "YearOfManufacture__c": payload."Ano Fabricacao",
  "StatePlate__c": payload."Nome Estado/UF da Placa)",
  "ExternalColorCode__c": payload."Codigo da Cor",
  "ColorName__c": payload.Cor,
  "Renavam__c": payload.Renavam,
  "StockType__c": payload."Tipo do Estoque",
  "StockDescription__c": payload."Descricao do Estoque"
}
