$(function() {
  $( "#sortable1, #sortable2, #sortable3" ).sortable({
     connectWith: "#sortable1, #sortable2, #sortable3",
  });  
  $( "#sortable1, #sortable2, #sortable3" ).disableSelection();   
});



