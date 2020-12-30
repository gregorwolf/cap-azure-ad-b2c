using my.bookshop as my from '../db/data-model';

service AdminCatalogService @(requires : 'authenticated-user') {
    entity Books @(restrict : [{
        grant : ['READ','CREATE','UPDATE','DELETE'],
        to    : 'admin'
    }]) as projection on my.Books;
}
