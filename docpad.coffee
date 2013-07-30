# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = 
    templateData:
        formatDate: (dateString) ->
            moment = require "moment"
            return moment(dateString).format("MM-DD-YYYY")
    events:
        serverExtend: (opts) ->
            # Simulate a bit of load time for testing
            opts.server.use (req, res, next) ->
                if req.url.split("/")[1] == "haikus"
                    setTimeout(->
                        next()
                    , 2000)
                else
                    next()

# Export the DocPad Configuration
module.exports = docpadConfig