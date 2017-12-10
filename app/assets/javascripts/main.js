$( document ).on('turbolinks:load', function() {
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

  // Responsive Menu
  $(".responsive-menu .responsive-menu-button").click(function(event){
    $(this).parent().find(".nav-menu-responsive").slideToggle('slow');
  });

  $(".responsive-menu .profile .profile-button").click(function(event) {
    $(this).parent().find(".drop-menu-profile").slideToggle("hidden");
  });

  $(".menu .profile .profile-button").click(function(event) {
    $(this).parent().find(".drop-menu-profile").toggleClass("hidden");
  });

  $("#container-effect .button4").click(function(event){
    $(this).parents().find("body a").addClass('daltonism');
    $(this).parents().find("body p").addClass('daltonism');
    $(this).parents().find("body h1").addClass('daltonism');
    $(this).parents().find("body h2").addClass('daltonism');
    $(this).parents().find("body button").addClass('daltonism');
    $(this).parents().find("body h3").addClass('daltonism');
    $(this).parents().find("body span").addClass('daltonism');
    $(this).parents().find("body input").addClass('daltonism');
    $(this).parents().find("body i").addClass('daltonism');
    $(this).parents().find("body .title").addClass('daltonism-bg');

    $(this).css('z-index','99999');
    $('#overlay2').fadeIn(300);
  });

  $("#container-effect .effects-button").click(function(){
    $(".container-options.hide").toggle(400);
  });

  // BLUR EFFECT BUTTON
  //attach click event to button
  $('#container-effect .button').click(function () {

    //when button is clicked we call blurElement function
    blurElement(".site-content", 3);
    blurElement("header", 3);
    blurElement("footer", 3);

  });

  //attach click event to button
  $('#container-effect .button2').click(function () {

    //when button is clicked we disable the blur
    blurElement(".site-content", 0);
    blurElement("header", 0);
    blurElement("footer", 0);

    $('#overlay').fadeOut(300, function(){
        $('.expose').css('z-index','99999');
    });

    $('#overlay2').fadeOut(300, function(){
        $('.expose').css('z-index','99999');
    });

    $(this).parents().find("body a").removeClass('daltonism');
    $(this).parents().find("body p").removeClass('daltonism');
    $(this).parents().find("body h1").removeClass('daltonism');
    $(this).parents().find("body h2").removeClass('daltonism');
    $(this).parents().find("body button").removeClass('daltonism');
    $(this).parents().find("body h3").removeClass('daltonism');
    $(this).parents().find("body span").removeClass('daltonism');
    $(this).parents().find("body input").removeClass('daltonism');
    $(this).parents().find("body i").removeClass('daltonism');
    $(this).parents().find("body .title").removeClass('daltonism-bg');

  });

  // BLIND EFFECT BUTTON 
  $('#container-effect .button3').click(function(e){
      $(this).css('z-index','99999');
      $('#overlay').fadeIn(300);
  });
});


//set the css3 blur to an element
function blurElement(element, size) {
  var filterVal = 'blur(' + size + 'px)';
  $(element).css({
    'filter':filterVal,
    'webkitFilter':filterVal,
    'mozFilter':filterVal,
    'oFilter':filterVal,
    'msFilter':filterVal,
    'transition':'all 0.5s ease-out',
    '-webkit-transition':'all 0.5s ease-out',
    '-moz-transition':'all 0.5s ease-out',
    '-o-transition':'all 0.5s ease-out'
  });
}



// EFFECT CONTAINER WITH DIFFERENT ANIMATE
// $("#container-effect .effects-button").click(function(){
//   if($('.container-options').hasClass('hide')){
//     openEffectBox()
//   }else{
//     closeEffectBox()
//   }
// });


// function closeEffectBox(){
//   var $link = $(".container-options");

//   if(!$link.hasClass('hide')){
//     $link.slideToggle("hide");
//     $link.addClass('hide');
//   }
// }

// function openEffectBox(){
//   var $link = $(".container-options");

//   if($link.hasClass('hide')){
//     $link.slideToggle("hide");
//     $link.removeClass('hide');
//   }
// }