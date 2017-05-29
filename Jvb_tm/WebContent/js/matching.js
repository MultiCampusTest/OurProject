/**
 * 
 */


$(document).ready(function() {
	
	
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
				$('#guide_mathing_section' + board_idx + '_' + board_title).remove();
				$('#guide_br_mathing_section' + board_idx + '_' + board_title).remove();


			},
			error : function() {
				alert('매칭 거절 에러 ');
			}
		});

	});
	
})