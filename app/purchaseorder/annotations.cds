using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI: {
        SelectionFields  : [
            PO_ID,
            GROSS_AMOUNT,
            LIFECYCLE_STATUS,
            PARTNER_GUID.COMPANY_NAME,
            Currency.code
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order',
            TypeNamePlural : 'Purchase Orders',
        },
    }

);
