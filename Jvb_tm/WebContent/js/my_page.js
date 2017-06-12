/**
 * 
 */


$(document).ready(function() {

//	$(".btn-pref .btn_mypage").click(function() {
////		alert("야야야야");
//		alert($(this).attr('class'))
//		$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
//		// $(".tab").addClass("active"); // instead of this do the below 
//		alert($(this).attr('class'))
//		$(this).removeClass("btn-default").addClass("btn-primary");
//		alert($(this).attr('class'))
//	});
//	

	

	
	
	
	
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

	
})
