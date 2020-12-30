sap.ui.define([
  "de/linuxdozent/capazure/ui5/controller/BaseController",
  "sap/ui/model/odata/v2/ODataModel"
], function(Controller, ODataModel) {
  "use strict";
  /*
  const clientId = "e760cab2-b9a1-4c0d-86fb-ff7084abd902"; //This is your client ID
  const authority = "https://fabrikamb2c.b2clogin.com/fabrikamb2c.onmicrosoft.com/b2c_1_susi"; //This is your tenant info
  */
  const clientId = azureADconfig.clientId
  const authority = azureADconfig.authority
  return Controller.extend("de.linuxdozent.capazure.ui5.controller.MainView", {
    config: {
      msalConfig: {
        auth: {
          clientId: clientId,
          authority: authority, //This is your tenant info
          validateAuthority: false
        },
        cache: {
          cacheLocation: "localStorage",
          storeAuthStateInCookie: true
        }
      },
      scopeConfig: {
        scopes: [clientId]
      }
    },

    onInit: function () {
      this.myMSALObj = new Msal.UserAgentApplication(this.config.msalConfig);
    },

    signIn: function() {
      this.myMSALObj.loginPopup(this.config.scopeConfig).then(function (loginResponse) {
          this.getToken(this.config.scopeConfig).then(this.updateUi().bind(this));
      }.bind(this)).catch(function (error) {
          this.logMessage(error);
      }.bind(this));
    },

    //acquire a token silently
    getToken: function(tokenRequest) {
      return this.myMSALObj.acquireTokenSilent(tokenRequest).catch(function(error) {
        this.logMessage("aquire token popup");
        // fallback to interaction when silent call fails
        return this.myMSALObj.acquireTokenPopup(tokenRequest).then(function (tokenResponse) {
        }.bind(this)).catch(function(error){
          this.logMessage("Failed token acquisition", error);
        }.bind(this));
      });
    },

    updateUi: function() {
      var data = this.myMSALObj.getAccount();
      this.getView().getModel("session").setData(data);
      this.getToken(this.config.scopeConfig).then(function (tokenResponse) {
        var uri = this.getOwnerComponent().getManifestEntry("/sap.app/dataSources/catalog/uri");
        var mParameters = {
          headers: {
            "Authorization": "Bearer " + tokenResponse.accessToken
          },
          useBatch: false
        };
        this.oModel = new ODataModel(uri, mParameters);
        this.oModel.metadataLoaded().then(this._onMetadataLoaded.bind(this));
      }.bind(this));
    },

    _onMetadataLoaded: function() {
      this.getView().setModel(this.oModel, "catalog");
    },

    requestAccessToken: function(oEvent) {
      this.getToken(this.config.scopeConfig).then(function (tokenResponse) {
        this.getView().byId("accessToken").setValue(tokenResponse.accessToken);
      }.bind(this));
    },

    requestSAPLogonTicket: function(oEvent) {
      console.log(oEvent);
    },

    logout: function(oEvent) {
      var oSessionModel = oEvent.getSource().getModel("session");
      var bIsLoggedIn = oSessionModel.getProperty("/idToken/sub");
      if (bIsLoggedIn) {
        // Removes all sessions, need to call AAD endpoint to do full logout
        this.myMSALObj.logout();
        oSessionModel.setData({});
        return;
      }
      return;
    },

    // debug helper
    logMessage: function(s) {
      // document.body.querySelector('.response').appendChild(document.createTextNode('\n' + s));
      console.log(s);
    },
  });
});
