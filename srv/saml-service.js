const cds = require("@sap/cds");
const LOG = cds.log("saml-service");

const fs = require("fs");
var saml = require("saml").Saml11; // Saml20 or Saml11

// Maybe https://github.com/auth0/node-samlp is the better alternative

module.exports = class SamlService extends cds.Service {
  init() {
    var options = {
      cert: fs.readFileSync("./certificates/idp.example.com.pem").toString(),
      key: fs.readFileSync("./certificates/idp.example.com-key.pem").toString(),
      issuer: "https://idp.example.com",
      lifetimeInSeconds: 600,
      offset: 60,
      audiences: "http://A4H",
      subjectConfirmationMethod: "sender-vouches",
      attributes: {
        "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name":
          "Gregor Wolf",
      },
      nameIdentifier: "",
      // sessionIndex: "_faed468a-15a0-4668-aed6-3d9c478cc8fa",
    };

    this.on("getMetadata", async (req) => {
      LOG._debug && LOG.debug("getMetadata");
      return "Not supported";
    });

    this.on("getSamlAssertion", async (req) => {
      LOG._debug && LOG.debug("getMetadata");
      LOG._debug && LOG.debug(req.user.id);
      options.nameIdentifier = req.user.id;
      // sets SubjectConfirmation to:
      // Method = "urn:oasis:names:tc:SAML:2.0:cm:bearer"
      // for SOAP we need:
      // Method = "urn:oasis:names:tc:SAML:2.0:cm:sender-vouches"
      const samlAssertion = saml.create(options);
      LOG._debug && LOG.debug(samlAssertion);
      return samlAssertion;
    });
  }
};
