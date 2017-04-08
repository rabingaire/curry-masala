$(document).ready(function(){
  $(".parallax").parallax();
  $(".button-collapse").sideNav();
  $('.datepicker').pickadate({
  	selectMonths: true, // Creates a dropdown to control month
  	selectYears: 15 // Creates a dropdown of 15 years to control year
  });

  $('#timepicker').pickatime({
  	autoclose: false,
  	twelvehour: false,
  	default: '08:30:00'
  });
});

function jump(h){
  var top = document.getElementById(h).offsetTop;
  window.scrollTo(0, top);
}
