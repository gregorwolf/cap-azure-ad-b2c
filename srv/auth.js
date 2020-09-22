const cds = require("@sap/cds");
const DEBUG = cds.debug("cds-azure-ad")
const xsenv = require("@sap/xsenv");
var passport = require("passport");
xsenv.loadEnv();
const services = xsenv.getServices({ xsuaa: { tags: "xsuaa" } });
const BearerStrategy = require("passport-azure-ad").BearerStrategy;

const AzureADB2CUser = class extends cds.User {
  is (role) { 
    DEBUG && DEBUG ("Requested role: " + role)
    return role === 'any' || this._roles[role]
  }
};

module.exports = (req, res, next) => {
  const options = services.xsuaa;
  passport.initialize();
  passport.use(
    new BearerStrategy(options, function (token, done) {
      DEBUG && DEBUG ("verifying the user");
      DEBUG && DEBUG (token, "was the token retreived");
      var user = token.oid;
      return done(null, user, token);
    })
  );
  passport.authenticate("oauth-bearer", function (err, user, token) {
    if (err) {
      DEBUG && DEBUG ("err");
      DEBUG && DEBUG (err);
      return next(err);
    }
    if (!user) {
      DEBUG && DEBUG ("No user");
      return next();
    }
    DEBUG && DEBUG ("token");
    DEBUG && DEBUG (token);
    var capUser = {
      id: user,
      _roles: ["authenticated-user"]
    }
    if(token.extension_b2cgroups) {
      capUser._roles.push(...token.extension_b2cgroups.split(","));
    }
    req.user = new AzureADB2CUser(capUser);
    next()
  })(req, res, next);
};
