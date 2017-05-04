<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Travel Maker</title>

<style type="text/css">
</style>

<script type="text/javascript">

$(document).ready(function() {
	$('.sender').on('click', function() {
	      var id = $(this).attr('id');
	      var result= $('#name'+id).html();
// 	      alert(result);
	      var msg_list=$('.msg_list').html();

	   		 $.ajax({
	   			 
	   	            url : 'messageOneList.do',
	   	            type : 'POST',
	   	            data : 'msg_send_userid='+result,
	   	            dataType : 'json',
	   	            success : function(data) {
	   	            	$('#msg_box_selectOne'+id).text('MessageList');
	   	            	
	   	            	
		   	            for(var i=0; i<data.length; i++){
// 	   	            		alert(data[i].msg_send_userid);
		   	            	if(data[i].msg_send_userid==result){
						      	var add_Label='<div class="msg_list message_panel message_in container-fluid">'+data[i].msg_contents+'<label class="msg_time container-fluid">'+data[i].msg_date+'</label></div>';
						 
			   	            	$('#msg_box_selectOne'+id).append('<br>');
			   	            	$('#msg_box_selectOne'+id).append(add_Label);
// 			   	            	$('#msg_box_selectOne'+id).append(add_time);
		   	            	}
		   	            	else{
		   	            		var add_Label='<div class="msg_list message_panel message_out container-fluid">'+data[i].msg_contents+'<label class="msg_time container-fluid">'+data[i].msg_date+'</label></div>';
			   	            	$('#msg_box_selectOne'+id).append('<br>');
			   	            	$('#msg_box_selectOne'+id).append(add_Label);
		   	            	}
		   	            	
	   	            	}   
	   	            },
	   	            error : function(){
	   	               alert('에러 개새끼야');
	   	            }
	   	      });
	  });
	
	
	$('.send_msg_button').on('click', function(){
		var id=$(this).attr('id');
// 		alert(id);
		var realid=id.substring(10);
// 		alert(realid);
		var result= $('#name'+realid).html();
// 		alert(result);
		var send_msg_contents=$('#send_msg_contents'+realid).val();
// 		alert(send_msg_contents);
		
		
		$.ajax({
  			 
	            url : 'sendMessage.do',
	            type : 'POST',
	            data : 'msg_send_userid='+result+'&msg_contents='+send_msg_contents,
	            dataType : 'json',
	            success : function(data) {
	            
	            	$('#send_msg_contents'+realid).val("");
// 	            	$('#msg_box_selectOne'+realid).text('MessageList');
	   	            
	   	       		var add_Label='<div class="msg_list message_panel message_out container-fluid">'+send_msg_contents+'<label class="msg_time container-fluid">'+data[i].msg_date+'</label></div>';
	            	$('#msg_box_selectOne'+realid).append('<br>');
	            	$('#msg_box_selectOne'+realid).append(add_Label);
	            	
// 	   	            $('#msg_list'+realid).append('<br>');
// 	   	            $('#msg_list'+realid).append(send_msg_contents);
	            	  
	            },
	            error : function(){
	               alert('에러 개새끼야');
// 	               $('#send_msg_contents'+realid).val("");
	            }
	      });
	});
	
	
	
	
	$('.matcing_accept_answer').on('click', function(){
		var m_array=new Array();
		var id=$(this).attr('id');
		m_array=id.split('_');
		var readid=m_array[0];
		var board_idx=m_array[1];
// 		alert(bbb);
// 		alert(id);
		var responseValue=$(this).val();
// 		alert(responseValue);
		
		
		
		var add_img='<img class="userid_img" src="img/profile.jpg" width="50px" height="50px">'
		var board_title=$('.board_title').attr('id');
// 		alert(board_title);
		var matching_date=$('.matching_date').attr('id');
// 		alert(matching_date);

		
		

		
		if(responseValue=='YES'){
			$.ajax({
	  			 
		            url : 'matchingSuccess.do',
		            type : 'POST',
		            data : 'mch_t_userid='+readid,
		            dataType : 'json',
		            success : function(data) {
		            	
		            		alert('매칭 성공');
		            		$('.add_img').append(add_img);
		            		$('.add_mch_t_userid').append(readid);
		            		$('.add_title').append('해당 게시글 번호'+board_title);
		            		$('.add_date').append(matching_date);
		            		$('.add_href_b_idx').attr('href', 'board.do?b_idx='+board_title);
		            		$('#mathing_section'+board_idx).remove();
		            		
		            	  
		            },
		            error : function(){
		               alert('에러 개새끼야');
	// 	               $('#send_msg_contents'+realid).val("");
		            }
		      });

		}
		
		
		else if(responseValue=='NO'){
			$('#mathing_section'+board_idx).remove();
		}
		
	});
		
})



	
</script>
  


