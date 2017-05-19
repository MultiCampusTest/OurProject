function moreList() {
		alert($(this).attr('id'));
	//     $.ajax({
	//         url : 'moreMessageList',
	//         type : "POST",
	//         cache : false,
	//         dataType: 'json',
	//         data : 'count'+,
	//         success : function(data){
	//             //console.log(data);
	//             var content="";
	//             for(var i=0; i<data.hashMapList.length; i++){
	//                 content +=
	//                 "<tr>"+
	//                     "<td>"+data.hashMapList[i].area+"</td>"+
	//                     "<td>"+data.hashMapList[i].name+"</td>"+
	//                     "<td>"+data.hashMapList[i].gubun+"</td>"+
	//                     "<td>"+data.hashMapList[i].cnt+"</td>"+
	//                 "</tr>";
	//             }
	//             content+="<tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>";
	//             $('#addbtn').remove();//remove btn
	//             $(content).appendTo("#table");
	//         }, error:function(request,status,error){
	//             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	//            }
	//     });
	}
	;




	// 이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img_change').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}











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
	
	
	
	
	
	
	$('.more_msg_list').on('click', function() {
		alert($(this).attr('id'));
		var id = $(this).attr('id');
		var count = parseInt(id.substr(6));
		alert(count);
		var update_count = count + 5;
		var new_count = parseInt(update_count);
		alert(update_count);

		$.ajax({
			url : 'moreMessageList.do',
			type : "POST",
			dataType : 'json',
			data : 'count=' + new_count,
			success : function(data) {
				//console.log(data);
				// 		             var content="";
				// 		             for(var i=0; i<data.hashMapList.length; i++){
				// 		                 content +=
				// 		                 "<tr>"+
				// 		                     "<td>"+data.hashMapList[i].area+"</td>"+
				// 		                     "<td>"+data.hashMapList[i].name+"</td>"+
				// 		                     "<td>"+data.hashMapList[i].gubun+"</td>"+
				// 		                     "<td>"+data.hashMapList[i].cnt+"</td>"+
				// 		                 "</tr>";
				// 		             }
				// 		             content+="<tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>";
				// 		             $('#addbtn').remove();//remove btn
				// 		             $(content).appendTo("#table");
				alert("성공?");
			},
			error : function() {
				// 		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("에러다?");
			}
		});

	})




//		$('#pwd').on('keyup', function() {
//			// 			alert($(this).val().length);
//			if ($(this).val().length < 8) {
//				// 				alert("비밀번호는 8자리 이상이어야 합니다.");
//				$('#pwdCorrectly').html("비밀번호는 8자리 이상이어야 합니다.");

//			} else {
//				$('#pwdCorrectly').html("적합한 비밀번호입니다.");
//			}

//		});

//		$('#pwdChk').on('keyup', function() {
//			var pwd = $('#pwd').val();
//			// 			alert(pwd);
//			// 			alert($(this).val());
//			if ($(this).val() != pwd) {
//				$('#checkPwdCorrectly').html("reenter password");
//			}
//			if ($(this).val() == pwd) {
//				$('#checkPwdCorrectly').html("");
//			}
//		});
	
	
	
//		$('.change_profile_btn').on('click', function(){
//			var pwd=$('#pwd')).val();
//			var checkPwd=$('#checkPwd').val();
//			if(pwd!=checkPwd){
//				alert("비밀번호 다르다고");
//			}
//			else{
//				alert("비밀번호 같음");
//			}

