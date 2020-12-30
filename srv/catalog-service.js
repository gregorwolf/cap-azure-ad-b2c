module.exports = async function (srv){
  
  const biscuitService = await cds.connect.to('biscuit')

  srv.on ('readSAPLogonTicket', async req => {
    // const biscuitServiceTransaction = biscuitService.transaction(req)
    // Results in:
    // Error: Field jku containing the URL for JWT verification not part of header.
    // at getVerificationKeyURL (/Users/gwolf/Documents/Projects/azure/cap-azure-ad-b2c/node_modules/@sap-cloud-sdk/core/dist/connectivity/scp-cf/jwt.js:353:15)
    try {
      const response = await biscuitService.get('/sap/bc/biscuit?user=GWOLF-CSW')
      return response
    } catch (error) {
      console.error("Error Message: " + error.message)
      console.error("Stack: " + error.stack)
      if(error.request && error.request.path) {
        console.error("Request Path: " + error.request.path)
      }
    }
  })
}