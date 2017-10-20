$(document).on('ready page:load', function() {
  // Radio Button Unmark
  var allRadios = document.getElementsByName('re');
  var booRadio;
  var x = 0;
  for(x = 0; x < allRadios.length; x++){

      allRadios[x].onclick = function() {
          if(booRadio == this){
              this.checked = false;
              booRadio = null;
          }else{
              booRadio = this;
          }
      };
  }

  // Radio Button Unmark 2
  var allRadios = document.getElementsByName('test');
  var booRadio;
  var x = 0;
  for(x = 0; x < allRadios.length; x++){

      allRadios[x].onclick = function() {
          if(booRadio == this){
              this.checked = false;
              booRadio = null;
          }else{
              booRadio = this;
          }
      };
  }
}); 


