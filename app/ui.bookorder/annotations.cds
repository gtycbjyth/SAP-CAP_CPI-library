using LibraryService as service from '../../srv/library-service';

annotate service.BookOrder with @(
    UI.LineItem : [
           {
                $Type : 'UI.DataField',
                Label : 'Order №',
                Value : orderCount,
            },
           {
                $Type : 'UI.DataField',
                Label : 'Quintyti',
                Value : quintyti,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Local Currency',
                Value : localCurrency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'book_IDy',
                Value : book_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Local title',
                Value : book.title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pageNumber',
                Value : book.pageNumber,
            },
    ],

    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Quintyti',
                Value : quintyti,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Local Currency',
                Value : localCurrency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'book_IDy',
                Value : book_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Local title',
                Value : book.title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pageNumber',
                Value : book.pageNumber,
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
        // {
        //     $Type: 'UI.ReferenceFacet',
        //     ID : 'GeneratedFacet2',
        //     Label : 'Author',
        //     Target : '@UI.FieldGroup#GeneratedGroup2',
        // }
    ],
    // UI.FieldGroup #GeneratedGroup2: {
    //     $Type: UI.FieldGroupType,
    //     Data : [
    //         {
    //             $Type: UI
    //         }
    //     ],
    // }
);

annotate service.BookOrder with {
    book @(Common : {
        Text : book.title,
        ValueList :{
            Label: 'Library',
            CollectionPath: 'Library',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : book_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'author_ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'price'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'currency_code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'pageNumber'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'shippedQty'
                },
            ]
        }
    }

    )
};

