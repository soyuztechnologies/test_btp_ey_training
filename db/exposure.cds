
@cds.persistence.exists 
@cds.persistence.calcview 
entity CV_PO_ANA {
key     NODE_KEY: String(32)  @title: 'NODE_KEY: NODE_KEY' ; 
key     BP_ROLE: String(2)  @title: 'BP_ROLE: BP_ROLE' ; 
key     COMPANY_NAME: String(250)  @title: 'COMPANY_NAME: COMPANY_NAME' ; 
key     BP_ID: String(32)  @title: 'BP_ID: BP_ID' ; 
key     CITY: String(44)  @title: 'CITY: CITY' ; 
key     COUNTRY: String(44)  @title: 'COUNTRY: COUNTRY' ; 
        LATITUDE: Decimal(34)  @title: 'LATITUDE: LATITUDE' ; 
        LONGITUDE: Decimal(34)  @title: 'LONGITUDE: LONGITUDE' ; 
key     PARTNER_GUID_NODE_KEY: String(32)  @title: 'PARTNER_GUID_NODE_KEY: PARTNER_GUID_NODE_KEY' ; 
key     PO_ID: Integer  @title: 'PO_ID: PO_ID' ; 
key     LIFECYCLE_STATUS: String(1)  @title: 'LIFECYCLE_STATUS: LIFECYCLE_STATUS' ; 
key     NOTE: String(256)  @title: 'NOTE: NOTE' ; 
        PO_ITEM_POS: Integer  @title: 'PO_ITEM_POS: PO_ITEM_POS' ; 
        GROSS_AMOUNT: Decimal(15)  @title: 'GROSS_AMOUNT: GROSS_AMOUNT' ; 
        NET_AMOUNT: Decimal(15)  @title: 'NET_AMOUNT: NET_AMOUNT' ; 
        TAX_AMOUNT: Decimal(15)  @title: 'TAX_AMOUNT: TAX_AMOUNT' ; 
key     CURRENCY_CODE: String(3)  @title: 'CURRENCY_CODE: CURRENCY_CODE' ; 
        GROSS: Integer64  @title: 'GROSS: GROSS' ; 
}