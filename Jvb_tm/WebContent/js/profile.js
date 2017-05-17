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
		
//		var params={msg_send_userid : ${messageList.msg_send_userid}};
//		
//		$.ajax({
//	         url : 'messageOneList.do',
//	         dataType : 'json',
//	         type: 'post',
//	         
//	         data : params,
//	         
//	         success : function(data){
//	            
//	            var list_size = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""));
//	            
//	            for(var i=1; i <= list_size; i++){
//	               if($('#category'+i).val()==""){
//	                  $('#category'+i).val(data.category).prop("selected", true);
//	                  $('#detail'+i).val(data.detail);
//	                  $('#price'+i).val(data.price);
//	                  break;
//	               }
//	            }
//	         }
//	      });
		
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
	
	
	$('.guide_matching_box').hide();//on cache par defaut les messages
	$('.guide_not_accept').click(function() {
		var id = $(this).attr('id');
		var condition=$('#guide_req_match_condition_'+id).attr('value');
		
		if(condition==1){
			$('#guide_req_matching_'+id).hide();
			$('#guide_matching_box_'+id).show();
			$('#guide_req_match_condition_'+id).attr('value', '2');
		}
		if(condition==2){
			$('#guide_req_matching_'+id).show();
			$('#guide_matching_box_'+id).hide();
			$('#guide_req_match_condition_'+id).attr('value', '1');
		}    
	}); 
	
	
	
	
	
	
	
	
	
//	   $('#paging_msg_'+1).attr('class', 'paging active message');
//	   $('#paging_mch_'+1).attr('class', 'paging active matching');
//	   $('#paging_not_'+1).attr('class', 'paging active notice');
//	   
//	   $('.message').click(function(){
//	      var id=$(this).attr('id');
//	      var realid=id.substring(7);
//	      $('.message').removeClass("active").addClass("default");
//	      $('#paging_'+realid).removeClass("default").addClass("active");
//	      
//	   });
//	   
//	   $('.matching').click(function(){
//	      var id=$(this).attr('id');
//	      var realid=id.substring(7);
//	      $('.matching').removeClass("active").addClass("default");
//	      $('#paging_'+realid).removeClass("default").addClass("active");
//	      
//	   });
//	   
//	   $('.board-paging').click(function(){
//	      var id=$(this).attr('id');
//	      var realid=id.substring(7);
//	      $('#paging_'+realid).attr('class','paging active');
//	      
//	   });
	
	
	
	
	
});


