/* global QUnit */

QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function() {
  "use strict";

  sap.ui.require([
    "de/linuxdozent/capazure/ui5/test/integration/AllJourneys"
  ], function() {
    QUnit.start();
  });
});
