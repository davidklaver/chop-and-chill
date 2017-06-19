$(document).ready(function(){
    $("button.navbar-toggle").click(function(){
    	$(".navbar").toggleClass("blueBackground", 200);
		});
});

$(document).ready(function(){
    $(".page-scroll").click(function(){
    	$("#bs-example-navbar-collapse-1").toggleClass("in", 200);
		});
});