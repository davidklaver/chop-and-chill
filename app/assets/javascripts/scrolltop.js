


// var about = $('#about');

// // console.log(about);

// $(window).scroll(function() {
// 	// if (about.scrollTop() > 0) {
// 		console.log(about.offset().top);
// 	// }
//  });


$(document).ready(function(){
  $(window).scroll(function() {
  	// console.log(about);
  	var elementOffset = ($('#about').offset().top - $(window).scrollTop());
  	if (elementOffset < 400 ) {
	  	console.log("here!");
	  	$("#aboutContainer").addClass("fadeIn");
	  };
  });
});