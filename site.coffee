kerouac = require("kerouac")
site = kerouac()

# Set the base url
site.set "base url", "http://giodamelio.github.io/haiku-a-day"

# Setup the layout engine
site.engine "ejs", require("ejs-locals")

# Setup the content
site.content "content"

# Setup the static files
site.assets "static"

# Generate a sitemap
site.plug require("kerouac-sitemap")()

# Generate a robots.txt file
site.plug require("kerouac-robotstxt")()
site.generate (err) ->
    if err
        console.error err.message
        console.error err.stack
        return
    console.log "Generating site..."
