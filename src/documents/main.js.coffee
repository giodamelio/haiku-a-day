getHaiku = (date) ->
    $("#haikuContainer").html ""
    $.ajax
        url: "haikus/" + date + "/index.html"
        beforeSend: (XHR, settings) ->
            $("#loading").show()
        complete: (XHR, settings) ->
            $("#loading").hide()
        success: (data, textStatus, XHR) ->
            $("#haikuContainer").html data
        error: (XHR, textStatus, errorThrown) ->
            console.log textStatus
            err = $("<p style='text-align: center;'></p>")
            err.html "<strong>No haiku for that day.</strong>"
            $("#haikuContainer").html err

$(document).ready ->
    # Setup the haikus

    # Get todays
    getHaiku moment().format("MM-DD-YYYY")

    # Handle the events

    # Today
    $("#date-today").click ->
        $("#kalendae-datepicker").hide "slow"
        $("#date-yesterday").removeClass "current"
        $("#date-custom").removeClass "current"
        $("#date-today").addClass "current"
        getHaiku moment().format("MM-DD-YYYY")

    # Yesterday
    $("#date-yesterday").click ->
        $("#kalendae-datepicker").hide("slow")
        $("#date-today").removeClass "current"
        $("#date-custom").removeClass "current"
        $("#date-yesterday").addClass "current"
        getHaiku moment().subtract("days", 1).format("MM-DD-YYYY")

    # Custom
    $("#date-custom").click ->
        $("#kalendae-datepicker").show("slow")
        $("#date-today").removeClass "current"
        $("#date-yesterday").removeClass "current"
        $("#date-custom").addClass "current"

    # Setup the datepicker
    datepicker = new Kalendae "kalendae-datepicker"
    datepicker.subscribe "change", (date, action) ->
        $("#kalendae-datepicker").hide("slow")
        getHaiku date.format("MM-DD-YYYY")
