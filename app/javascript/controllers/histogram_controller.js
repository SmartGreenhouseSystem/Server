import jquery from "jquery"

window.$ = jquery

$(document).ready(function(){
  $("#inputName").on("keyup", function() {
    var value = $(this).val().toLowerCase();

    $("#measurementTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


$(document).ready(function(){
  $("#filterType").change( function() {
    var selection = $(this).val();
    var dataset = $("#measurementTable tr")
 
    dataset.show();
    if (selection !== "all") {
      dataset.filter(function(index, item) {
        return $(item).find('td:first-child').text().split(',').indexOf(selection) === -1;
      }).hide();
    }
  });
});
