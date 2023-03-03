using { anubhav.db.master, anubhav.db.transaction, anubhav.db.cdsviews, anubhav.db } from '../db/datamodel';
using { CV_PO_ANA } from '../db/exposure';


service CatalogService@(path:'/CatalogService') 
                     @(requires: 'authenticated-user'){


    function sleep() returns Boolean;
    
    @readonly
    entity Cv_Purchase as projection on CV_PO_ANA;

    //@Capabilities.Insertable: false
    entity EmployeeSet@(restrict:[
        {
            grant: ['READ'],
            to: 'Viewer',
            where: 'bankName = $user.BankName'
        },
        {
            grant: ['WRITE'],
            to: 'Admin'
        }
    ]) as projection on master.employees;

    entity AddressSet as projection on master.address;

    entity ProductSet as projection on master.product;

    entity BPSet as projection on master.businesspartner;

    entity POs @( title: '{i18n>poHeader}') 
        as projection on transaction.purchaseorder{
        *,
        Items: redirected to POItems,
        case LIFECYCLE_STATUS
            when 'N' then 'New'
            when 'B' then 'Blocked'
            when 'D' then 'Delivered'
            end as LIFECYCLE_STATUS: String(30),
        case LIFECYCLE_STATUS
            when 'N' then 2
            when 'B' then 1
            when 'D' then 3
            end as MyCriticality: Integer
    }actions{
        function largestOrder() returns array of POs;
        action boost();
    };

    annotate POs with @odata.draft.enabled;

    entity POItems @( title : '{i18n>poItems}' )
    as projection on transaction.poitems{
        *,
        PARENT_KEY: redirected to POs,
        PRODUCT_GUID: redirected to ProductSet
    }

    entity POWorklist as projection on cdsviews.POWorklist;
    entity ProductOrders as projection on cdsviews.ProductViewSub;
    entity ProductAggregation as projection on cdsviews.CProductValuesView excluding{
        ProductId
    };

}