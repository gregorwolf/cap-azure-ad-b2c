# Authenticate to a CAP service using Azure AD B2C

This example application demonstrates how to authenticate to a SAP Cloud Application Programming Model service using Azure AD B2C. The client UI is based on the example app [Single-Page Application built on MSAL.js with Azure AD B2C](https://github.com/Azure-Samples/active-directory-b2c-javascript-msal-singlepageapp).

You want to give it a try please store the following content in the file *default-env.json* the root folder of this project. The B2C tenant used here is the sample tenant provided by Microsoft which is used also for their examples. As this file might include sensitive data it's not included in the git repository.

```json
{
  "VCAP_SERVICES": {
    "xsuaa": [
      {
        "name": "cap-azure-ad-b2c-uaa",
        "label": "azure-ad",
        "tags": [
          "azure-ad"
        ],
        "plan": "space",
        "credentials": {
          "identityMetadata": "https://fabrikamb2c.b2clogin.com/fabrikamb2c.onmicrosoft.com/B2C_1_SUSI/v2.0/.well-known/openid-configuration/",
          "clientID": "e760cab2-b9a1-4c0d-86fb-ff7084abd902",
          "policyName": "B2C_1_SUSI",
          "isB2C": true,
          "validateIssuer": true,
          "loggingLevel": "warn",
          "loggingNoPII": true,
          "passReqToCallback": false
        }
      }
    ]
  },
  "destinations": []
}
```

The configuration in app/index.html matches this settings.

For the first start you can run:

```bash
npm run setup
```

to install the dependencies, build, deploy and start the app. It them will be reachable at http://localhost:6420/. The next time you want to start simply run:

```bash
npm run start:local
```

# Authenticate to a CAP service using Entra ID

Config of *default-env.json*:

```json
{
  "VCAP_SERVICES": {
    "xsuaa": [
      {
        "name": "cap-entra-id-csw",
        "label": "azure-ad",
        "tags": [
          "azure-ad"
        ],
        "plan": "space",
        "credentials": {
          "identityMetadata": "https://login.microsoftonline.com/<your-tenant-id>/v2.0/.well-known/openid-configuration/",
          "clientID": "<your-client-id>",
          "audience": "<your-audience>",
          "isB2C": false,
          "validateIssuer": true,
          "loggingLevel": "warn",
          "loggingNoPII": false,
          "passReqToCallback": false
        }
      }
    ]
  },
  "destinations": []
}
```

Config of *app/config.js*:

```JavaScript
// CSWEntraID
const azureADconfig = {
  clientId: "<your-client-id>",
  authority:
    "https://login.microsoftonline.com/<your-tenant-id>",
};
```

## Deploy to Kyma

Download the kubeconfig from your Kyma instance via the menu behind the account Icon in the upper right corner. Save it in *~/.kube/kubeconfig-kyma.yml*. Then run:

`export KUBECONFIG=~/.kube/kubeconfig-kyma.yml`

Please note that the token in the kubeconfig is [only valid for 8 hours](https://kyma-project.io/docs/components/security#details-iam-kubeconfig-service). So you might have to redo the download whenever you want to run the commands again.

To keep this project separate from your other deployments I would suggest to create a namespace:

`kubectl create namespace cap-azure-ad-b2c`

Deploy the configuration:

`kubectl -n cap-azure-ad-b2c apply -f kyma/deployment.yaml`

Update the container:

`kubectl -n cap-azure-ad-b2c rollout restart deployment/cap-azure-ad-b2c`
