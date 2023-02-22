namespace mycap.db;

entity orders
{
    key orderid : Integer;
    customername : String(120);
    contactperson : String(180);
    grossamount : Decimal(10,2);
    currency : String(4);
}
