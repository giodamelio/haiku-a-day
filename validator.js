(function() {
  var getSyllableCount;

  getSyllableCount = function(word, callback) {
    return $.ajax({
      url: "http://rhymebrain.com/talk?function=getWordInfo&word=hello",
      dataType: "json",
      success: function(data, textStatus, XHR) {
        return callback(data.syllables);
      }
    });
  };

  $(document).ready(function() {
    var cm;
    cm = CodeMirror($("#haikuContainer").get(0));
    cm.addLineClass(1, "background", "red");
    getSyllableCount("golden", function(syllables) {
      return console.log(syllables);
    });
    return cm.on("beforeChange", function(cmi, change) {
      if (cm.lineCount() > 3) {
        return change.cancel();
      }
    });
  });

}).call(this);
