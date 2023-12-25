const cds = require("@sap/cds");
const LOG = cds.log("catalog-service");
const { AuthClient } = require("./AuthClient");

function getAuthToken(req) {
  const authHeader = req._.req.headers["authorization"];
  const token = authHeader.substring(7);
  return token;
}

module.exports = async function (srv) {
  const biscuitService = await cds.connect.to("biscuit");
  const productService = await cds.connect.to("SEPMRA_PROD_MAN");

  srv.on("READ", "Products", async (req) => {
    const token = getAuthToken(req);
    LOG.debug("Token: " + token);
    return productService.run(req.query);
  });

  srv.on("getBTPJWT", async (req) => {
    const token = getAuthToken(req);
    const authClient = new AuthClient();
    LOG.debug("Token: " + token);
    const btpAccessToken = await authClient.getAccessTokenForBtpAccess(
      req,
      token
    );
    LOG.debug("BTP Access Token: " + btpAccessToken);
    return btpAccessToken;
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
