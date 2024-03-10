## OAuth Token Exchange Flow

Configuration based on the SAP Community blog posts:

- [Exchange JWT token from Azure with token issued by SAP Cloud Identity Authentication Service](https://community.sap.com/t5/technology-blogs-by-sap/exchange-jwt-token-from-azure-with-token-issued-by-sap-cloud-identity/ba-p/13553444)
- [Connecting SAP IAS as a proxy to Azure AD using OpenID Connect](https://community.sap.com/t5/technology-blogs-by-members/connecting-sap-ias-as-a-proxy-to-azure-ad-using-openid-connect/ba-p/13534385)

```mermaid
sequenceDiagram
%% participants
participant User as User
participant WebApp as Web Application
participant IdP as Identity Provider
participant SAPIAS as SAP Identity Authentication Service
participant XSUAA as SAP BTP Authentication
participant BTPApp as SAP BTP Application
%% arrows
loop Setup
WebApp-->IdP: Trust Configuration
IdP-->SAPIAS: Trust Configuration
SAPIAS-->XSUAA: Trust Configuration
end
User->>WebApp: Open App
WebApp->>IdP: Requests User Authentication
IdP->>User: Ask User for credentials and other factors
User->>IdP: Provides credentials and other factors
IdP->>WebApp: Provides JWT
WebApp->>User: Session Cookie
User->>WebApp: Request to SAP
WebApp->>SAPIAS: Requests SAP IAS JWT with JWT
SAPIAS->>SAPIAS: Validates JWT
SAPIAS->>WebApp: Provides SAP IAS JTW
WebApp->>XSUAA: Requests BTP JWT with SAP IAS JTW
XSUAA->>XSUAA: Validates SAP IAS JTW
XSUAA->>WebApp: Provides BTP JTW
WebApp->>BTPApp: Sends request with BTP JWT as Authorization Header
BTPApp->>WebApp: Response with Application data
WebApp->>User: Forward Application Data
```
