/**
 * 
 */





$(document).ready(function() {
	
	
	$('.msg_contents_box').hide();//on cache par defaut les messages

	
	
		$('.sender').on('click', function() {
			var id = $(this).attr('id');
			var result = $('#name' + id).html();
			// 				      alert(result);
			var msg_list = $('.msg_list').html();
			var condition=$('#msg_condition_'+id).attr('value');

			
//			alert(result);

			$.ajax({
				url : 'messageOneList.do',
				type : 'POST',
				data : 'msg_send_userid=' + result,
				dataType : 'json',
				success : function(data) {
// 					alert(data.length);
					$('#msg_box_selectOne' + id).text('MessageList');


					for (var i = 0; i <= data.length; i++) {

						//alert(data[i].msg_send_userid);


						if (data[i].msg_send_userid == result) {
							var add_Label = '<div><div class="msg_list message_panel message_in container-fluid">'
								+ data[i].msg_contents + '<div class="msg_time container-fluid">'
								+ data[i].msg_date + '</div></div></div>';

							$('#msg_box_selectOne' + id).append('<br>');
							$('#msg_box_selectOne' + id).append(add_Label);
						} else {
							var add_Label = '<div><div class="msg_list message_panel message_out container-fluid">'
								+ data[i].msg_contents + '<div class="msg_time container-fluid">'
								+ data[i].msg_date + '</div></div></div>';
							$('#msg_box_selectOne' + id).append('<br>');
							$('#msg_box_selectOne' + id).append(add_Label);
						}

					}
				},
				error : function() {
					alert('에러 ');
				}
			});
			
			
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
		
		
		
		
		
		
		
		
		
		$('.sending_msg_form').on('keyup', function() {

			var id = $(this).attr('id');
			// 			alert(id);
			var realid = id.substr(17);
			// 			alert(realid);
			// 			alert('애');
			var inputLength = $(this).val().length;
			// 			alert(inputLength);
			var remain = 1000 - inputLength;
			$('#remain_sending_msg' + realid).html(remain + " characters remaining");
			if (inputLength > 1000) {
				$(this).val($(this).val().substring(0, 1000));
			}

		});
		
		
		
		
		
		
//		$('.send_msg_button').on('click', function() {
//			var id = $(this).attr('id');
//			// 		alert(id);
//			var realid = id.substring(10);
//			// 		alert(realid);
//			var result = $('#name' + realid).html();
//			// 		alert(result);
//			var send_msg_contents = $('#send_msg_contents' + realid).val();
//			// 		alert(send_msg_contents);
//			var send_time = new Date();
//
//			$.ajax({
//				url : 'sendMessage.do',
//				type : 'POST',
//				data : 'msg_send_userid=' + result + '&msg_contents=' + send_msg_contents,
//				dataType : 'json',
//				success : function(data) {
//
//					$('#send_msg_contents' + realid).val("");
//					// 	            	$('#msg_box_selectOne'+realid).text('MessageList');
//
//					var add_Label = '<div class="msg_list message_panel message_out container-fluid">' + send_msg_contents + '<label class="msg_time container-fluid">' + send_time + '</label></div>';
//					$('#msg_box_selectOne' + realid).append('<br>');
//					$('#msg_box_selectOne' + realid).append(add_Label);
//
//					// 	   	            $('#msg_list'+realid).append('<br>');
//					// 	   	            $('#msg_list'+realid).append(send_msg_contents);
//					$('#message').click();
//
//				},
//				error : function() {
//					alert('에러 ');
//				// 	               $('#send_msg_contents'+realid).val("");
//				}
//			});
//		});
		
		
		
		$('.send_msg_button').click(function(){
			var confirm = false;
			var id=$(this).attr('id');
			var realid=id.substring(10);
//			alert(id);
//			alert(realid);
			
			if($('#send_msg_contents'+realid).val() == ''){
				alert("메시지를 입력해주세요.")
				$('#send_msg_contents'+realid).focus();
				
			}
			
			else
				confirm = true;
			return confirm;
		});
		
		
		
		
	})