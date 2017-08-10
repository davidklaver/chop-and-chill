$(document).ready(function(){
	$('input.siCheckBox').on('change', function (e) {
		console.log("check");
	    if ($('input.siCheckBox:checked').length > 7) {
        $(this).prop('checked', false);
        alert("You've already chosen seven ingredients");
	    }
	});
});
