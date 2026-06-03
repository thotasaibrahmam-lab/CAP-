namespace bms.cap;

using {} from '@sap/cds/common';


//  custom aspects

aspect defaultentry {
    @Common.Label: 'Created At'
    // current timestamp in aspects
    createdAt     : Timestamp default current_timestamp;

    @Common.Label: 'Created By'
    // takes default user which created my sales/purchase order
    createdBy     : String(50) default $user;

    @Common.Label: 'Last Changed At'
    // current timestamp in aspects
    lastChangedAt : Timestamp  @cds.on.update: $now;

    @Common.Label: 'Last Changed By'
    // takes the user who ic trying to run update operations on sales/purchase order
    lastChangedBy : String(50) @cds.on.update: $user;
}


//  enumeration type for object wih multiple values
type status   : String enum {
    Pending;
    approved;
    rejected;
    completed
};


//  ? how do we use integer in enum
type priority : Integer enum {
    low = 1;
    medium = 2;
    high = 3;
};

//  Sales Order Header

@title      : 'Sale Order Header'
@description: 'This entity represents the header information of a sales order.'
entity salesorderheader : defaultentry {

        @Common: {Label: 'Sales Order ID'}
    key salesorderid        : UUID;

        @Common: {Label: 'Sales Odrer Date'}
        salesorderdate      : Date;

        //  i wwould add from either odata api as customer entity  or create an entity  by using types
        @Common: {Label: 'Customer ID'}
        customerid          : String(10);

        @Common: {Label: 'Total Amount'}
        totalamount         : Decimal(15, 2);

        @Common: {Label: 'Sales Order Type'}
        salesordertype      : String(20);

        @Common: {Label: 'Sales Order Status'}
        salesorderstatus    : status default 'Pending';

        @Common: {Label: 'Sales Organization'}
        salesorganization   : String(10);

        @Common: {Label: 'Distribution Channel'}
        distributionchannel : String(10);

        @Common: {Label: 'Division'}
        division            : String(10);
}


//  Sales Order Item
@title: 'Sale Order Item'
entity salesorderitem : defaultentry {
    key salesorderitemid : UUID;
        salesorderid     : UUID;
        productid        : String(10);
        quantity         : Decimal(15, 2);
        unitprice        : Decimal(15, 2);
        totalprice       : Decimal(15, 2);
}

//  materials
@Capabilities.Deletable: false
@title                 : 'Material'
entity material {
    key materialid          : String(10);
        materialcode        : String(20);
        materialdescription : String(255);

        @UI.Hidden: true
        materialgroup       : String(10);
        plant               : String(10);
}

//  purchase order header
@title: 'Purchase Order Header'
entity purchaseorderheader : defaultentry {
    key purchaseorderid     : UUID;
        purchaseorderdate   : Date;

        //  i would add an odata supplier api for search help
        supplierid          : String(10);


        totalamount         : Decimal(15, 2);
        purchaseordertype   : String(20);
        purchaseorderstatus : status default 'Pending';
        purchasinggroup     : String(10);
}

//  purchase order item
@title: 'Purchase Order Item'
entity purchaseorderitem : defaultentry {
    key purchaseorderitemid : UUID;
        purchaseorderid     : UUID;

        // Linked with material enbtity
        materialid          : String(10);

        quantity            : Decimal(15, 2);
        unitprice           : Decimal(15, 2);
        totalprice          : Decimal(15, 2);
}


// Optional
//  error logs/traces logs
@Capabilities: {
    InsertRestrictions: {Insertable: false},
    UpdateRestrictions: {Updatable: false},
    DeleteRestrictions: {Deletable: false}
}
@title       : 'Error Log'
entity errorlog {
    key logid        : UUID;
        errormessage : String(255);
        errorcode    : String(20);
        loggedat     : Timestamp;
}


// auditing logs for tracking changes in sales and purchase orders
@title: 'Audit Log'
entity auditlog {
    key logid          : UUID;
        entityname     : String(50);
        entityid       : String(50);
        operation      : String(10); // e.g., CREATE, UPDATE, DELETE
        changedby      : String(50);
        changedat      : Timestamp;
        changeddetails : String(255);
}