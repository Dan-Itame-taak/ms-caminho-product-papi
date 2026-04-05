%dw 2.0
var vPayload = (payload) distinctBy $.codigoCliente
output application/json
---
vPayload map (value, index) -> {
  "attributes": {
      "type": "Account"
  },
  "IsActive__c": value.ativo,
  "CPFCNPJ__c": value.cpfCnpj,
  "ActivityCode__c": value.codigoAtividade,
  "Email__c": value.email,
  "ExternalId__c": value.codigoCliente,
  "DealerNetExternalId__c": value.codigoCliente,
  "Name": value.nome,
  "CommercialName__c": value.nomeFantasia,
  "Phone": (value.telefone splitBy  "  ")[0] replace  " " with "",
  "PersonalType__c": if(value.tipoPessoa == "F") "Pessoa Fisica" else "Pessoa Jurídica",
  "BillingCountryCode": "BR",
  "TestDrive__c": null
}