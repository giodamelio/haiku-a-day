# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = 
    templateData:
        formatDate: (dateString) ->
            moment = require "moment"
            return moment(dateString).format("MM-DD-YYYY")

# Export the DocPad Configuration
module.exports = docpadConfig