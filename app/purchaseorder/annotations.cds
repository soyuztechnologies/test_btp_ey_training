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
                $Type : 'UI.DataFieldForAction',
                Label : 'Boost',
                Action: 'CatalogService.boost',
                Inline: true
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },{
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
                Criticality : MyCriticality,
                CriticalityRepresentation : #WithIcon,
            },

        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order',
            TypeNamePlural : 'Purchase Orders',
            Title: {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            Description:{
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
            ImageUrl : 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Ernst_%26_Young_logo.svg/1200px-Ernst_%26_Young_logo.svg.png',
        },
    }

);