</head>
<body>


	<div class="container-fluid">
		<div class="col-lg-12 col-sm-12">
			<div class="card hovercard">
				<div class="card-background">
					<img class="card-bkimg" alt="" src="img/header.jpg">
				</div>
				<div class="useravatar">
					<img alt="" src="img/header.jpg">
				</div>
				<div class="card-info">
					<span class="card-title">${f_name} + ${l_name}</span>

				</div>
			</div>
			<div class="btn-pref btn-group btn-group-justified btn-group-lg"
				role="group" aria-label="...">
				<div class="btn-group" role="group">
					<button type="button" id="myPage" class="btn btn-primary"
						href="#tab1" data-toggle="tab">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<div class="hidden-xs">내 정보</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="update" class="btn btn-default"
						href="#tab2" data-toggle="tab">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<div class="hidden-xs">정보 수정</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="message" class="btn btn-default"
						href="#tab3" data-toggle="tab">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						<div class="hidden-xs">메시지함</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="matching" class="btn btn-default"
						href="#tab4" data-toggle="tab">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						<div class="hidden-xs">매칭</div>
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
										<img src="http://lorempixel.com/200/200/people/9/"
											class="avatar img-circle img-thumbnail" alt="avatar">
										<h3>Your Name</h3>
									</div>
								</div>
								<!-- right column -->
								<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
									<h3>Personal info</h3>
									<form class="form-horizontal" role="form" action="#">
										<div class="form-group">
											<label class="col-lg-3 control-label">First name:</label>
											<div class="col-lg-8">
												<pre class="form-control">your first name</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Last name:</label>
											<div class="col-lg-8">
												<pre class="form-control">your last name</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Contury:</label>
											<div class="col-lg-8">
												<pre class="form-control">your contury</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Email:</label>
											<div class="col-lg-8">
												<pre class="form-control">your email</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Birth:</label>
											<div class="col-lg-8">
												<pre class="form-control">your birth</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Username:</label>
											<div class="col-md-8">
												<pre class="form-control">your username</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">introduce:</label>
											<div class="col-md-8">
												<pre class="form-control">yout introduce </pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label"></label>
											<div class="col-md-8">
												<input type="submit" class="btn btn-primary" value="회원 탈퇴 ">
												<span></span>
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
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="text-center">
										<img src="http://lorempixel.com/200/200/people/9/"
											class="avatar img-circle img-thumbnail" alt="avatar">
										<h6>Upload a different photo...</h6>
										<input type="file"
											class="text-center center-block well well-sm">
									</div>
								</div>
								<!-- edit form column -->
								<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
									<div class="alert alert-info alert-dismissable">
										<a class="panel-close close" data-dismiss="alert">×</a> <i
											class="fa fa-coffee"></i> This is an <strong>.alert</strong>.
										Use this to show important messages to the user.
									</div>
									<h3>Personal info</h3>
									<form class="form-horizontal" role="form" action="#">
										<div class="form-group">
											<label class="col-lg-3 control-label">First name:</label>
											<div class="col-lg-8">
												<input class="form-control" value="Jane" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Last name:</label>
											<div class="col-lg-8">
												<input class="form-control" value="Bishop" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Contury:</label>
											<div class="col-lg-8">
												<div class="ui-select">
													<select id="user_time_zone" class="form-control">
														<option value="Hawaii">(GMT-10:00) Hawaii</option>
														<option value="Alaska">(GMT-09:00) Alaska</option>
														<option value="Pacific Time (US & Canada)">(GMT-08:00)
															Pacific Time (US & Canada)</option>
														<option value="Arizona">(GMT-07:00) Arizona</option>
														<option value="Mountain Time (US & Canada)">(GMT-07:00)
															Mountain Time (US & Canada)</option>
														<option value="Central Time (US & Canada)"
															selected="selected">(GMT-06:00) Central Time (US
															& Canada)</option>
														<option value="Eastern Time (US & Canada)">(GMT-05:00)
															Eastern Time (US & Canada)</option>
														<option value="Indiana (East)">(GMT-05:00)
															Indiana (East)</option>
													</select>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label">Email:</label>
											<div class="col-lg-8">
												<input class="form-control" value="janesemail@gmail.com"
													type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Username:</label>
											<div class="col-md-8">
												<pre class="form-control">your username</pre>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">introduce:</label>
											<div class="col-md-8">
												<input class="form-control" value="inroduce" type="text">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Password:</label>
											<div class="col-md-8">
												<input class="form-control" value="11111122333"
													type="password">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">Confirm
												password:</label>
											<div class="col-md-8">
												<input class="form-control" value="11111122333"
													type="password">
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
									</form>
								</div>
							</div>
						</div>
					</div>


					<div class="tab-pane fade in" id="tab3">
						<div class="container">
							<h1 class="page-header">Message</h1>

							<!--           sender_userid 부분 -->
							<div class="row" style="text-align: center;">
								<c:forEach items="${messageList }" var="msg_List" varStatus="i">
									<div class="message_section container-fluid" id="msg_section${i.index }">
										<div class="sender col-lg-3" id="${i.index }">
											<input type="hidden" id="msg_condition_${i.index }" value="1">
											<div class="col-md-4">
												<img class="userid_img" src="img/profile.jpg" width="50px"
													height="50px">
											</div>
											<div class="col-md-8">
												<h6 class="sender_name" id="name${i.index }">${msg_List.msg_send_userid }</h6>
