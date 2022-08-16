using LibraryService as service from '../../srv/library-service';

annotate service.Library with @(UI : {
    HeaderInfo : { // добавляет в шапку таблици title и какимто оброзом count (books)
        TypeName       : 'Books',
        TypeNamePlural : 'Books',
    },
    LineItem   : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author First Name',
            Value : author.firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author Last Name',
            Value : author.lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Page Number',
            Value : pageNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Сopies',
            Value : copyQty,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        }
    ]
}) { //add еденицу измерения к полю price
    @Measures.ISOCurrency : currency_code
    price;

};

annotate service.Library with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',

        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'Book title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Page Number',
                Value : pageNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Author',
                Value : author_ID,
            },
           
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'Book Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);

annotate LibraryService.Authors with {
    ID @(
        UI.Hidden,
        Common : {
            Label : 'Last Name',
            Text  : lastName
        }
    );
}

annotate service.Library with {
    author @(Common : { //show text, not id for author in the context of library
        Text            : author.lastName,
        TextArrangement : #TextOnly,
        ValueList       : {
            Label          : 'Authors',
            CollectionPath : 'Authors',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : author_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'lastName'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'country_code'
                }
            ]
        }
    });
}
