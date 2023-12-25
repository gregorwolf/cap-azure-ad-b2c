using my.bookshop as my from '../db/data-model';
using {SEPMRA_PROD_MAN as external} from './external/SEPMRA_PROD_MAN';

service CatalogService @(requires: 'authenticated-user') {
    @readonly
    entity Books    as projection on my.Books;

    @readonly
    entity Products as projection on external.SEPMRA_C_PD_Product;

    action getBTPJWT()          returns String;
    action readSAPLogonTicket() returns String;
}
