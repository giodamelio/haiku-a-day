# Run a command real easy
spawn = (cmd, options) ->
    child_process = require "child_process"
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()

coffeePath = "./node_modules/.bin/coffee"

task "gen", "Generate the site", ->
    spawn coffeePath, "site.coffee"

task "server", "Serve the output", ->
    spawn coffeePath, "server.coffee"

task "both", "Generate and serve the output", ->
    invoke "gen"
    invoke "server"
