<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--   커스텀 스크립트 -->
<script src="js/profile.js"></script>
<!--   커스텀 CSS -->
<link href="css/profile.css" rel="stylesheet">
<link rel="stylesheet" href="css/review.css">

<title>Travel Maker</title>

<style type="text/css">
</style>

<script type="text/javascript">


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




		$('#pwd').on('keyup', function() {
			// 			alert($(this).val().length);
			if ($(this).val().length < 8) {
				// 				alert("비밀번호는 8자리 이상이어야 합니다.");
				$('#pwdCorrectly').html("비밀번호는 8자리 이상이어야 합니다.");

			} else {
				$('#pwdCorrectly').html("적합한 비밀번호입니다.");
			}

		});

		$('#checkPwd').on('keyup', function() {
			var pwd = $('#pwd').val();
			// 			alert(pwd);
			// 			alert($(this).val());
			if ($(this).val() != pwd) {
				$('#checkPwdCorrectly').html("reenter password");
			}
			if ($(this).val() == pwd) {
				$('#checkPwdCorrectly').html("");
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
					alert('에러 개새끼야');
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
					alert('에러 개새끼야');
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
			alert(board_title);
			var matching_date = m_array[3];
			//	          alert(matching_date);
			var res_mchList_size = m_array[4];
				          alert(res_mchList_size);
			var responseValue = $(this).val();
			//       alert(responseValue);




			var add_section = '<div class="add_mch_section container-fluid">'
				+ '<div class="add_accept col-lg-3" id="${i.index }"><div class="add_img col-md-4">'
				+ '<img class="userid_img" src="img/profile.jpg" width="50px" height="50px">'
				+ '</div><div class="add_mch_g_userid col-md-8">'
				+ '<label class="add_mch_g_userid container-fluid control-label">' + realid + '</label></div></div>'
				+ '<div class="add_accepted_matching" id="accepted_matching_${i.index }">'
				+ '<div class="accepted_mch_contents col-lg-7"><a href="guideView.do?boardIdx=' + board_title + '">'
				+ '<label class="add_title container-fluid control-label">해당게시글 번호' + board_title + '</label></a></div>'
				+ '<div class="add_date col-lg-2">'
				+ '<label class="container-fluid control-label">' + matching_date + '</label></div></div></div><br>';
// 				guideView.do?boardIdx=${res_mch_List.b_idx }



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
					for (var i = 0; i < res_mchList_size; i++) {
						$('#mathing_section' + i + '_' + board_title).remove();
						$('#br_mathing_section' + i + '_' + board_title).remove();
					}
					//	                   $('#delete_matching_section' + board_title).remove();


				},
				error : function() {
					alert('에러 개새끼야');
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
					alert('매칭 거절 에러 개새끼야');
				}
			});

		});
		
		
		
		
		
		
		
		
		
		$('.guide_matcing_accept_answer_yes').on('click', function() {
			var m_array = new Array();
			var id = $(this).attr('id');
			m_array = id.split('_');
			var realid = m_array[0];
				          alert(realid);
			var board_idx = m_array[1];
			//	                alert(board_idx);
			//       alert(id);
			var board_title = m_array[2];
			alert(board_title);
			var matching_date = m_array[3];
			//	          alert(matching_date);
			var res_mchList_size = m_array[4];
				          alert(res_mchList_size);
			var responseValue = $(this).val();
			//       alert(responseValue);




			var add_section = '<div class="add_mch_section container-fluid">'
				+ '<div class="add_accept col-lg-3" id="${i.index }"><div class="add_img col-md-4">'
				+ '<img class="userid_img" src="img/profile.jpg" width="50px" height="50px">'
				+ '</div><div class="add_mch_g_userid col-md-8">'
				+ '<label class="add_mch_g_userid container-fluid control-label">' + realid + '</label></div></div>'
				+ '<div class="add_accepted_matching" id="accepted_matching_${i.index }">'
				+ '<div class="accepted_mch_contents col-lg-7"><a href="guideView.do?boardIdx=' + board_title + '">'
				+ '<label class="add_title container-fluid control-label">해당게시글 번호' + board_title + '</label></a></div>'
				+ '<div class="add_date col-lg-2">'
				+ '<label class="container-fluid control-label">' + matching_date + '</label></div></div></div><br>';
// 				guideView.do?boardIdx=${res_mch_List.b_idx }



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
					alert('에러 개새끼야');
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
					alert('매칭 거절 에러 개새끼야');
				}
			});

		});
		

	})
</script>



