using LibraryService as service from '../../srv/library-service';

annotate service.Library with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pageNumber',
            Value : pageNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'copyQty',
            Value : copyQty,
        },
        {
            $Type : 'UI.DataField',
            Label : 'shippedQty',
            Value : shippedQty,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
    ]
);
annotate service.Library with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pageNumber',
                Value : pageNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'copyQty',
                Value : copyQty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'shippedQty',
                Value : shippedQty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'orderBookEnable',
                Value : orderBookEnable,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
