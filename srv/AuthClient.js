/**
 * AuthClient.js provides a class offering features for Microsoft Graph and SAP BTP authentication
 *
 * This class provides helpfull features required for authenticating Microsoft Graph and SAP BTP requests.
 * Requests to Microsoft Graph are either authenticated via delegate permissions or application permissions.
 * Requests to SAP BTP are authenticated using a SAML assertion obtained from Azure AD (see details below).
 *
 */
const cds = require("@sap/cds");
const LOG = cds.log("auth-client");
const qs = require("qs");
const axios = require("axios");
const xsenv = require("@sap/xsenv");

class AuthClient {
  constructor() {
    // Read configuration from VCAP_SERVICES environment variable
    xsenv.loadEnv();
    var services = {};
    try {
      services = xsenv.getServices({
        azuread: { tag: "azure-ad" },
        xsuaa: { tag: "xsuaa" },
      });
    } catch (error) {
      LOG.error(chalk.red("[azure-ad-auth-client] - " + error.message));
      LOG.error(
        "[azure-ad-auth-client] - maintain default-env.json or provide the environment variable VCAP_SERVICES"
      );
      throw new Error(error.message);
    }

    // Azure Active Directory tenant id
    this.aadTenantId = services.azuread.tenantID;

    // Application registration id and secret
    this.appId = services.azuread.clientID;
    this.appSecret = services.azuread.clientSecret;

    this.ApplicationIDuri = services.xsuaa.url + "/.default";

    // V2 AAD path for On-behalf-of flow
    this.pathOAuth = `/${this.aadTenantId}/oauth2/v2.0/token`;

    // this._xsuaaACSURLSuffix = "aws-live-eu10";
    this._xsuaaACSURLSuffix = "aws-live";
    this.xsuaaUrl = services.xsuaa.url;
    this.btpTokenEndpoint = `/oauth/token/alias/${services.xsuaa.identityzone}.${this._xsuaaACSURLSuffix}`;

    this.xsuaaClientId = services.xsuaa.clientid;
    this.xsuaaSecret = services.xsuaa.clientsecret;

    // On behalf of token use
    this.tokenUseValue = "on_behalf_of";
    // JWT-Bearer token grant type
    this.grantTypeJwtBearer = "urn:ietf:params:oauth:grant-type:jwt-bearer";
    // Token type SAML2
    this.tokenTypeSaml = "urn:ietf:params:oauth:token-type:saml2";
    // Token type SAML bearer
    this.grantTypeSaml = "urn:ietf:params:oauth:grant-type:saml2-bearer";
    // AAD hostname
    this.aadBasUrl = "https://login.microsoftonline.com";

    this.headerUrlEncoded = "application/x-www-form-urlencoded";
  }

  // Get BTP Access Token to access SAP Cloud Integration by exchanging SAML Assertion to BTP OAuth token issued by xsuaa
  // If token is provided, the access token request can be skipped (e.g. when bot oAuth connection is used)

  /**
   * This method allows to request an OAuth token for SAP BTP access like calling Integration Flows
   *
   * Requesting such an OAuth token consists of multiple consecutive steps which will be outlined below.
   *
   * The first step (_getAccessTokenForBtpSamlAssertion) will make use of the on-behalf-of flow again by using current
   * Microsoft Teams token and exchanging it to a an application access token issued by the extension application registration.
   * This token will contain a custom scope allowing us to request a SAML assertion in the next step. In case of bot usage,
   * this step can be skipped as the OAuth connection feature of the Bot service will return this application access token.
   *
   * Once the application access token including the custom scope is available, it can be used to obtain a SAML assertion
   * from the application registration created when configuring the trust between SAP BTP and Azure AD. This SAML assertion
   * can further on be used to retriev a valid oAuth token from SAP BTP (_getSamlAssertionForBtpTokenExchange).
   *
   * The SAML assertion is send to the XSUAA authentication endpoint of the SAP BTP subaccount. Due to the trust, between
   * Azure AD and SAP BTP, XSUAA will process the SAML assertion and issue an oAuth token which can now be used to access
   * SAP BTP ressources like Integration Flows of SAP Cloud Integration.
   *
   */
  async getAccessTokenForBtpAccess(req, token) {
    try {
      // if (!token) token = await this._getAccessTokenForBtpSamlAssertion(req);
      const samlAssertionAzureAd =
        await this.getSamlAssertionForBtpTokenExchange(token);

      const data = qs.stringify({
        assertion: samlAssertionAzureAd,
        grant_type: this.grantTypeSaml,
      });

      // This token endpoint is able to process the SAML assertion
      const btpTokenEndpoint = this.xsuaaUrl + this.btpTokenEndpoint;

      // Request a new OAuth token for SAP Cloud Integration apiaccess using the SAML assertion
      // and the respective client id and secret of the process integration runtime instance.
      let res = await (async () => {
        try {
          let resp = await axios.post(btpTokenEndpoint, data, {
            auth: {
              username: this.xsuaaClientId,
              password: this.xsuaaSecret,
            },
            headers: {
              "Content-Type": this.headerUrlEncoded,
            },
          });
          return resp;
        } catch (err) {
          LOG.error(err.response.data.error_description);
        }
      })();

      // The access token can now be extracted from the result
      if (
        res?.data &&
        res.headers["content-type"].includes("application/json")
      ) {
        const responseBody = res.data;
        let accessToken = " ";
        try {
          accessToken = responseBody["access_token"].toString();
          return accessToken;
        } catch (err) {
          LOG.error("No JSON response. Access Token request failed");
        }
      } else {
        LOG.error("HTTP Response was invalid and cannot be deserialized.");
      }
    } catch (err) {
      LOG.error(err);

      if (
        err.error === "invalid_grant" ||
        err.error === "interaction_required"
      ) {
        throw new Error(err.error);
      }
    }
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
        LOG.error(err);
      }
    })();

    if (res.fstatus == 200) {
      // test for status you want, etc
      LOG.log(res.status);
    }

    if (res.data && res.headers["content-type"].includes("application/json")) {
      const responseBody = res.data;
      let samlAssertionBase64 = " ";
      try {
        samlAssertionBase64 = responseBody["access_token"].toString();
        var samlAssertionBuffer = Buffer.from(samlAssertionBase64, "base64");
        var samlAssertion = samlAssertionBuffer.toString("utf-8");
        LOG._debug && LOG.debug("SAML Assertion: " + samlAssertion);
        return samlAssertionBase64;
      } catch (err) {
        LOG.error("No JSON response. SAML Token request failed");
      }
    } else {
      LOG.error("HTTP Response was invalid and cannot be deserialized.");
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
