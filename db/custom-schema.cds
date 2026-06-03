namespace bms.cap;

using {managed} from '@sap/cds/common';

// Custom Aspect for default entry fields
aspect defaultentry {
    createdAt     : Timestamp;
    createdBy     : String(255);
    lastChangedAt : Timestamp;
    lastChangedBy : String(255);
}

// enumeration type for object with multiple values

type status   : String enum {
    Pending;
    Approved;
    Rejected;
    Completed;
    Closed;
};

// enumeration how to use Integer
type priority : Integer enum {
    Low = 1;
    Medium = 2;
    High = 3;
};

//SalesOrder Header
entity salesorderheader {
    key salesorderid        : UUID;
        salesorderdate      : Date;
        // I would add from either odata api as customer entity or create an entity by using types
        customerid          : String(10);
        totalamount         : Decimal(15, 2);
        salesordertype      : String(20);
        salesorderstatus    : String(20);
        salesorganization   : String(10);
        distributionchannel : String(10);
        division            : String(10);
}

// SalesOrder Item
entity salesorderitem : defaultentry {
    key salesorderitemid : UUID;
        salesorderid     : UUID;
        productid        : String(10);
        quantity         : Decimal(15, 2);
        unitprice        : Decimal(15, 2);
        totalprice       : Decimal(15, 2);
}

// Materials

entity material : defaultentry {
    key materialid          : String(10);
        materialcode        : String(20);
        materialdescription : String(255);
        materialgroup       : String(10);
        plant               : String(10);
}

entity purchaseorder : defaultentry {
    key purchaseorderid     : UUID;
        purchaseorderdate   : Date;
        supplierid          : String(10);
        totalamount         : Decimal(15, 2);
        purchaseorderstatus : String(20);
}

entity purchaseorderitem : defaultentry {
    key purchaseorderitemid : UUID;
        purchaseorderid     : UUID;
        materialid          : String(10);
        quantity            : Decimal(15, 2);
        unitprice           : Decimal(15, 2);
        totalprice          : Decimal(15, 2);
}

//optional
//error logs/trace logs

//audit logs for tracking changes in sales purchase orders
entity auditlog  { 
 key logid : UUID;
     entityname : String(50);
     entityid   : String(50);
     operation : String(10); // CREATE UPDATE DELETE
     changedby : String(50);
     changedat : Timestamp;
     changeddetails : String(255);
}