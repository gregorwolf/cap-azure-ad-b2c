/**
 * AuthClient.js provides a class offering features for Microsoft Graph and SAP BTP authentication
 *
 * This class provides helpfull features required for authenticating Microsoft Graph and SAP BTP requests.
 * Requests to Microsoft Graph are either authenticated via delegate permissions or application permissions.
 * Requests to SAP BTP are authenticated using a SAML assertion obtained from Azure AD (see details below).
 *
 */

const qs = require("qs");
const axios = require("axios");
const xsenv = require("@sap/xsenv");

class AuthClient {
  constructor() {
    // Read configuration from VCAP_SERVICES environment variable
    xsenv.loadEnv();
    var services = {};
    try {
      services = xsenv.getServices({ azuread: { tag: "azure-ad" } });
    } catch (error) {
      console.error(chalk.red("[azure-ad-auth-client] - " + error.message));
      console.error(
        "[azure-ad-auth-client] - maintain default-env.json or provide the environment variable VCAP_SERVICES"
      );
      throw new Error(error.message);
    }

    // Azure Active Directory tenant id
    this.aadTenantId = services.azuread.tenantID;

    // Application registration id and secret
    this.appId = services.azuread.clientID;
    this.appSecret = services.azuread.clientSecret;

    this.ApplicationIDuri = services.azuread.ApplicationIDuri;

    // V2 AAD path for On-behalf-of flow
    this.pathOAuth = `/${this.aadTenantId}/oauth2/v2.0/token`;
    // On behalf of token use
    this.tokenUseValue = "on_behalf_of";
    // JWT-Bearer token grant type
    this.grantTypeJwtBearer = "urn:ietf:params:oauth:grant-type:jwt-bearer";
    // Token type SAML2
    this.tokenTypeSaml = "urn:ietf:params:oauth:token-type:saml2";
    // AAD hostname
    this.aadBasUrl = "https://login.microsoftonline.com";

    this.headerUrlEncoded = "application/x-www-form-urlencoded";
  }

  // Get SAML Assertion for BTP Access (on behalf of flow )

  /**
   * This method allows to request a SAML assertion for SAP BTP access
   *
   * Using an valid OAuth token (including a custom scope) of the extension application registration,
   * a SAML assertion can be requested from Azure AD. This is possible due to the fact that the extension
   * application has been added as trusted client to the application registration created when setting
   * up the trust between SAP BTP and Azure Ad. This allows us to use the on-behalf-of flow also in this
   * scenario. The resulting SAML assertion can then be used to obtain a valid oAuth token from XSUAA.
   *
   */
  async getSamlAssertionForBtpTokenExchange(token) {
    if (!token || !token.trim()) {
      throw new Error("Invalid token received.");
    }

    const data = qs.stringify({
      assertion: token,
      grant_type: this.grantTypeJwtBearer,
      client_id: this.appId,
      client_secret: this.appSecret,
      scope: this.ApplicationIDuri,
      requested_token_use: this.tokenUseValue,
      requested_token_type: this.tokenTypeSaml,
    });

    const aadTokenEndpoint = this.aadBasUrl + this.pathOAuth;

    let res = await (async () => {
      try {
        let resp = await axios.post(aadTokenEndpoint, data, {
          headers: {
            "Content-Type": this.headerUrlEncoded,
          },
        });
        return resp;
      } catch (err) {
        console.error(err);
      }
    })();

    if (res.fstatus == 200) {
      // test for status you want, etc
      console.log(res.status);
    }

    if (res.data && res.headers["content-type"].includes("application/json")) {
      const responseBody = res.data;
      let samlAssertion = " ";
      try {
        samlAssertion = responseBody["access_token"].toString();
        return samlAssertion;
      } catch (err) {
        console.error("No JSON response. SAML Token request failed");
      }
    } else {
      console.error("HTTP Response was invalid and cannot be deserialized.");
    }
  }

  // Helper method to extract the token from an request header.
  _getAuthDataFromRequest(req) {
    const authHeader = req.headers.authorization;
    const token = authHeader.split(" ")[1];
    return token;
  }
}

module.exports = { AuthClient };
