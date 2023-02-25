using { anubhav.db.master, anubhav.db.transaction, anubhav.db.cdsviews, anubhav.db } from '../db/datamodel';


service CatalogService@(path:'/CatalogService') {

    @readonly
    entity CV_PO_ANA as projection on db.CV_PO_ANA;

    entity EmployeeSet as projection on master.employees;

    entity AddressSet as projection on master.address;

    entity ProductSet as projection on master.product;

    entity BPSet as projection on master.businesspartner;

    entity POs @(
        title: '{i18n>poHeader}'
    ) as projection on transaction.purchaseorder{
        *,
        Items: redirected to POItems
    }

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