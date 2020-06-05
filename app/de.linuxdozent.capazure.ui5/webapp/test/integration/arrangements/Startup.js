sap.ui.define([
  "sap/ui/test/Opa5"
], function(Opa5) {
  "use strict";

  return Opa5.extend("de.linuxdozent.capazure.ui5.test.integration.arrangements.Startup", {

    iStartMyApp: function () {
      this.iStartMyUIComponent({
        componentConfig: {
          name: "de.linuxdozent.capazure.ui5",
          async: true,
          manifest: true
        }
      });
    }

  });
});
