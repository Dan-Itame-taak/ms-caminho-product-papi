%dw 2.0
output application/json
---
{
        attributes: {
            "type": "OptionalItems__c"
        },
        OptionalCode__c: payload.Opcional_Codigo,
        Name: payload.Opcional_Descricao,
        OptionalAcronym__c: payload.Opcional_Sigla,
        OptionalDescription__c: payload.Opcional_Descricao,
        RecordType: {
            Name: "Produto"
        }
    }
