(function() {
  var getHaiku;

  getHaiku = function(date) {
    $("#haikuContainer").html("");
    return $.ajax({
      url: "haikus/" + date + "/index.html",
      beforeSend: function(XHR, settings) {
        return $("#loading").show();
      },
      complete: function(XHR, settings) {
        return $("#loading").hide();
      },
      success: function(data, textStatus, XHR) {
        return $("#haikuContainer").html(data);
      },
      error: function(XHR, textStatus, errorThrown) {
        var err;
        console.log(textStatus);
        err = $("<p style='text-align: center;'></p>");
        err.html("<strong>No haiku for that day.</strong>");
        return $("#haikuContainer").html(err);
      }
    });
  };

  $(document).ready(function() {
    var datepicker;
    getHaiku(moment().format("MM-DD-YYYY"));
    $("#date-today").click(function() {
      $("#kalendae-datepicker").hide("slow");
      $("#date-yesterday").removeClass("current");
      $("#date-custom").removeClass("current");
      $("#date-today").addClass("current");
      return getHaiku(moment().format("MM-DD-YYYY"));
    });
    $("#date-yesterday").click(function() {
      $("#kalendae-datepicker").hide("slow");
      $("#date-today").removeClass("current");
      $("#date-custom").removeClass("current");
      $("#date-yesterday").addClass("current");
      return getHaiku(moment().subtract("days", 1).format("MM-DD-YYYY"));
    });
    $("#date-custom").click(function() {
      $("#kalendae-datepicker").show("slow");
      $("#date-today").removeClass("current");
      $("#date-yesterday").removeClass("current");
      return $("#date-custom").addClass("current");
    });
    datepicker = new Kalendae("kalendae-datepicker");
    return datepicker.subscribe("change", function(date, action) {
      $("#kalendae-datepicker").hide("slow");
      return getHaiku(date.format("MM-DD-YYYY"));
    });
  });

}).call(this);
