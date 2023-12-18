module.exports = async function (srv) {
  const biscuitService = await cds.connect.to("biscuit");
  const productService = await cds.connect.to("SEPMRA_PROD_MAN");

  srv.on("READ", "Products", async (req) => {
    return productService.run(req.query);
  });

  srv.on("readSAPLogonTicket", async (req) => {
    // const biscuitServiceTransaction = biscuitService.transaction(req)
    // Results in:
    // Error: Field jku containing the URL for JWT verification not part of header.
    // at getVerificationKeyURL (/Users/gwolf/Documents/Projects/azure/cap-azure-ad-b2c/node_modules/@sap-cloud-sdk/core/dist/connectivity/scp-cf/jwt.js:353:15)
    try {
      const response = await biscuitService.get("/sap/bc/zbiscuit?user=GWOLF");
      return response;
    } catch (error) {
      console.error("Error Message: " + error.message);
      console.error("Stack: " + error.stack);
      if (error.request && error.request.path) {
        console.error("Request Path: " + error.request.path);
      }
    }
  });
};
