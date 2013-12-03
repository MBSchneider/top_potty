$(document).ready(function() {
  $("#filterbutton").click(function() {
    $("#searchfilters").toggle(200);
    $("#searchfilters").toggleClass();
    $(this).text(function(i, text){
      return text === "More search options" ? "Close search options" :"More search options";
    })
  });
});
