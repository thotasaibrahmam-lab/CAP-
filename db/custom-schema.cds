namespace bms.cap;
 
using { managed } from '@sap/cds/common';
aspect defaultentry {
createdAt : Timestamp;
createdBy : String(255);
lastChangedAt : Timestamp;
lastChangedBy : String(255);
}
 
entity salesorderheader{
    key salesorderid : UUID;
    salesorderdate : Date;
    customerid : String(10);
    totalamount : Decimal(15,2);
    salesordertype : String(20);
    salesorderstatus : String(20);
    salesorganization : String(10);
    distributionchannel : String(10);
    division : String(10);
}
    entity salesorderitem {
        key salesorderitemid : UUID;
        salesorderid : UUID;
        productid : String(10);
        quantity : Decimal(15,2);
        unitprice : Decimal(15,2);
        totalprice : Decimal(15,2);
    }
 
 
 