%dw 2.0
import * from Modules::productsFunctions
output application/json
---
{
	attributes: {
		"type": "Product2" 
	},
    ExternalId__c: payload.productCode ++ "_" ++ payload.productBrandCode ++ "_" ++ payload.companyCode ++ "_" ++ payload.stockCode,
    ProductCode: payload.productCode,
    Name: payload.productDescription,
    Description: payload.productDescription,
    NCM__c: payload.productNcm,
    ProductUnit__c: payload.productUnit,
    ProductOrigin__c: payload.productOrigin,
    Price__c: payload.publicSellPrice,
    AcquisitionPrice__c: payload.aquisitionPrice,
    PublicSalePrice__c: payload.publicSellPrice,
    SuggestedSalePrice__c: payload.suggestedSellPrice,
    WarrantyPrice__c: payload.warrantyPrice,
    ANPCode__c: payload.anpCode,
    //ProductCEST__c: payload.productCest,
    GrossWeight__c: payload.productGrossWeight,
    isActive: true,
    NetWeight__c: payload.productNetWeight,
    StockCode__c:payload.stockCode,
    RecordTypeId: vars.recordTypePeca,
    Store__r: {
    	ExternalId__c: mapStore(payload.companyName)
    }
}