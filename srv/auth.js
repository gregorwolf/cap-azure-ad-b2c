const cds = require("@sap/cds");
const xsenv = require("@sap/xsenv");
var passport = require("passport");
xsenv.loadEnv();
const services = xsenv.getServices({ xsuaa: { tags: "xsuaa" } });
const BearerStrategy = require("passport-azure-ad").BearerStrategy;

const AzureADB2CUser = class extends cds.User {
  is (role) { 
    console.log("Requested role: " + role)
    return role === 'any' || this._roles[role]
  }
};

module.exports = (req, res, next) => {
  const options = services.xsuaa;
  passport.initialize();
  passport.use(
    new BearerStrategy(options, function (token, done) {
      console.log("verifying the user");
      console.log(token, "was the token retreived");
      var user = token.oid;
      return done(null, user, token);
    })
  );
  passport.authenticate("oauth-bearer", function (err, user, token) {
    if (err) {
      console.log("err");
      console.log(err);
      return next(err);
    }
    if (!user) {
      console.log("No user");
      return next();
    }
    console.log("token");
    console.log(token);
    var capUser = {
      id: user,
      _roles: ["authenticated-user"]
    }
    // 
    capUser._roles.push(...token.extension_b2cgroups.split(","));
    req.user = new AzureADB2CUser(capUser);
    next()
  })(req, res, next);
};
