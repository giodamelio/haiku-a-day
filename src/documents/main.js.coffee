$(document).ready ->
    # Setup the haikus

    # Get todays
    $("#haikuContainer").load "haikus/" + moment().format("MM-DD-YYYY") + ".html", (response, status, xhr) ->
        if status == "error"
            err = $("<p style='text-align: center;'></p>")
            err.html("<strong>No haiku for that day.</strong>")
            $("#haikuContainer").append err

    # Handle the events

    # Today
    $("#date-today").click ->
        $("#kalendae-datepicker").hide()
        $("#date-yesterday").removeClass "current"
        $("#date-custom").removeClass "current"
        $("#date-today").addClass "current"
        $("#haikuContainer").html ""
        $("#haikuContainer").load "haikus/" + moment().format("MM-DD-YYYY") + ".html", (response, status, xhr) ->
            if status == "error"
                err = $("<p style='text-align: center;'></p>")
                err.html("<strong>No haiku for that day.</strong>")
                $("#haikuContainer").append err

    # Yesterday
    $("#date-yesterday").click ->
        $("#kalendae-datepicker").hide()
        $("#date-today").removeClass "current"
        $("#date-custom").removeClass "current"
        $("#date-yesterday").addClass "current"
        $("#haikuContainer").html ""
        $("#haikuContainer").load "haikus/" + moment().subtract("days", 1).format("MM-DD-YYYY") + ".html", (response, status, xhr) ->
            if status == "error"
                err = $("<p style='text-align: center;'></p>")
                err.html("<strong>No haiku for that day.</strong>")
                $("#haikuContainer").append err

    $("#date-custom").click ->
        $("#kalendae-datepicker").show()
        $("#date-today").removeClass "current"
        $("#date-yesterday").removeClass "current"
        $("#date-custom").addClass "current"

    # Setup the datepicker
    datepicker = new Kalendae "kalendae-datepicker"
    datepicker.subscribe "change", (date, action) ->
        $("#kalendae-datepicker").hide()
        $("#haikuContainer").html ""
        $("#haikuContainer").load "haikus/" + date.format("MM-DD-YYYY"), (response, status, xhr) ->
            if status == "error"
                err = $("<p style='text-align: center;'></p>")
                err.html("<strong>No haiku for that day.</strong>")
                $("#haikuContainer").append err
