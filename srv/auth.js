const cds = require('@sap/cds')
const xsenv = require("@sap/xsenv")
var passport = require('passport');
xsenv.loadEnv();
const services = xsenv.getServices({ xsuaa: { tags: "xsuaa" }})
const BearerStrategy = require('passport-azure-ad').BearerStrategy

const DummyUser = class extends cds.User {
  is (role) { 
    console.log("Requested role: " + role)
    return true
  }
}

function readJwt(req){
  const authHeader = req.headers.authorization;
  if (authHeader){
     const theJwtToken = authHeader.substring(7);
     if(theJwtToken){
        const jwtBase64Encoded = theJwtToken.split('.')[1];
        if(jwtBase64Encoded){
           const jwtDecoded = Buffer.from(jwtBase64Encoded, 'base64').toString('ascii');
           return JSON.parse(jwtDecoded);           
        }
     }
  }
}

module.exports = (req,res,next) => {
  const options = services.xsuaa
  passport.initialize()
  passport.use( 
    new BearerStrategy(options,
      function(token, done) {
        console.log('verifying the user');
        console.log(token, 'was the token retreived');
        findById(token.oid, function(err, user) {
          if (err) {
            return done(err);
          }
          if (!user) {
            // "Auto-registration"
            console.log('User was added automatically as they were new. Their oid is: ', token.oid);
            users.push(token);
            owner = token.oid;
            return done(null, token);
          }
          owner = token.oid;
          return done(null, user, token);
        });
      }
    )
  )
  passport.authenticate('oauth-bearer', function(err, user, info) {
    if (err) { 
      console.log("err")
      console.log(err)
    }
    if (!user) { 
      console.log("No user")
    }
  })(req, res, next);

  /*
  var authenticated = bearerStrategy.authenticate(req)
    /*
    bearerStrategy(readJwt(req), (param1, param2) => {
    console.log("param1")
    console.log(param1)
    console.log("param2")
    console.log(param2)
  })
  req.user = new DummyUser('dummy')
  next()
  */
}
