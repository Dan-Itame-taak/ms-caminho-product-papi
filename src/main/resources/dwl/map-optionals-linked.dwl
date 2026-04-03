%dw 2.0
output application/json
---
{
        attributes: {
            "type": "OptionalItems__c"
        },
        ModelCode__c: payload."ModeloVeiculo_Codigo",
        OptionalCode__c: (payload.Opcional_Codigo as String) ++ (payload."ModeloVeiculo_Codigo" as String),
        OptionalItems__r:{
            OptionalCode__c: payload.Opcional_Codigo
        },
        RecordType: {
            Name: "Relacionamento"
        }
    }