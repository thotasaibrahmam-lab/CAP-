using PurchaseOrderService as service from '../../srv/schema';
annotate service.PurchaseOrderHeaders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : poNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : vendorName,
            },
            {
                $Type : 'UI.DataField',
                Value : orderDate,
            },
            {
                $Type : 'UI.DataField',
                Value : totalAmount,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Items}',
            ID : 'i18nItems',
            Target : 'items/@UI.LineItem#i18nItems',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : poNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : vendorName,
        },
        {
            $Type : 'UI.DataField',
            Value : orderDate,
        },
        {
            $Type : 'UI.DataField',
            Value : totalAmount,
        },
    ],
);

annotate service.PurchaseOrderItems with @(
    UI.LineItem #i18nItems : [
    ]
);

