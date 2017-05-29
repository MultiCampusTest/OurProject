/**
 * 
 */


$(document).ready(function() {

	$(".btn-pref .btn").click(function() {
//		alert("야야야야");
//		alert($(this).attr('class'))
		$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
		// $(".tab").addClass("active"); // instead of this do the below 
//		alert($(this).attr('class'))
		$(this).removeClass("btn-default").addClass("btn-primary");
//		alert($(this).attr('class'))
	});
	
})
