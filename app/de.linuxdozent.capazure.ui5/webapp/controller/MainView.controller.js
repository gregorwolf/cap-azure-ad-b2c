sap.ui.define([
  "de/linuxdozent/capazure/ui5/controller/BaseController"
], function(Controller) {
  "use strict";
  const clientId = "ac6f2c18-a2c6-4b5f-9148-13abaaf8e5aa"; //This is your client ID
  const authority = "https://cswb2b.b2clogin.com/cswb2b.onmicrosoft.com/B2C_1_SignUpAndSignInV2"; //This is your tenant info
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
    },

    requestAccessToken: function(oEvent) {
      this.getToken(this.config.scopeConfig).then(function (tokenResponse) {
        this.getView().byId("accessToken").setValue(tokenResponse.accessToken);
      }.bind(this));
    },
    // signout the user
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
