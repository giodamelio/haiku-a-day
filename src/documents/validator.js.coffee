getSyllableCount = (word, callback) ->
    $.ajax
        url: "http://rhymebrain.com/talk?function=getWordInfo&word=hello"
        dataType: "json"
        success: (data, textStatus, XHR) ->
            callback data.syllables


$(document).ready ->
    cm = CodeMirror($("#haikuContainer").get(0))

    cm.addLineClass 1, "background", "red"

    getSyllableCount "golden", (syllables) ->
        console.log syllables

    # Limit the rows to 3
    cm.on "beforeChange", (cmi, change) ->
        if cm.lineCount() > 3
            change.cancel()
