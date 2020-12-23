"use strict"

const cds = require('@sap/cds')
const helmet = require('helmet')
const cors = require('cors')
const proxy = require('@sap/cds-odata-v2-adapter-proxy')

cds.on('bootstrap', (app) => {
  app.use(helmet({
    contentSecurityPolicy: false
  }))
  app.use(cors())
  app.use(proxy())
})

module.exports = cds.server