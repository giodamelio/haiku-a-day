# Run a command real easy
spawn = (cmd, options) ->
    child_process = require "child_process"
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()

coffeePath = "./node_modules/.bin/coffee"
nodemonPath = "./node_modules/.bin/nodemon"

task "gen", "Generate the site", ->
    spawn coffeePath, "site.coffee"

task "server", "Serve the output", ->
    spawn coffeePath, "server.coffee"

task "both", "Generate and serve the output", ->
    invoke "gen"
    invoke "server"

task "watch", "Auto-regenarate and serve the output", ->
    invoke "server"
    spawn nodemonPath, "-e '.coffee|.html|.md|.ejs site.coffee"