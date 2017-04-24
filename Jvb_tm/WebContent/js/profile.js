$(document).ready(function() {
	
	$(".btn-pref .btn").click(function() {
		$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
		// $(".tab").addClass("active"); // instead of this do the below 
		$(this).removeClass("btn-default").addClass("btn-primary");
	});
	
	
	
//	
	$('.msg_contents_box').hide();//on cache par defaut les messages
	$('.sender').click(function() {
		var id = $(this).attr('id');
		var condition=$('#msg_condition_'+id).attr('value');
		
		if(condition==1){
			$('#message_'+id).hide();
			$('#msg_box_'+id).show();
			$('#msg_condition_'+id).attr('value', '2');
		}
		if(condition==2){
			$('#message_'+id).show();
			$('#msg_box_'+id).hide();
			$('#msg_condition_'+id).attr('value', '1');
		}    
	}); 
	
	
	
	
	
	
	$('.matching_box').hide();//on cache par defaut les messages
	$('.not_accept').click(function() {
		var id = $(this).attr('id');
		var condition=$('#req_match_condition_'+id).attr('value');
		
		if(condition==1){
			$('#req_matching_'+id).hide();
			$('#matching_box_'+id).show();
			$('#req_match_condition_'+id).attr('value', '2');
		}
		if(condition==2){
			$('#req_matching_'+id).show();
			$('#matching_box_'+id).hide();
			$('#req_match_condition_'+id).attr('value', '1');
		}    
	}); 
	
});


