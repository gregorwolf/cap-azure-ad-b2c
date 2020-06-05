using my.bookshop as my from '../db/data-model';

service PublicCatalogService {
    @readonly
    entity Books as projection on my.Books;
}

service CatalogService @(requires : 'authenticated-user') {
    @readonly
    entity Books as projection on my.Books;
}

service AdminCatalogService @(requires : 'authenticated-user') {
    entity Books @(restrict : [{
        grant : ['READ'],
        to    : 'admin'
    }]) as projection on my.Books;
}
