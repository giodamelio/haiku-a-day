# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = 
    environments:
        static:
            plugins:
                livereload:
                    enabled: true
    templateData:
        formatDate: (dateString) ->
            moment = require "moment"
            return moment(dateString).format("MM-DD-YYYY")
        getCount: () ->
            return @getCollection("documents").findAll(relativePath: $startsWith: "haikus/").length
        daysSinceTheBeginning: ->
            moment = require "moment"
            return moment().diff(moment("20130722", "YYYYMMDD"), "days")
        successPercent: ->
            return ((@getCount() / @daysSinceTheBeginning()) * 100).toFixed(2) + "%"

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