<%-- 												<label class="sender_name container-fluid control-label" id="${msg_List.msg_send_userid }">${msg_List.msg_send_userid }</label> --%>
											</div>
										</div>
										<div class="message" id="message_${i.index }">
											<div class="msg_cosntents col-lg-7">
												<label class="container-fluid control-label">
													${msg_List.msg_contents }</label>
											</div>
											<div class="msg_date col-lg-2">
												<label class="container-fluid control-label">${msg_List.msg_date }</label>
											</div>
										</div>
										<div class="msg_contents_box col-lg-9"
											id="msg_box_${i.index }">
												<div class="msg_box" id="msg_box_selectOne${i.index }">
													<div class="msg_list container-fluid">
														MessageList</div>
												</div>
											<div class="panel panel-default">
												<div class="panel-body">
													 <textarea class="form-control counted" name="msg_contents" id="send_msg_contents${i.index }"
															placeholder="Type in your message 메시지 입력" rows="5"
															style="margin-bottom: 10px; resize: none"></textarea>
														<h6 class="pull-right" id="counter">320 characters remaining</h6>
													<input class="btn btn-info send_msg_button" type="submit" value="Post New Message" id="submit_msg${i.index }">										
												</div>
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
										<li class="message default" id="paging_msg_${i.index }"><a
											href="#">${i.index}</a></li>
									</c:forEach>
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-right"></span></a></li>
								</ul>
							</div>


						</div>
					</div>















					<div class="tab-pane fade in" id="tab4">
						<div class="container">
							<h1 class="page-header">Matching</h1>

							<!--           Matching 부분 -->

							<h3 class="page-header">Request Matching</h3>

							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${matchingList }" var="mch_List">
									<c:if test="${mch_List.mch_code==0 }">
									<div class="matching_section container-fluid" id="mathing_section${i.index }">
										<div class="not_accept col-lg-3" id="${i.index }">
											<input type="hidden" id="req_match_condition_${i.index }"
												value="1">
											<div class="col-md-4">
												<img class="userid_img" src="img/profile.jpg" width="50px"
													height="50px">
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${mch_List.mch_t_userid }</label>
											</div>
										</div>
										<div class="request_matching" id="req_matching_${i.index }">
											<div class="request_mch_contents col-lg-7">
												<a href="board.do?b_idx=${mch_List.b_idx }"> <label
													class="board_title container-fluid control-label" id="${mch_List.b_idx }"> 해당 게시글 제목
														${mch_List.b_idx }</label>
												</a>
											</div>
											<div class="request_mch_date col-lg-2">
												<label class="matching_date container-fluid control-label" id="${mch_List.mch_date }">
													${mch_List.mch_date } </label>
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
													<input class="btn btn-info matcing_accept_answer" 
														id="${mch_List.mch_t_userid }_${i.index}" type="button" value="YES">
												</div>
												<div class="col-md-3">
													<input class="btn btn-info matcing_accept_answer" 
														id="${mch_List.mch_t_userid }_${i.index}" type="button" value="NO">
												</div>
												<div class="col-md-3"></div>
												<br> <br>
											</div>
										</div>
									</div>
									<br>
									</c:if>
								</c:forEach>
							</div>
							


							<h3 class="page-header">Accepted Matching</h3>
							<div class="row" style="text-align: center">
								<c:forEach varStatus="i" items="${matchingList }" var="mch_List">
									<c:if test="${mch_List.mch_code==1 }">
										<div class="matching_section container-fluid">
										<div class="accept col-lg-3" id="${i.index }">
											<input type="hidden" id="matched_condition_${i.index }"
												value="1">
											<div class="col-md-4">
												<img class="userid_img" src="img/profile.jpg" width="50px"
													height="50px">
											</div>
											<div class="col-md-8">
												<label class="container-fluid control-label">
													${mch_List.mch_t_userid }</label>
											</div>
										</div>
										<div class="accepted_matching"
											id="accepted_matching_${i.index }">
											<div class="accepted_mch_contents col-lg-7">
												<a href="board.do?b_idx=${mch_List.b_idx }"> <label
													class="container-fluid control-label"> 해당 게시글 제목
														${mch_List.b_idx }</label>
												</a>
											</div>
											<div class="accepted_mch_date col-lg-2">
												<label class="container-fluid control-label">
													${mch_List.mch_date }</label>
											</div>
										</div>
										</div>
									<br>
									</c:if>
								</c:forEach>
								<div class="add_matching_section container-fluid">
										<div class="add_accept col-lg-3">
											<div class="add_img col-md-4">
											</div>
											<div class="col-md-8">
												<label class="add_mch_t_userid container-fluid control-label">
													${mch_List.mch_t_userid }</label>
											</div>
										</div>
										<div class="add_accepted_matching"
											id="accepted_matching_${i.index }">
											<div class="add_accepted_mch_contents col-lg-7">
												<a class="add_href_b_idx" href="board.do?b_idx=${mch_List.b_idx }"> <label
													class="add_title container-fluid control-label"></label>
												</a>
											</div>
											<div class="accepted_mch_date col-lg-2">
												<label class="add_date container-fluid control-label"></label>
											</div>
										</div>
								</div>
								
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