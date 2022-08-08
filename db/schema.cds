namespace my.library;
using { cuid, managed, Country, Currency } from '@sap/cds/common';

entity Library: managed {
    key ID      : UUID  @(Core.Computed : true);
    title: String;
    pageNumber: Integer;
    copyQty: Integer;
    shippedQty: Integer;
    price: Decimal(9,2);
    orderBookEnable: Boolean;
    currency: Currency;
    author: Association to Authors; 
    orders: Association to BookOrder;
}

entity BookOrder: managed {
    key ID      : UUID  @(Core.Computed : true);
    orderCount: Integer;
    book: Association to Library;
    quintyti: Integer;
    localCurrency: Currency;
}

entity Authors: managed {
    key ID      : UUID  @(Core.Computed : true);
    firstName: String;
    lastName: String;
    birthday: Date;
    country: Country;
    books: Association to many Library on books.author = $self;
    }

entity Readers: managed {
    key ID      : UUID  @(Core.Computed : true);
    firstName: String;
    lastName: String;
    birthday: Date;
    phone: String;
    image: String;
}