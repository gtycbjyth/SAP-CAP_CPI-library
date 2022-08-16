namespace my.library;
using { cuid, managed, Country, Currency } from '@sap/cds/common';

entity Library: managed {
    key ID      : UUID  @(Core.Computed : true);
    title: String;
    pageNumber: Integer @assert.range: [ 0, 99999999999 ];
    copyQty: Integer default 0 @assert.range: [ 0, 99999999999 ];
    shippedQty: Integer;
    price: Decimal(9,2) @assert.range: [ 0, 99999999999 ];
    orderBookEnable: Boolean;
    currency: Currency;
    author: Association to Authors; 
    orders: Association to BookOrder;
}

entity BookOrder @(Capabilities:{
  InsertRestrictions.Insertable: true,
  UpdateRestrictions.Updatable: true,
  DeleteRestrictions.Deletable: false
}): managed {
    key ID      : UUID  @(Core.Computed : true);
    orderCount: Integer;
    book: Association to Library;
    orderQti: Integer default 0 @assert.range: [ 0, 99999999999 ];
    localCurrency: Currency;
    status: Status;
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

 type Status: String enum {
    Open;
    Requested;
    Rejected;
    Closed;
}