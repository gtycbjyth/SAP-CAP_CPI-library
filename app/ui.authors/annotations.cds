using LibraryService as service from '../../srv/library-service';

annotate service.Authors with @(
    UI.HeaderInfo : {
        TypeName       : 'Authors',
        TypeNamePlural : 'Authors'
    },
    UI.LineItem   : [
        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Birthday',
            Value : birthday,
        },
        {
            $Type : 'UI.DataField',
            Label: 'Country',
            Value : country.name,
        },
    ]
);

annotate service.Authors with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'First Name',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Name',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Birthday',
                Value : birthday,
            },
            {
                $Type : 'UI.DataField',
                Label: 'Country',
                Value : country_code,
            },
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'Author Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
