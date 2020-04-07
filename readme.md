# Authenticate to a CAP service using Azure AD B2C

This example application demonstrates how to authenticate to a SAP Cloud Application Programming Model service using Azure AD B2C. The client UI is based on the example app [Single-Page Application built on MSAL.js with Azure AD B2C](https://github.com/Azure-Samples/active-directory-b2c-javascript-msal-singlepageapp).

You want to give it a try please store the following content in the file *default-env.json* the root folder of this project. The B2C tenant used here is the sample tenant provided by Microsoft which is used also for their examples. As this file might inlcude sensitive data it's not included in the git repository.

```json
{
  "VCAP_SERVICES": {
    "xsuaa": [
      {
        "name": "cap-azure-ad-b2c-uaa",
        "label": "xsuaa",
        "tags": [
          "xsuaa"
        ],
        "plan": "space",
        "credentials": {
          "identityMetadata": "https://fabrikamb2c.b2clogin.com/fabrikamb2c.onmicrosoft.com/B2C_1_SUSI/v2.0/.well-known/openid-configuration/",
          "clientID": "e760cab2-b9a1-4c0d-86fb-ff7084abd902",
          "policyName": "B2C_1_SUSI",
          "isB2C": true,
          "validateIssuer": false,
          "loggingLevel": "info",
          "loggingNoPII": false,
          "passReqToCallback": false
        }
      }
    ]
  },
  "destinations": []
}
```

Make sure that you have the patch command available on your machine. Then you can run:

```bash
npm run setup
```

to install the dependencies, build, deploy, patch and start the app. It them will be reachable at http://localhost:6420/. The next time you want to start simply run:

```bash
npm start
```