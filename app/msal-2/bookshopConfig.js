// Add here the endpoints for MS Graph API services you would like to use.
const bookshopConfig = {
  booksEndpoint: { path: "/odata/v4/catalog/Books", method: "GET" },
  getBTPJWTEndpoint: {
    path: "/odata/v4/catalog/getBTPJWT",
    method: "POST",
    body: "{}",
  },
  readProductsFromSAPGraphEndpoint: {
    path: "/odata/v4/catalog/readProductsFromSAPGraph",
    method: "POST",
    body: "{}",
  },
};
