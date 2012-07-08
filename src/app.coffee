express = require 'express'
routes  = require './routes'
haml    = require 'hamljs'
cons    = require 'consolidate'
http    = require 'http'
app     = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'

  # HAML
  app.engine 'haml', cons.haml
  app.set 'view engine', 'haml'

  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + '/public')

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index

server = http.createServer(app)

server.listen app.get('port'), ->
  console.log "Express server listening on port " + app.get('port')
