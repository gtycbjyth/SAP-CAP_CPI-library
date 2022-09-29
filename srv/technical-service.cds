using my.library as my   from '../db/schema';

service TechnicalService @( requires: 'system-user' )  {
    entity Library as projection on my.Library 
    entity Authors as projection on my.Authors
    entity BookOrder as projection on my.BookOrder
    entity Readers as projection on my.Readers
}