</head>
<body>


	<div class="container-fluid">
		<div class="col-lg-12 col-sm-12">
			<!--          <div class="card hovercard"> -->
			<!--             <div class="card-background"> -->
			<!--                <img class="card-bkimg" alt="" src="img/header.jpg"> -->
			<!--             </div> -->
			<!--             <div class="useravatar"> -->
			<!--                <img alt="" src="img/header.jpg"> -->
			<!--             </div> -->
			<!--             <div class="card-info"> -->
			<%--                <span class="card-title">${member.firstName} + ${member.lastName}</span> --%>

			<!--             </div> -->
			<!--          </div> -->
			<div class="btn-pref btn-group btn-group-justified btn-group-lg"
				role="group" aria-label="...">
				<div class="btn-group" role="group">
					<button type="button" id="myPage" class="btn btn-primary"
						href="#tab1" data-toggle="tab">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<div class="hidden-xs">My Profile</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="update" class="btn btn-default"
						href="#tab2" data-toggle="tab">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<div class="hidden-xs">Edit Profile</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="message" class="btn btn-default"
						href="#tab3" data-toggle="tab">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						<div class="hidden-xs">Message</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="matching" class="btn btn-default"
						href="#tab4" data-toggle="tab">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						<div class="hidden-xs">Guide Matching</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="matching" class="btn btn-default"
						href="#tab5" data-toggle="tab">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						<div class="hidden-xs">Travel Matching</div>
					</button>
				</div>
			</div>


			<div class="well">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1">
						<div class="container">
							<h1 class="page-header">Your Profile</h1>
							<div class="row">
								<!-- left column -->
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="text-center">
										<c:if test="${userImage.img_idx==null }">
											<img src="img/profile/user.png"
												class="avatar img-circle img-thumbnail profile_img"
												alt="avatar">
										</c:if>
										<c:if test="${userImage.img_idx!=null }">
											<img src="imageView.do?img_idx=${userImage.img_idx }"
												class="avatar img-circle img-thumbnail profile_img"
												alt="avatar">
										</c:if>
										<h3>${member.userid }</h3>
									</div>
								</div>

								<!-- right column -->
								<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
									<h3>Personal info</h3>
									<form class="form-horizontal" role="form" action="#">
										<div class="form-group">
											<label class="col-lg-3 control-label">First name:</label>
											<div class="col-lg-8">
												<pre class="form-control">${member.firstName}</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Last name:</label>
											<div class="col-lg-8">
												<pre class="form-control">${member.lastName }</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Contury:</label>
											<div class="col-lg-8">
												<pre class="form-control">${member.country}</pre>
											</div>
										</div>
										<!--                               <div class="form-group"> -->
										<!--                                  <label class="col-lg-3 control-label">Email:</label> -->
										<!--                                  <div class="col-lg-8"> -->
										<%--                                     <pre class="form-control">${member.email }</pre> --%>
										<!--                                  </div> -->
										<!--                               </div> -->
										<div class="form-group">
											<label class="col-lg-3 control-label">Birth:</label>
											<div class="col-lg-8">
												<pre class="form-control">${member.birthday }</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Username:</label>
											<div class="col-md-8">
												<pre class="form-control">${member.userid }</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">introduce:</label>
											<div class="col-md-8">
												<pre class="form-control">${member.introduce }</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-8">
												<input type="submit" class="btn btn-primary" value="unsubscribe">
												<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Delete Account</button>
												<div class="modal fade" id="myModal" role="dialog">
    												<div class="modal-dialog modal-sm">
      													<div class="modal-content">
        													<div class="modal-header">
          														<button type="button" class="close" data-dismiss="modal">&times;</button>
          														<h4 class="modal-title">Delete your account</h4>
        													</div>
        													<div class="modal-body">
         						 								<p>
         						 									<div class="form-group">
         						 								<form action="removeMember.do">
         						 										<input type="hidden" class="form-control input-lg" name="userid" value="${userid}">
         						 										<input type="password" class="form-control input-lg" name="pwd" id="pwd">
																	</div>
         						 								</p>
        													</div>
        													<div class="modal-footer">
        														<button type="submit" class="btn btn-default" data-dismiss="modal">Confirm</button>
          														<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
																</form>
        													</div>
     													</div>
    												</div>
  												</div>
  												
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade in" id="tab2">
						<div class="container">
							<h1 class="page-header">Edit Profile</h1>
							<div class="row">
								<!-- left column -->
								<form class="form-horizontal" role="form"
									action="updateMember.do" method="POST"
									enctype="multipart/form-data">
									<div class="row col-md-4 col-sm-6 col-xs-12">
										<div class="text-center">
											<!--                               <img src="http://lorempixel.com/200/200/people/9/" -->
											<!--                                  class="avatar img-circle img-thumbnail" alt="avatar"> -->
											<c:if test="${userImage.img_path==null }">
												<img src="img/profile/user.png"
													class="avatar img-circle img-thumbnail profile_img"
													alt="avatar">
											</c:if>
											<c:if test="${userImage.img_idx!=null }">
												<img src="imageView.do?img_idx=${userImage.img_idx }"
													id="img_change"
													class="avatar img-circle img-thumbnail profile_img"
													alt="avatar">
											</c:if>
											<h6>Upload a different photo...</h6>
										</div>
										<div class="text-center filebox">
											<label for="idtestfirst" id="label" class="label">choose
												file</label> <input type="file" id="idtestfirst" name="file"
												class="ex_file" onchange="readURL(this)">
										</div>
									</div>
									<!-- edit form column -->
									<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
										<!--                            <div class="alert alert-info alert-dismissable"> -->
										<!--                               <a class="panel-close close" data-dismiss="alert">×</a> <i -->
										<!--                                  class="fa fa-coffee"></i> This is an <strong>.alert</strong>. -->
										<!--                               Use this to show important messages to the user. -->
										<!--                            </div> -->
										<h3>Personal info</h3>

										<div class="form-group">
											<label class="col-lg-3 control-label">First name:</label>
											<div class="col-lg-8">
												<input class="form-control" value="${member.firstName}"
													name="firstName" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Last name:</label>
											<div class="col-lg-8">
												<input class="form-control" value="${member.lastName }"
													name="lastName" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Contury:</label>
											<div class="col-lg-8">
												<div class="ui-select">
													<select id="user_time_zone" class="form-control"
														name="country">
														<option value="country">Country *</option>
														<option selected="${member.country }">${member.country }</option>
														<optgroup label="A"></optgroup>
														<option value="Afghanistan">Afghanistan</option>
														<option value="Albania">Albania</option>
														<option value="Algeria">Algeria</option>
														<option value="American Samoa">American Samoa</option>
														<option value="Andorra">Andorra</option>
														<option value="Angola">Angola</option>
														<option value="Anguilla">Anguilla</option>
														<option value="Antigua and Barbuda">Antigua and Barbuda</option>
														<option value="Argentina">Argentina</option>
														<option value="Armenia">Armenia</option>
														<option value="Aruba">Aruba</option>
														<option value="Australia">Australia</option>
														<option value="Austria">Austria</option>
														<option value="Azerbaijan">Azerbaijan</option>
														<optgroup label="B"></optgroup>
														<option value="Bahamas">Bahamas</option>
														<option value="Bahrain">Bahrain</option>
														<option value="Bangladesh">Bangladesh</option>
														<option value="Barbados">Barbados</option>
														<option value="Belarus">Belarus</option>
														<option value="Belgium">Belgium</option>
														<option value="Belize">Belize</option>
														<option value="Benin">Benin</option>
														<option value="Bermuda">Bermuda</option>
														<option value="Bhutan">Bhutan</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
														<option value="BW">Botswana</option>
														<option value="Brazil">Brazil</option>
														<option value="British Virgin Islands">British Virgin Islands</option>
														<option value="Brunei">Brunei</option>
														<option value="Bulgaria">Bulgaria</option>
														<option value="Burking Faso">Burkina Faso</option>
														<option value="Burundi">Burundi</option>
														<optgroup label="C"></optgroup>
														<option value="Cambodia">Cambodia</option>
														<option value="Cameroon">Cameroon</option>
														<option value="Canada">Canada</option>
														<option value="Cape Verde">Cape Verde</option>
														<option value="Cayman Islands">Cayman Islands</option>
														<option value="Central African Republic">Central African Republic</option>
														<option value="Chad">Chad</option>
														<option value="Chile">Chile</option>
														<option value="China">China</option>
														<option value="Cocos">Cocos Islands</option>
														<option value="Colombia">Colombia</option>
														<option value="Comoros">Comoros</option>
														<option value="Cook Islands">Cook Islands</option>
														<option value="Costa Rica">Costa Rica</option>
														<option value="Croatia">Croatia</option>
														<option value="Cuba">Cuba</option>
														<option value="Cyprus">Cyprus</option>
														<option value="Czech Republic">Czech Republic</option>
														<optgroup label="D"></optgroup>
														<option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
														<option value="Denmark">Denmark</option>
														<option value="Djibouti">Djibouti</option>
														<option value="Dominica">Dominica</option>
														<option value="Dominican Republic">Dominican Republic</option>
														<optgroup label="E"></optgroup>
														<option value="East Timor">East Timor</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Egypt">Egypt</option>
														<option value="El Salvador">El Salvador</option>
														<option value="Equatorial Guinea">Equatorial Guinea</option>
														<option value="Eritrea">Eritrea</option>
														<option value="Estonia">Estonia</option>
														<option value="Ethiopia">Ethiopia</option>
														<optgroup label="F"></optgroup>
														<option value="Falkland Islands">Falkland Islands</option>
														<option value="Faroe Islands">Faroe Islands</option>
														<option value="Fiji">Fiji</option>
														<option value="Finland">Finland</option>
														<option value="France">France</option>
														<option value="French Guiana">French Guiana</option>
														<option value="French Polynesia">French Polynesia</option>
														<option value="French Southern Territories">French Southern Territories</option>
														<optgroup label="G"></optgroup>
														<option value="Gabon">Gabon</option>
														<option value="Gambia">Gambia</option>
														<option value="Georgia">Georgia</option>
														<option value="Germany">Germany</option>
														<option value="Ghana">Ghana</option>
														<option value="Gibraltar">Gibraltar</option>
														<option value="Greece">Greece</option>
														<option value="Greenland">Greenland</option>
														<option value="Grenada">Grenada</option>
														<option value="Guadeloupe">Guadeloupe</option>
														<option value="Guam">Guam</option>
														<option value="Guatemala">Guatemala</option>
														<option value="Guernsey">Guernsey</option>
														<option value="Guinea">Guinea</option>
														<option value="Guinea-Bissau">Guinea-Bissau</option>
														<option value="Guyana">Guyana</option>
														<optgroup label="H"></optgroup>
														<option value="Haiti">Haiti</option>
														<option value="Honduras">Honduras</option>
														<option value="Hong Kong">Hong Kong</option>
														<option value="Hungary">Hungary</option>
														<optgroup label="I"></optgroup>
														<option value="Iceland">Iceland</option>
														<option value="India">India</option>
														<option value="Indonesia">Indonesia</option>
														<option value="Iran">Iran</option>
														<option value="Iraq">Iraq</option>
														<option value="Ireland">Ireland</option>
														<option value="Isle of Man">Isle of Man</option>
														<option value="Israel">Israel</option>
														<option value="Italy">Italy</option>
														<option value="Ivory Coast">Ivory Coast</option>
														<optgroup label="J"></optgroup>
														<option value="Jamaica">Jamaica</option>
														<option value="Japan">Japan</option>
														<option value="Jersey">Jersey</option>
														<option value="Jordan">Jordan</option>
														<optgroup label="K"></optgroup>
														<option value="Kazakhstan">Kazakhstan</option>
														<option value="Kenya">Kenya</option>
														<option value="Kiribati">Kiribati</option>
														<option value="Kuwait">Kuwait</option>
														<option value="Kyrgyzstan">Kyrgyzstan</option>
														<optgroup label="L"></optgroup>
														<option value="Laos">Laos</option>
														<option value="Latvia">Latvia</option>
														<option value="Lebanon">Lebanon</option>
														<option value="Lesotho">Lesotho</option>
														<option value="Liberia">Liberia</option>
														<option value="Libya">Libya</option>
														<option value="Liechtenstein">Liechtenstein</option>
														<option value="Lithuania">Lithuania</option>
														<option value="Luxembourg">Luxembourg</option>
														<optgroup label="M"></optgroup>
														<option value="Macao">Macao</option>
														<option value="Macedonia">Macedonia</option>
														<option value="Madagascar">Madagascar</option>
														<option value="Malawi">Malawi</option>
														<option value="Malaysia">Malaysia</option>
														<option value="Maldives">Maldives</option>
														<option value="Mali">Mali</option>
														<option value="Malta">Malta</option>
														<option value="Marshall Islands">Marshall Islands</option>
														<option value="Martinique">Martinique</option>
														<option value="Mauritania">Mauritania</option>
														<option value="Mauritius">Mauritius</option>
														<option value="Mayotte">Mayotte</option>
														<option value="Mexico">Mexico</option>
														<option value="Micronesia">Micronesia</option>
														<option value="Moldova">Moldova</option>
														<option value="Monaco">Monaco</option>
														<option value="Mogolia">Mongolia</option>
														<option value="Montenegro">Montenegro</option>
														<option value="Montserrat">Montserrat</option>
														<option value="Morocco">Morocco</option>
														<option value="Mozambique">Mozambique</option>
														<option value="Myanmar">Myanmar</option>
														<optgroup label="N"></optgroup>
														<option value="Namibia">Namibia</option>
														<option value="Nepal">Nepal</option>
														<option value="Netherlands">Netherlands</option>
														<option value="Netherlands Antilles">Netherlands Antilles</option>
														<option value="New Caledonia">New Caledonia</option>
														<option value="New Zealand">New Zealand</option>
														<option value="Nicaragua">Nicaragua</option>
														<option value="Niger">Niger</option>
														<option value="Nigeria">Nigeria</option>
														<option value="Niue">Niue</option>
														<option value="North Korea">North Korea</option>
														<option value="Northern Mariana Islands">Northern Mariana Islands</option>
														<option value="Norway">Norway</option>
														<optgroup label="O"></optgroup>
														<option value="Oman">Oman</option>
														<optgroup label="P"></optgroup>
														<option value="Pakistan">Pakistan</option>
														<option value="Palau">Palau</option>
														<option value="Palestinian Territory">Palestinian Territory</option>
														<option value="Panama">Panama</option>
														<option value="Papua New Guinea">Papua New Guinea</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Peru">Peru</option>
														<option value="Philippines">Philippines</option>
														<option value="Poland">Poland</option>
														<option value="Portugal">Portugal</option>
														<option value="Puerto Rico">Puerto Rico</option>
														<optgroup label="Q"></optgroup>
														<option value="Qatar">Qatar</option>
														<optgroup label="R"></optgroup>
														<option value="Republic of the Congo">Republic of the Congo</option>
														<option value="Reunion">Reunion</option>
														<option value="Romania">Romania</option>
														<option value="Russia">Russia</option>
														<option value="Rwanda">Rwanda</option>
														<optgroup label="S"></optgroup>
														<option value="Saint Barthelemy">Saint Barthelemy</option>
														<option value="Saint Helena">Saint Helena</option>
														<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
														<option value="Saint Lucia">Saint Lucia</option>
														<option value="Saint Martin">Saint Martin</option>
														<option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
														<option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
														<option value="Samoa">Samoa</option>
														<option value="San Marino">San Marino</option>
														<option value="Sao Tome and Principe">Sao Tome and Principe</option>
														<option value="Saudi Arabia">Saudi Arabia</option>
														<option value="Senegal">Senegal</option>
														<option value="Serbia">Serbia</option>
														<option value="Seychelles">Seychelles</option>
														<option value="Sierra Leone">Sierra Leone</option>
														<option value="Singapore">Singapore</option>
														<option value="Slovakia">Slovakia</option>
														<option value="Slovenia">Slovenia</option>
														<option value="Solomon Islands">Solomon Islands</option>
														<option value="Somaila">Somalia</option>
														<option value="South Africa">South Africa</option>
														<option value="South Korea♥">South Korea♥</option>
														<option value="Spain">Spain</option>
														<option value="Sri Lanka">Sri Lanka</option>
														<option value="Sudan">Sudan</option>
														<option value="Suriname">Suriname</option>
														<option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
														<option value="Swaziland">Swaziland</option>
														<option value="Sweden">Sweden</option>
														<option value="Switzerland">Switzerland</option>
														<option value="Syria">Syria</option>
														<optgroup label="T"></optgroup>
														<option value="Taiwan">Taiwan</option>
														<option value="Tajikistan">Tajikistan</option>
														<option value="Tanzania">Tanzania</option>
														<option value="Thiland">Thailand</option>
														<option value="Togo">Togo</option>
														<option value="Tonga">Tonga</option>
														<option value="Trinidad and Tobago">Trinidad and Tobago</option>
														<option value="Tunisia">Tunisia</option>
														<option value="Turkey">Turkey</option>
														<option value="Turkmenistan">Turkmenistan</option>
														<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
														<option value="Tuvalu">Tuvalu</option>
														<optgroup label="U"></optgroup>
														<option value="U.S. Virgin Islands">U.S. Virgin Islands</option>
														<option value="Uganda">Uganda</option>
														<option value="Ukraine">Ukraine</option>
														<option value="United Arab Emirates">United Arab Emirates</option>
														<option value="United Kingdom">United Kingdom</option>
														<option value="United States">United States</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Uzbekistan">Uzbekistan</option>
														<optgroup label="V"></optgroup>
														<option value="Vanuatu">Vanuatu</option>
														<option value="Vatican">Vatican</option>
														<option value="Venezuela">Venezuela</option>
														<option value="Vietnam">Vietnam</option>
														<optgroup label="W"></optgroup>
														<option value="Wallis and Futuna">Wallis and Futuna</option>
														<option value="western Sahara">Western Sahara</option>
														<optgroup label="Y"></optgroup>
														<option value="Yemen">Yemen</option>
														<optgroup label="Z"></optgroup>
														<option value="Zambia">Zambia</option>
														<option value="Zimbabwe">Zimbabwe</option>
													</select>
												</div>
											</div>
										</div>
										<!--                               <div class="form-group"> -->
										<!--                                  <label class="col-lg-3 control-label">Email:</label> -->
										<!--                                  <div class="col-lg-8"> -->
										<%--                                     <input class="form-control" value="${member.email }" --%>
										<!--                                        type="text"> -->
										<!--                                  </div> -->
										<!--                               </div> -->
										<div class="form-group">
											<label class="col-md-3 control-label">Username:</label>
											<div class="col-md-8">
												<pre class="form-control">${member.userid }</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">introduce:</label>
											<div class="col-md-8">
												<input class="form-control" value="${member.introduce }"
													name="introduce" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Password:</label>
											<div class="col-md-8">
												<input class="form-control" placeholder="Password"
													type="password" name="pwd" id="pwd"
													onfocus="this.value='';return true;"> <span
													id="pwdCorrectly">Password Check</span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Confirm
												password:</label>
											<div class="col-md-8">
												<input class="form-control" placeholder="Confirm Password"
													type="password" id="checkPwd"
													onfocus="this.value='';return true;"> <span
													id="checkPwdCorrectly"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-8">
												<input type="submit" class="btn btn-primary"
													value="Save Changes"> <span></span> <input
													class="btn btn-default" value="Cancel" type="reset">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>


					<div class="tab-pane fade in" id="tab3">
						<div class="container">
							<h1 class="page-header">Message</h1>

							<!--           sender_userid 부분 -->
							<div class="row" style="text-align: center;">
								<c:forEach items="${messageList }" var="msg_List" varStatus="i">
									<div class="message_section container-fluid"
										id="msg_section${i.index }">
										<div class="sender col-lg-3" id="${i.index }">
											<input type="hidden" id="msg_condition_${i.index }" value="1">
											<div class="col-md-4">
												<c:if test="${msg_List.msg_send_userid == userid}">
													<img class="userid_img"
														src="imageProfileView.do?img_code=${msg_List.msg_receive_userid }"
														width="50px" height="50px">
												</c:if>
												<c:if test="${msg_List.msg_send_userid != userid}">
													<img class="userid_img"
														src="imageProfileView.do?img_code=${msg_List.msg_send_userid }"
														width="50px" height="50px">
												</c:if>

											</div>
											<div class="col-md-8">
												<c:if test="${msg_List.msg_send_userid == userid}">
													<h6 class="sender_name" id="name${i.index }">${msg_List.msg_receive_userid }</h6>
												</c:if>
												<c:if test="${msg_List.msg_send_userid != userid}">
													<h6 class="sender_name" id="name${i.index }">${msg_List.msg_send_userid }</h6>
												</c:if>
												<%-- 												<label class="sender_name container-fluid control-label" id="${msg_List.msg_send_userid }">${msg_List.msg_send_userid }</label> --%>
											</div>
										</div>
										<div class="message" id="message_${i.index }">
											<div class="msg_cosntents col-lg-7">
												<label class="container-fluid control-label">
													${msg_List.msg_contents }</label>
											</div>
											<div class="msg_date col-lg-2">
												<label class="container-fluid control-label">
													${msg_List.msg_date }</label>
											</div>
										</div>
										<div class="msg_contents_box col-lg-9"
											id="msg_box_${i.index }">
											<div class="msg_box" id="msg_box_selectOne${i.index }">
												<div class="msg_list container-fluid">MessageList</div>
											</div>
											<div class="panel panel-default">
												<div class="panel-body">
													<textarea class="sending_msg_form form-control counted"
														name="msg_contents" id="send_msg_contents${i.index }"
														placeholder="Type in your message 메시지 입력" rows="5"
														style="margin-bottom: 10px; resize: none"></textarea>
													<span class="remain_sending_msg pull-right"
														id="remain_sending_msg${i.index }">1000 characters
														remaining</span> <input class="btn btn-info send_msg_button"
														type="submit" value="Post New Message"
														id="submit_msg${i.index }">
												</div>
											</div>
										</div>
									</div>
									<br>
								</c:forEach>
							</div>
							<br> <br>

							<!-- 							<div class="jb-center"> -->
							<!-- 								<ul class="pagination"> -->
							<!-- 									<li><a href="#"><span -->
							<!-- 											class="glyphicon glyphicon-chevron-left"></span></a></li> -->
							<%-- 									<c:forEach begin="1" end="10" step="1" varStatus="i"> --%>
							<%-- 										<li class="message default" id="paging_msg_${i.index }"><a --%>
							<%-- 											href="#">${i.index}</a></li> --%>
							<%-- 									</c:forEach> --%>
							<!-- 									<li><a href="#"><span -->
							<!-- 											class="glyphicon glyphicon-chevron-right"></span></a></li> -->
							<!-- 								</ul> -->
							<!-- 							</div> -->
							<div class="row" style="text-align: center" id='addbtn'>
								<div class="btns">
									<%-- 									<a href="javascript:moreList();" class="btn btn-primary more_msg" id='addbtn${msg_pre_count }'>MORE</a> --%>
									<div class="btn btn-primary more_msg_list"
										id='addbtn${msg_pre_count }'>MORE</div>
								</div>
							</div>



						</div>
					</div>















					<div class="tab-pane fade in" id="tab4">
						<div class="container">
							<h1 class="page-header">Matching</h1>

							<!--           Matching 부분 -->

							<h3 class="page-header">Guide Request Matching</h3>

							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${hold_matchingList }"
									var="hold_mch_List">
									<c:if test="${hold_mch_List.mch_g_userid==userid }">
									
									<div class="guide_matching_section container-fluid"
										id="guide_mathing_section${i.index }_${hold_mch_List.b_idx }">
										<div class="guide_not_accept col-lg-3" id="${i.index }">
											<input type="hidden" id="guide_req_match_condition_${i.index }"
												value="1">
											<div class="col-md-4">

												<img class="userid_img"
													src="imageProfileView.do?img_code=${hold_mch_List.mch_t_userid }"
													width="50px" height="50px">

												<%-- 													<c:if test="${msg_List.msg_send_userid != userid}"> --%>
												<%-- 														<img class="userid_img" src="imageProfileView.do?img_code=${msg_List.msg_send_userid }" width="50px" --%>
												<!-- 															height="50px"> -->
												<%-- 													</c:if> --%>
												<!-- 													<img class="userid_img" src="img/profile.jpg" width="50px" -->
												<!-- 														height="50px"> -->
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${hold_mch_List.mch_t_userid }</label>
											</div>
										</div>
										<div class="guide_request_matching" id="guide_req_matching_${i.index }">
											<div class="guide_request_mch_contents col-lg-7">
												<a href="guideView.do?boardIdx=${hold_mch_List.b_idx }">
													<label class="guide_board_title container-fluid control-label"
													id="${hold_mch_List.b_idx }"> 해당 게시글 제목
														${hold_mch_List.b_idx }</label>
												</a>
											</div>
											<div class="guide_request_mch_date col-lg-2">
												<label class="guide_matching_date container-fluid control-label"
													id="${hold_mch_List.mch_date }">
													${hold_mch_List.mch_date } </label>
											</div>
										</div>
										<div class="guide_matching_box col-lg-9"
											id="guide_matching_box_${i.index }" style="text-align: center">
											<div>
												<label class="container-fluid control-label"> 매칭 요청을
													수락하시겠습니까?</label>
											</div>
											<br>
											<div class="guide_matching_response"">
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<input class="btn btn-info guide_matcing_accept_answer_yes"
														id="${hold_mch_List.mch_t_userid }_${i.index}_${hold_mch_List.b_idx}_${hold_mch_List.mch_date}_${hold_matchingListSize }"
														type="button" value="YES">
												</div>
												<div class="col-md-3">
													<input class="btn btn-info guide_matcing_accept_answer_no"
														id="${hold_mch_List.mch_t_userid }_${i.index}_${hold_mch_List.b_idx}_${hold_mch_List.mch_date}"
														type="button" value="NO">
												</div>
												<div class="col-md-3"></div>
												<br> <br>
											</div>
										</div>
									</div>
									</c:if>
									<br id="guide_br_mathing_section${i.index }_${hold_mch_List.b_idx }">
								</c:forEach>
							</div>


							
							
							
							

							<h3 class="page-header">Guide Accepted Matching</h3>
							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${acc_matchingList }"
									var="acc_mch_List">
									<div class="guide_matching_section container-fluid">
										<div class="guide_accept col-lg-3" id="${i.index }">
											<input type="hidden" id="guide_matched_condition_${i.index }"
												value="1">
											<div class="col-md-4">
												<img class="userid_img"
													src="imageProfileView.do?img_code=${acc_mch_List.mch_g_userid }"
													width="50px" height="50px">
												<!-- 													<img class="userid_img" src="img/profile.jpg" width="50px" -->
												<!-- 														height="50px"> -->
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${acc_mch_List.mch_g_userid }</label>
											</div>
										</div>
										<div class="guide_accepted_matching"
											id="guide_accepted_matching_${i.index }">
											<div class="guide_accepted_mch_contents col-lg-7">
												<a href="guideView.do?boardIdx=${acc_mch_List.b_idx }">
													<label class="container-fluid control-label"> 해당
														게시글 제목 ${acc_mch_List.b_idx }</label>
												</a>
											</div>
											<div class="guide_accepted_mch_date col-lg-2">
												<label class="container-fluid control-label">
													${acc_mch_List.mch_date }</label>
											</div>
										</div>
									</div>
									<br>
								</c:forEach>
							</div>
							<div class="row guide_add_matching_section" style="text-align: center">
							</div>
							



							<br> <br>

							<div class="jb-center">
								<ul class="pagination">
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-left"></span></a></li>
									<c:forEach begin="1" end="10" step="1" varStatus="i">
										<li class="matching default" id="paging_mch_${i.index }"><a
											href="#">${i.index}</a></li>
									</c:forEach>
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-right"></span></a></li>
								</ul>
							</div>
						</div>
					</div>

					
					
					
					
					
					
					
					
					
					
					
					
					
					<div class="tab-pane fade in" id="tab5">
						<div class="container">
							<h1 class="page-header">Matching</h1>

							<!--           Matching 부분 -->

							<h3 class="page-header">Travel Request Matching</h3>

							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${res_matchingList }"
									var="res_mch_List">
									<c:if test="${res_mch_List.mch_t_userid==userid }">
									<div class="matching_section container-fluid"
										id="mathing_section${i.index }_${res_mch_List.b_idx }">
										<div class="not_accept col-lg-3" id="${i.index }">
											<input type="hidden" id="req_match_condition_${i.index }"
												value="1">
											<div class="col-md-4">

												<img class="userid_img"
													src="imageProfileView.do?img_code=${res_mch_List.mch_g_userid }"
													width="50px" height="50px">

												<%-- 													<c:if test="${msg_List.msg_send_userid != userid}"> --%>
												<%-- 														<img class="userid_img" src="imageProfileView.do?img_code=${msg_List.msg_send_userid }" width="50px" --%>
												<!-- 															height="50px"> -->
												<%-- 													</c:if> --%>
												<!-- 													<img class="userid_img" src="img/profile.jpg" width="50px" -->
												<!-- 														height="50px"> -->
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${res_mch_List.mch_g_userid }</label>
											</div>
										</div>
										<div class="request_matching" id="req_matching_${i.index }">
											<div class="request_mch_contents col-lg-7">
												<a href="guideView.do?boardIdx=${res_mch_List.b_idx }">
													<label class="board_title container-fluid control-label"
													id="${res_mch_List.b_idx }"> 해당 게시글 제목
														${res_mch_List.b_idx }</label>
												</a>
											</div>
											<div class="request_mch_date col-lg-2">
												<label class="matching_date container-fluid control-label"
													id="${res_mch_List.mch_date }">
													${res_mch_List.mch_date } </label>
											</div>
										</div>
										<div class="matching_box col-lg-9"
											id="matching_box_${i.index }" style="text-align: center">
											<div>
												<label class="container-fluid control-label"> 매칭 요청을
													수락하시겠습니까?</label>
											</div>
											<br>
											<div class="matching_response"">
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<input class="btn btn-info matcing_accept_answer_yes"
														id="${res_mch_List.mch_g_userid }_${i.index}_${res_mch_List.b_idx}_${res_mch_List.mch_date}_${res_matchingListSize }"
														type="button" value="YES">
												</div>
												<div class="col-md-3">
													<input class="btn btn-info matcing_accept_answer_no"
														id="${res_mch_List.mch_g_userid }_${i.index}_${res_mch_List.b_idx}_${res_mch_List.mch_date}"
														type="button" value="NO">
												</div>
												<div class="col-md-3"></div>
												<br> <br>
											</div>
										</div>
									</div>
									</c:if>
									<br id="br_mathing_section${i.index }_${res_mch_List.b_idx }">
								</c:forEach>
							</div>

							
							
							
							
							<h3 class="page-header">Travel Holding Matching</h3>
							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${hold_matchingList }"
									var="hold_mch_List">
									<c:if test="${hold_mch_List.mch_t_userid==userid }">
									<div class="matching_section container-fluid">
										<div class="holind col-lg-3" id="${i.index }">
											<input type="hidden" id="matched_condition_${i.index }"
												value="1">
											<div class="col-md-4">
												<img class="userid_img"
													src="imageProfileView.do?img_code=${hold_mch_List.mch_g_userid }"
													width="50px" height="50px">
												<!-- 													<img class="userid_img" src="img/profile.jpg" width="50px" -->
												<!-- 														height="50px"> -->
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${hold_mch_List.mch_g_userid }</label>
											</div>
										</div>
										<div class="holding_matching"
											id="holding_matching_${i.index }">
											<div class="holding_mch_contents col-lg-7">
												<a href="guideView.do?boardIdx=${hold_mch_List.b_idx }">
													<label class="container-fluid control-label"> 해당
														게시글 제목 ${hold_mch_List.b_idx }</label>
												</a>
											</div>
											<div class="holding_mch_date col-lg-2">
												<label class="container-fluid control-label">
													${hold_mch_List.mch_date }</label>
											</div>
										</div>
									</div>
									</c:if>
									<br>
								</c:forEach>
							</div>
							<div class="row add_matching_section" style="text-align: center">
							</div>
							
							
							
							

							<h3 class="page-header">Travel Accepted Matching</h3>
							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${acc_matchingList }"
									var="acc_mch_List">
									<div class="matching_section container-fluid">
										<div class="accept col-lg-3" id="${i.index }">
											<input type="hidden" id="matched_condition_${i.index }"
												value="1">
											<div class="col-md-4">
												<img class="userid_img"
													src="imageProfileView.do?img_code=${acc_mch_List.mch_g_userid }"
													width="50px" height="50px">
												<!-- 													<img class="userid_img" src="img/profile.jpg" width="50px" -->
												<!-- 														height="50px"> -->
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${acc_mch_List.mch_g_userid }</label>
											</div>
										</div>
										<div class="accepted_matching"
											id="accepted_matching_${i.index }">
											<div class="accepted_mch_contents col-lg-7">
												<a href="guideView.do?boardIdx=${acc_mch_List.b_idx }">
													<label class="container-fluid control-label"> 해당
														게시글 제목 ${acc_mch_List.b_idx }</label>
												</a>
											</div>
											<div class="accepted_mch_date col-lg-2">
												<label class="container-fluid control-label">
													${acc_mch_List.mch_date }</label>
											</div>
										</div>
									</div>
									<br>
								</c:forEach>
							</div>
							



							<br> <br>

							<div class="jb-center">
								<ul class="pagination">
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-left"></span></a></li>
									<c:forEach begin="1" end="10" step="1" varStatus="i">
										<li class="matching default" id="paging_mch_${i.index }"><a
											href="#">${i.index}</a></li>
									</c:forEach>
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-right"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					
					
					
					

				</div>
			</div>
		</div>
	</div>












</body>
</html>