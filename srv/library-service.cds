using my.library as my   from '../db/schema';

service LibraryService {
    entity Library as projection on my.Library 
    entity Authors as projection on my.Authors actions{
        action test2() returns Authors;
    }
    entity BookOrder as projection on my.BookOrder
    entity Readers as projection on my.Readers
}


annotate LibraryService.Library with  @odata.draft.enabled;
annotate LibraryService.Authors with  @odata.draft.enabled;
annotate LibraryService.BookOrder with  @odata.draft.enabled;
annotate LibraryService.Readers with  @odata.draft.enabled;