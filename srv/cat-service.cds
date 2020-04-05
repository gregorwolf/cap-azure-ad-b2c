using my.bookshop as my from '../db/data-model';


service CatalogService @(requires: 'authenticated-user'){
    @readonly entity Books as projection on my.Books;
}
