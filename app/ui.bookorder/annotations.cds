using LibraryService as service from '../../srv/library-service';
using from '@sap/cds/common';

annotate service.BookOrder with @(
    UI.LineItem : [
           {
                $Type : 'UI.DataField',
                Label : 'Order №',
                Value : orderCount,
            },
           {
                $Type : 'UI.DataField',
                Label : 'Order status',
                Value : status,
            },
        {
            $Type : 'UI.DataField',
            Value : orderQti,
            Label : 'Order Quantity',
        },
           {
                $Type : 'UI.DataField',
                Label : 'Book title',
                Value : book.title,
            },
        {
                $Type : 'UI.DataField',
                Label : 'Author First Name',
                Value : book.author.firstName,
            },
            {
            $Type : 'UI.DataFieldForAction',
            Action : 'LibraryService.orderBook',
            Label : 'Order book',
        },
        {
            $Type : 'UI.DataField',
            Value : book.author.lastName,
            Label : 'Author Last Name',
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'Total Price',
        },
    ],

    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : orderCount,
                Label : 'Order №',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Ordeer Status',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Quantity',
                Value : orderQti,
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                Label : 'Total Price',
            },
            {
                $Type : 'UI.DataField',
                Value : totalLocal,
                Label : 'Total Local Price',
            },
        ],
    },    
//TODO: add normal annatation
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Order Option',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Book Info',
            ID : 'indsec',
            Target : '@UI.Identification',
        },
    ],
);

annotate LibraryService.Library with {
    ID @(
        UI.Hidden,
        Common : {
            Label : 'Title',
            Text  : title
        }
    );
}


annotate service.BookOrder with {
    book @(Common : {
        Text : {
                $value : book.title,
                ![@UI.TextArrangement] : #TextOnly,
            },
        ValueList :{
            Label: 'Books',
            CollectionPath: 'Library',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : book_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                    
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'author_ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'pageNumber'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'price'
                }
                
            ]
        }
    }

    )
};

annotate service.BookOrder with @(
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : book_ID,
            Label : 'Book',
        },
        {
            $Type : 'UI.DataField',
            Value : book.copyQty,
            Label : 'Сopies in the library',
        },]
);
annotate service.BookOrder with @(
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    },
    UI.LineItem #tableView : [
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 1',
    }
);
annotate service.Library with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : title,
    }
);
annotate service.Library with {
    orders @Common.FieldControl : #ReadOnly
};
annotate service.BookOrder with {
    orderCount @Common.FieldControl : #ReadOnly
};
annotate service.Library with {
    copyQty @Common.FieldControl : #ReadOnly
};
annotate service.BookOrder with @(
    UI.HeaderInfo : {
        TypeName : 'Book Order',
        TypeNamePlural : 'Book order',
    }
);
annotate service.BookOrder with {
    orderQti @Common.FieldControl : #ReadOnly
};
annotate service.Currencies with {
    code @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currencies',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.BookOrder with {
    totalPrice @Common.FieldControl : #ReadOnly
};
annotate service.BookOrder with {
    status @Common.FieldControl : #ReadOnly
};
annotate service.BookOrder with {
    totalLocal @Common.FieldControl : #ReadOnly
};
annotate service.BookOrder with {
    totalPrice @Common.Text :  book.currency_code
};
annotate service.BookOrder with {
    totalLocal @Common.Text : LocalCurrencyCode
};
annotate service.Library with @(
    UI.DataPoint #price : {
        Value : price,
        Visualization : #Rating,
        TargetValue : 5,
    }
);
