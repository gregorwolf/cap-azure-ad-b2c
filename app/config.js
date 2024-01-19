// Azure AD B2C sample endpoint
const clientId = "e760cab2-b9a1-4c0d-86fb-ff7084abd902";
const azureADconfigX = {
  clientId: clientId,
  scopes: [clientId],
  authority:
    "https://fabrikamb2c.b2clogin.com/fabrikamb2c.onmicrosoft.com/b2c_1_susi",
};
// CSWb2c
const clientIdCSWb2c = "ac6f2c18-a2c6-4b5f-9148-13abaaf8e5aa";
const azureADconfigCSWb2c = {
  clientId: clientIdCSWb2c,
  scopes: [clientIdCSWb2c],
  authority:
    "https://cswb2b.b2clogin.com/cswb2b.onmicrosoft.com/B2C_1_SignUpAndSignInV2",
};
// CSWEntraID
const clientIdCSWEntraID = "19702d90-5fb8-4d76-a6c9-557f55c771e8";
const azureADconfig = {
  clientId: clientIdCSWEntraID,
  scopes: ["openid","profile","api://19702d90-5fb8-4d76-a6c9-557f55c771e8/SAP.ReadWrite"],
  authority:
    "https://login.microsoftonline.com/6f8c8b13-6c5b-42e2-8a42-e4ef99e7ff48",
};
