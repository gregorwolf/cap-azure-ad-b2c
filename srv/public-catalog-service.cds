using my.bookshop as my from '../db/data-model';

service PublicCatalogService {
    @readonly
    entity Books as projection on my.Books;
}
