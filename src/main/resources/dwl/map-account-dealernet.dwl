%dw 2.0
output application/json
---
{
  "attributes": {
      "type": "Account"
  },
  "IsActive__c": payload.ativo default true,
  "CPFCNPJ__c": payload.cpfCnpj,
  "ActivityCode__c": payload.codigoAtividade,
  "Email__c": payload.email,
  "ExternalId__c": payload.codigoCliente,
  "DealerNetExternalId__c": payload.codigoCliente,
  "Name": payload.nome,
  "CommercialName__c": payload.nomeFantasia,
  "Phone": (payload.telefone splitBy  "  ")[0] replace  " " with "",
  "PersonalType__c": if(payload.tipoPessoa == "F") "Pessoa Fisica" else "Pessoa Jurídica",
  "BillingCountryCode": "BR",
  "TestDrive__c": null
}