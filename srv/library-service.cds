using my.library as my   from '../db/schema';

service LibraryService {
    entity Library as projection on my.Library 
    entity Authors as projection on my.Authors
    entity BookOrder as projection on my.BookOrder actions{
        action orderBook(orderProp: Integer @title : 'New Title');
    }
    entity Readers as projection on my.Readers
}


annotate LibraryService.Library with  @odata.draft.enabled;
annotate LibraryService.Authors with  @odata.draft.enabled;
annotate LibraryService.BookOrder with  @odata.draft.enabled;
annotate LibraryService.Readers with  @odata.draft.enabled;