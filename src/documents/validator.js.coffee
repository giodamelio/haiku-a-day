$(document).ready ->
    # Limit the rows to 3
    $("#haikuInput").keydown (e) ->
        if e.keyCode == 13
            if $(this).val().split("\n").length >= 3
                return false
            else
                return true