//		})



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





	$('.sender').on('click', function() {
		var id = $(this).attr('id');
		var result = $('#name' + id).html();
		// 				      alert(result);
		var msg_list = $('.msg_list').html();


		$.ajax({
			url : 'messageOneList.do',
			type : 'POST',
			data : 'msg_send_userid=' + result,
			dataType : 'json',
			success : function(data) {
				$('#msg_box_selectOne' + id).text('MessageList');


				for (var i = 0; i < data.length; i++) {

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
	});


	$('.send_msg_button').on('click', function() {
		var id = $(this).attr('id');
		// 		alert(id);
		var realid = id.substring(10);
		// 		alert(realid);
		var result = $('#name' + realid).html();
		// 		alert(result);
		var send_msg_contents = $('#send_msg_contents' + realid).val();
		// 		alert(send_msg_contents);
		var send_time = new Date();

		$.ajax({
			url : 'sendMessage.do',
			type : 'POST',
			data : 'msg_send_userid=' + result + '&msg_contents=' + send_msg_contents,
			dataType : 'json',
			success : function(data) {

				$('#send_msg_contents' + realid).val("");
				// 	            	$('#msg_box_selectOne'+realid).text('MessageList');

				var add_Label = '<div class="msg_list message_panel message_out container-fluid">' + send_msg_contents + '<label class="msg_time container-fluid">' + send_time + '</label></div>';
				$('#msg_box_selectOne' + realid).append('<br>');
				$('#msg_box_selectOne' + realid).append(add_Label);

				// 	   	            $('#msg_list'+realid).append('<br>');
				// 	   	            $('#msg_list'+realid).append(send_msg_contents);

			},
			error : function() {
				alert('에러 ');
			// 	               $('#send_msg_contents'+realid).val("");
			}
		});
	});




	$('.matcing_accept_answer_yes').on('click', function() {
		var m_array = new Array();
		var id = $(this).attr('id');
		m_array = id.split('_');
		var realid = m_array[0];
		//	          alert(realid);
		var board_idx = m_array[1];
		//	                alert(board_idx);
		//       alert(id);
		var board_title = m_array[2];
//			alert(board_title);
		var matching_date = m_array[3];
		//	          alert(matching_date);
		var res_mchList_size = m_array[4];
//				          alert(res_mchList_size);
		var responseValue = $(this).val();
		//       alert(responseValue);




		var add_section = '<div class="add_mch_section container-fluid">'
			+ '<div class="add_accept col-lg-3" id="${i.index }"><div class="add_img col-md-4">'
			+ '<img class="userid_img" src="imageProfileView.do?img_code='+realid+'" width="50px" height="50px">'
			+ '</div><div class="add_mch_g_userid col-md-8">'
			+ '<label class="add_mch_g_userid container-fluid control-label">' + realid + '</label></div></div>'
			+ '<div class="add_accepted_matching" id="accepted_matching_${i.index }">'
			+ '<div class="accepted_mch_contents col-lg-7"><a href="guideView.do?boardIdx=' + board_title + '">'
			+ '<label class="add_title container-fluid control-label">해당게시글 번호' + board_title + '</label></a></div>'
			+ '<div class="add_date col-lg-2">'
			+ '<label class="container-fluid control-label">' + matching_date + '</label></div></div></div><br>';
//				guideView.do?boardIdx=${res_mch_List.b_idx }



		$.ajax({
			url : 'matchingHolding.do',
			type : 'POST',
			data : 'b_idx=' + board_title + '&mch_g_userid=' + realid,
			dataType : 'json',
			success : function(data) {

				alert('매칭 성공');
				//	                   alert(data.res_matchingListSize);
				$('.add_matching_section').append(add_section);
				//	                   $('#mathing_section' + board_idx+'_'+board_title).remove();
				$('#mathing_section' + board_idx + '_' + board_title).remove();
				
				
//					for (var i = 0; i < res_mchList_size; i++) {
//						$('#mathing_section' + i + '_' + board_title).remove();
//						$('#br_mathing_section' + i + '_' + board_title).remove();
//					}
				//	                   $('#delete_matching_section' + board_title).remove();


			},
			error : function() {
				alert('에러 ');
			}
		});



	});


	$('.matcing_accept_answer_no').on('click', function() {

		var m_array = new Array();
		var id = $(this).attr('id');
		m_array = id.split('_');
		var realid = m_array[0];
		var board_idx = m_array[1];
		var board_title = m_array[2];
		var matching_date = m_array[3];
		var responseValue = $(this).val();


		$.ajax({
			url : 'matchingReject.do',
			type : 'POST',
			data : 'b_idx=' + board_title + '&mch_g_userid=' + realid,
			dataType : 'json',
			success : function(data) {

				alert('매칭 거절');
				$('#mathing_section' + board_idx + '_' + board_title).remove();
				$('#br_mathing_section' + board_idx + '_' + board_title).remove();


			},
			error : function() {
				alert('매칭 거절 에러 ');
			}
		});

	});
	
	
	
	
	
	
	
	
	
	$('.guide_matcing_accept_answer_yes').on('click', function() {
		var m_array = new Array();
		var id = $(this).attr('id');
		m_array = id.split('_');
		var realid = m_array[0];
//				          alert(realid);
		var board_idx = m_array[1];
		//	                alert(board_idx);
		//       alert(id);
		var board_title = m_array[2];
//			alert(board_title);
		var matching_date = m_array[3];
		//	          alert(matching_date);
		var res_mchList_size = m_array[4];
//			          alert(res_mchList_size);
		var responseValue = $(this).val();
		//       alert(responseValue);




		var add_section = '<div class="add_mch_section container-fluid">'
			+ '<div class="add_accept col-lg-3" id="${i.index }"><div class="add_img col-md-4">'
			+ '<img class="userid_img" src="imageProfileView.do?img_code='+realid+'" width="50px" height="50px">'
			+ '</div><div class="add_mch_g_userid col-md-8">'
			+ '<label class="add_mch_g_userid container-fluid control-label">' + realid + '</label></div></div>'
			+ '<div class="add_accepted_matching" id="accepted_matching_${i.index }">'
			+ '<div class="accepted_mch_contents col-lg-7"><a href="guideView.do?boardIdx=' + board_title + '">'
			+ '<label class="add_title container-fluid control-label">해당게시글 번호' + board_title + '</label></a></div>'
			+ '<div class="add_date col-lg-2">'
			+ '<label class="container-fluid control-label">' + matching_date + '</label></div></div></div><br>';
//				guideView.do?boardIdx=${res_mch_List.b_idx }



		$.ajax({
			url : 'matchingSuccess.do',
			type : 'POST',
			data : 'b_idx=' + board_title + '&mch_g_userid=' + realid,
			dataType : 'json',
			success : function(data) {

				alert('매칭 성공');
				//	                   alert(data.res_matchingListSize);
				$('.guide_add_matching_section').append(add_section);
				//	                   $('#mathing_section' + board_idx+'_'+board_title).remove();
				for (var i = 0; i < res_mchList_size; i++) {
					$('#guide_mathing_section' + i + '_' + board_title).remove();
					$('#guide_br_mathing_section' + i + '_' + board_title).remove();
				}
				//	                   $('#delete_matching_section' + board_title).remove();


			},
			error : function() {
				alert('에러 ');
			}
		});



	});


	$('.guide_matcing_accept_answer_no').on('click', function() {

		var m_array = new Array();
		var id = $(this).attr('id');
		m_array = id.split('_');
		var realid = m_array[0];
		var board_idx = m_array[1];
		var board_title = m_array[2];
		var matching_date = m_array[3];
		var responseValue = $(this).val();


		$.ajax({
			url : 'matchingReject.do',
			type : 'POST',
			data : 'b_idx=' + board_title + '&mch_g_userid=' + realid,
			dataType : 'json',
			success : function(data) {

				alert('매칭 거절');
				$('#mathing_section' + board_idx + '_' + board_title).remove();
				$('#br_mathing_section' + board_idx + '_' + board_title).remove();


			},
			error : function() {
				alert('매칭 거절 에러 ');
			}
		});

	});
		
	$('#deleteBtn').click(function(){
		if($('#mypage_pwd').val() == '')
		{
			$('#mypage_pwd').focus();
			$('#mypage_pwd_msg').html('<font color="#FF605A">enter password</font>');
			return false;
		} 
		else
		{
			var email = $('#mypage_userid').val();
			var password = $('#mypage_pwd').val();
			$.ajax({
				url : 'removeMember.do',
				type : 'POST',
				data : { userid : email, pwd : password },
				dataType : 'json',
				success : function(data) {
					if(data.result) {
						alert('Thank you for that time.');
						location.href="main.do";
					} else {
						$('#mypage_pwd').val('');
						alert('password error');
					}
				}, error : function(data) {
					alert('data error');
				}
			});
		}
		
	});
	
	
	
	
	
	
	//성
			$('#firstName').focus(function(){
				if($(this).val() == '') {
					$('#fname_msg').html('<font color="#FF605A">enter first name</font>');
				}
			}).blur(function(){
				if($(this).val() != '') {
					$('#fname_msg').text('');
				}
			}).keyup(function(){
				if($(this).val() == '') {
					$('#fname_msg').html('<font color="#FF605A">enter first name</font>');
				} else {				
					$('#fname_msg').text('');
				}
			});
			
			//이름
			$('#lastName').focus(function(){
				if($('#lastName').val() == '') {
					$('#lname_msg').html('<font color="#FF605A">enter last name</font>');
				}
			}).blur(function(){
				if($('#lastName').val() != '') {
					$('#lname_msg').text('');
				}
			}).keyup(function(){
				if($('#lastName').val() == '') {
					$('#lname_msg').html('<font color="#FF605A">enter last name</font>');
				} else {				
					$('#lname_msg').text('');
				}
			});
			
			//비밀번호
			 var regPass = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		      $('input[type=password]').focus(function () {
		         if($('#pwd').val() == '' || $('#pwdChk').val() == '') {
		            $('#pwd_msg').html('<font color="#FF605A">password can be 3 combinations of upper, lower, number and special key</font>');
		         } else if($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8) {
		            $('#pwd_msg').html('<font color="#FF605A">make password over 8 size</font>');
		         } else if(!regPass.test($('#pwd').val()) || !regPass.test($('#pwdChk').val())) {
		            $('#pwd_msg').html('<font color="#FF605A">combinate at least 3 types of upper, lower, number, special key</font>');
		         }
		      }).blur(function() {
		         if($('#pwd').val() == '' || $('#pwdChk').val() == '') {
		            $('#pwd_msg').html('<font color="#FF605A">password can be 3 combinations of upper, lower, number and special key</font>');
		         } else if($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8) {
		            $('#pwd_msg').html('<font color="#FF605A">make password over 8 size</font>');
		         } else if(!regPass.test($('#pwd').val()) || !regPass.test($('#pwdChk').val())) {
		            $('#pwd_msg').html('<font color="#FF605A">combinate at least 3 types of upper, lower, number, special key</font>');
		         } else if($('#pwd').val() == $('#pwdChk').val()) {
		            $('#pwd_msg').text('');
		         }
		      }).keyup(function(){
		         if($('#pwd').val() == '' || $('#pwdChk').val() == '') {
		            $('#pwd_msg').html('<font color="#FF605A">password can be 3 combinations of upper, lower, number and special key</font>');
		         } else if($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8) {
		            $('#pwd_msg').html('<font color="#FF605A">make password over 8 size</font>');
		         } else if($('#pwd').val() != $('#pwdChk').val()) {
		            $('#pwd_msg').html('<font color="#FF605A">not matched</font>');
		         } else if(!regPass.test($('#pwd').val()) || !regPass.test($('#pwdChk').val())) {
		            $('#pwd_msg').html('<font color="#FF605A">combinate at least 3 types of upper, lower, number, special key</font>');
		         } else {
		            $('#pwd_msg').text('');
		         }         
		      });
			
			//생년월일
			$('#birthday').focus(function(){
				if($(this).val() == '') {
					$('#birthday_msg').html('<font color="#FF605A">select birthday</font>');
				}
			}).blur(function(){
				if($(this).val() != '') {
					$('#birthday_msg').text('');
				}
			});
			
			//성별
			$('#gender').focus(function(){
				if($(this).val() == 'list' || $(this).val() == 'list') {
					$('#gender_msg').html('<font color="#FF605A">select gender</font>');
				}
			}).blur(function(){
				if($(this).val() == 'list') {
					$('#gender_msg').html('<font color="#FF605A">select gender</font>');
				} else {
					$('#gender_msg').text('');				
				}
			});
			
			//국가
			$('#country').focus(function(){
				if($(this).val() == 'list' || $(this).val() == 'list') {
					$('#country_msg').html('<font color="#FF605A">select country</font>');
				}
			}).blur(function(){
				if($(this).val() == 'list') {
					$('#country_msg').html('<font color="#FF605A">select country</font>');
				} else {
					$('#country_msg').text('');
				}
			});
			
			
			
			
			$('#change_profile_btn').click(function(){
				var confirm = false;
				if($('#firstName').val() == '')
					$('#firstName').focus();
				else if($('#lastName').val() == '')
					$('#lastName').focus();
				else if($('#pwd').val() == '')
					$('#pwd').focus();
				else if($('#pwd').val() == '' || 
						$('#pwd').val() != $('#pwdChk').val() || 
						($('#pwd').val().length < 8 || $('#pwdChk').val().length < 8))
					$('#pwdChk').focus();
				
				else if($('#country').val() == 'list')
					$('#country').focus();
				
				else
					confirm = true;
				return confirm;
			});
	
	
});


