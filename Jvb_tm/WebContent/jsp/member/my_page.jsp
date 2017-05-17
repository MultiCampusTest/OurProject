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
				+ '<div class="accepted_mch_contents col-lg-7"><a href="add_href_b_idx guideView.do?boardIdx=' + board_title + '">'
				+ '<label class="add_title container-fluid control-label">해당게시글 번호' + board_title + '</label></a></div>'
				+ '<div class="add_date col-lg-2">'
				+ '<label class="container-fluid control-label">' + matching_date + '</label></div></div></div><br>';




			$.ajax({
				url : 'matchingSuccess.do',
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
						<div class="hidden-xs">Matching</div>
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
												<input type="submit" class="btn btn-primary"
													value="unsubscribe"> <span></span>
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
														<option value="AF">Afghanistan</option>
														<option value="AL">Albania</option>
														<option value="DZ">Algeria</option>
														<option value="AS">American Samoa</option>
														<option value="AD">Andorra</option>
														<option value="AO">Angola</option>
														<option value="AI">Anguilla</option>
														<option value="AG">Antigua and Barbuda</option>
														<option value="AR">Argentina</option>
														<option value="AM">Armenia</option>
														<option value="AW">Aruba</option>
														<option value="AU">Australia</option>
														<option value="AT">Austria</option>
														<option value="AZ">Azerbaijan</option>
														<optgroup label="B"></optgroup>
														<option value="BS">Bahamas</option>
														<option value="BH">Bahrain</option>
														<option value="BD">Bangladesh</option>
														<option value="BB">Barbados</option>
														<option value="BY">Belarus</option>
														<option value="BE">Belgium</option>
														<option value="BZ">Belize</option>
														<option value="BJ">Benin</option>
														<option value="BM">Bermuda</option>
														<option value="BT">Bhutan</option>
														<option value="BO">Bolivia</option>
														<option value="BA">Bosnia and Herzegovina</option>
														<option value="BW">Botswana</option>
														<option value="BR">Brazil</option>
														<option value="VG">British Virgin Islands</option>
														<option value="BN">Brunei</option>
														<option value="BG">Bulgaria</option>
														<option value="BF">Burkina Faso</option>
														<option value="BI">Burundi</option>
														<optgroup label="C"></optgroup>
														<option value="KH">Cambodia</option>
														<option value="CM">Cameroon</option>
														<option value="CA">Canada</option>
														<option value="CV">Cape Verde</option>
														<option value="KY">Cayman Islands</option>
														<option value="CF">Central African Republic</option>
														<option value="TD">Chad</option>
														<option value="CL">Chile</option>
														<option value="CN">China</option>
														<option value="CC">Cocos Islands</option>
														<option value="CO">Colombia</option>
														<option value="KM">Comoros</option>
														<option value="CK">Cook Islands</option>
														<option value="CR">Costa Rica</option>
														<option value="HR">Croatia</option>
														<option value="CU">Cuba</option>
														<option value="CY">Cyprus</option>
														<option value="CZ">Czech Republic</option>
														<optgroup label="D"></optgroup>
														<option value="CD">Democratic Republic of the
															Congo</option>
														<option value="DK">Denmark</option>
														<option value="DJ">Djibouti</option>
														<option value="DM">Dominica</option>
														<option value="DO">Dominican Republic</option>
														<optgroup label="E"></optgroup>
														<option value="TL">East Timor</option>
														<option value="EC">Ecuador</option>
														<option value="EG">Egypt</option>
														<option value="SV">El Salvador</option>
														<option value="GQ">Equatorial Guinea</option>
														<option value="ER">Eritrea</option>
														<option value="EE">Estonia</option>
														<option value="ET">Ethiopia</option>
														<optgroup label="F"></optgroup>
														<option value="FK">Falkland Islands</option>
														<option value="FO">Faroe Islands</option>
														<option value="FJ">Fiji</option>
														<option value="FI">Finland</option>
														<option value="FR">France</option>
														<option value="GF">French Guiana</option>
														<option value="PF">French Polynesia</option>
														<option value="TF">French Southern Territories</option>
														<optgroup label="G"></optgroup>
														<option value="GA">Gabon</option>
														<option value="GM">Gambia</option>
														<option value="GE">Georgia</option>
														<option value="DE">Germany</option>
														<option value="GH">Ghana</option>
														<option value="GI">Gibraltar</option>
														<option value="GR">Greece</option>
														<option value="GL">Greenland</option>
														<option value="GD">Grenada</option>
														<option value="GP">Guadeloupe</option>
														<option value="GU">Guam</option>
														<option value="GT">Guatemala</option>
														<option value="GG">Guernsey</option>
														<option value="GN">Guinea</option>
														<option value="GW">Guinea-Bissau</option>
														<option value="GY">Guyana</option>
														<optgroup label="H"></optgroup>
														<option value="HT">Haiti</option>
														<option value="HN">Honduras</option>
														<option value="HK">Hong Kong</option>
														<option value="HU">Hungary</option>
														<optgroup label="I"></optgroup>
														<option value="IS">Iceland</option>
														<option value="IN">India</option>
														<option value="ID">Indonesia</option>
														<option value="IR">Iran</option>
														<option value="IQ">Iraq</option>
														<option value="IE">Ireland</option>
														<option value="IM">Isle of Man</option>
														<option value="IL">Israel</option>
														<option value="IT">Italy</option>
														<option value="CI">Ivory Coast</option>
														<optgroup label="J"></optgroup>
														<option value="JM">Jamaica</option>
														<option value="JP">Japan</option>
														<option value="JE">Jersey</option>
														<option value="JO">Jordan</option>
														<optgroup label="K"></optgroup>
														<option value="KZ">Kazakhstan</option>
														<option value="KE">Kenya</option>
														<option value="KI">Kiribati</option>
														<option value="KW">Kuwait</option>
														<option value="KG">Kyrgyzstan</option>
														<optgroup label="L"></optgroup>
														<option value="LA">Laos</option>
														<option value="LV">Latvia</option>
														<option value="LB">Lebanon</option>
														<option value="LS">Lesotho</option>
														<option value="LR">Liberia</option>
														<option value="LY">Libya</option>
														<option value="LI">Liechtenstein</option>
														<option value="LT">Lithuania</option>
														<option value="LU">Luxembourg</option>
														<optgroup label="M"></optgroup>
														<option value="MO">Macao</option>
														<option value="MK">Macedonia</option>
														<option value="MG">Madagascar</option>
														<option value="MW">Malawi</option>
														<option value="MY">Malaysia</option>
														<option value="MV">Maldives</option>
														<option value="ML">Mali</option>
														<option value="MT">Malta</option>
														<option value="MH">Marshall Islands</option>
														<option value="MQ">Martinique</option>
														<option value="MR">Mauritania</option>
														<option value="MU">Mauritius</option>
														<option value="YT">Mayotte</option>
														<option value="MX">Mexico</option>
														<option value="FM">Micronesia</option>
														<option value="MD">Moldova</option>
														<option value="MC">Monaco</option>
														<option value="MN">Mongolia</option>
														<option value="ME">Montenegro</option>
														<option value="MS">Montserrat</option>
														<option value="MA">Morocco</option>
														<option value="MZ">Mozambique</option>
														<option value="MM">Myanmar</option>
														<optgroup label="N"></optgroup>
														<option value="NA">Namibia</option>
														<option value="NP">Nepal</option>
														<option value="NL">Netherlands</option>
														<option value="AN">Netherlands Antilles</option>
														<option value="NC">New Caledonia</option>
														<option value="NZ">New Zealand</option>
														<option value="NI">Nicaragua</option>
														<option value="NE">Niger</option>
														<option value="NG">Nigeria</option>
														<option value="NU">Niue</option>
														<option value="KP">North Korea</option>
														<option value="MP">Northern Mariana Islands</option>
														<option value="NO">Norway</option>
														<optgroup label="O"></optgroup>
														<option value="OM">Oman</option>
														<optgroup label="P"></optgroup>
														<option value="PK">Pakistan</option>
														<option value="PW">Palau</option>
														<option value="PS">Palestinian Territory</option>
														<option value="PA">Panama</option>
														<option value="PG">Papua New Guinea</option>
														<option value="PY">Paraguay</option>
														<option value="PE">Peru</option>
														<option value="PH">Philippines</option>
														<option value="PL">Poland</option>
														<option value="PT">Portugal</option>
														<option value="PR">Puerto Rico</option>
														<optgroup label="Q"></optgroup>
														<option value="QA">Qatar</option>
														<optgroup label="R"></optgroup>
														<option value="CG">Republic of the Congo</option>
														<option value="RE">Reunion</option>
														<option value="RO">Romania</option>
														<option value="RU">Russia</option>
														<option value="RW">Rwanda</option>
														<optgroup label="S"></optgroup>
														<option value="BL">Saint Barthélemy</option>
														<option value="SH">Saint Helena</option>
														<option value="KN">Saint Kitts and Nevis</option>
														<option value="LC">Saint Lucia</option>
														<option value="MF">Saint Martin</option>
														<option value="PM">Saint Pierre and Miquelon</option>
														<option value="VC">Saint Vincent and the
															Grenadines</option>
														<option value="WS">Samoa</option>
														<option value="SM">San Marino</option>
														<option value="ST">Sao Tome and Principe</option>
														<option value="SA">Saudi Arabia</option>
														<option value="SN">Senegal</option>
														<option value="RS">Serbia</option>
														<option value="SC">Seychelles</option>
														<option value="SL">Sierra Leone</option>
														<option value="SG">Singapore</option>
														<option value="SK">Slovakia</option>
														<option value="SI">Slovenia</option>
														<option value="SB">Solomon Islands</option>
														<option value="SO">Somalia</option>
														<option value="ZA">South Africa</option>
														<option value="KR">South Korea</option>
														<option value="ES">Spain</option>
														<option value="LK">Sri Lanka</option>
														<option value="SD">Sudan</option>
														<option value="SR">Suriname</option>
														<option value="SJ">Svalbard and Jan Mayen</option>
														<option value="SZ">Swaziland</option>
														<option value="SE">Sweden</option>
														<option value="CH">Switzerland</option>
														<option value="SY">Syria</option>
														<optgroup label="T"></optgroup>
														<option value="TW">Taiwan</option>
														<option value="TJ">Tajikistan</option>
														<option value="TZ">Tanzania</option>
														<option value="TH">Thailand</option>
														<option value="TG">Togo</option>
														<option value="TO">Tonga</option>
														<option value="TT">Trinidad and Tobago</option>
														<option value="TN">Tunisia</option>
														<option value="TR">Turkey</option>
														<option value="TM">Turkmenistan</option>
														<option value="TC">Turks and Caicos Islands</option>
														<option value="TV">Tuvalu</option>
														<optgroup label="U"></optgroup>
														<option value="VI">U.S. Virgin Islands</option>
														<option value="UG">Uganda</option>
														<option value="UA">Ukraine</option>
														<option value="AE">United Arab Emirates</option>
														<option value="GB">United Kingdom</option>
														<option value="US">United States</option>
														<option value="UY">Uruguay</option>
														<option value="UZ">Uzbekistan</option>
														<optgroup label="V"></optgroup>
														<option value="VU">Vanuatu</option>
														<option value="VA">Vatican</option>
														<option value="VE">Venezuela</option>
														<option value="VN">Vietnam</option>
														<optgroup label="W"></optgroup>
														<option value="WF">Wallis and Futuna</option>
														<option value="EH">Western Sahara</option>
														<optgroup label="Y"></optgroup>
														<option value="YE">Yemen</option>
														<optgroup label="Z"></optgroup>
														<option value="ZM">Zambia</option>
														<option value="ZW">Zimbabwe</option>
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

							<h3 class="page-header">Request Matching</h3>

							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${res_matchingList }"
									var="res_mch_List">
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
									<br id="br_mathing_section${i.index }_${res_mch_List.b_idx }">
								</c:forEach>
							</div>



							<h3 class="page-header">Accepted Matching</h3>
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
							<div class="row add_matching_section" style="text-align: center">


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