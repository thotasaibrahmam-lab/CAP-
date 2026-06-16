namespace com.procurement;

using { cuid, managed } from '@sap/cds/common';

// ─────────────────────────────────────────────
// Purchase Order Header
// ─────────────────────────────────────────────
entity PurchaseOrderHeader : cuid, managed {
    poNumber      : String(20)        @title: 'PO Number';
    vendorName    : String(100)       @title: 'Vendor Name';
    orderDate     : Date              @title: 'Order Date';
    totalAmount   : Decimal(15, 2)    @title: 'Total Amount';

    // Navigation to Items
    items         : Composition of many PurchaseOrderItem
                        on items.header = $self;
}

// ─────────────────────────────────────────────
// Purchase Order Item
// ─────────────────────────────────────────────
entity PurchaseOrderItem : cuid {
    header        : Association to PurchaseOrderHeader  @title: 'Purchase Order Header';
    materialName  : String(100)                         @title: 'Material Name';
    quantity      : Integer                             @title: 'Quantity';
    unitPrice     : Decimal(15, 2)                      @title: 'Unit Price';
    lineAmount    : Decimal(15, 2)                      @title: 'Line Amount';
}
