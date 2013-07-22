express = require "express"
server = express();

server.use express.logger()
server.use express.static("output")

console.log "Listening on http://localhost:3000"
server.listen 3000 