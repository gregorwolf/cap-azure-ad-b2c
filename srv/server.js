"use strict"

const cds = require('@sap/cds')
const helmet = require('helmet')
const cors = require('cors')

cds.on('bootstrap', (app) => {
  /*
  app.use(helmet({
    contentSecurityPolicy: false
  }))
  */
  app.use(cors())
})

module.exports = cds.server
