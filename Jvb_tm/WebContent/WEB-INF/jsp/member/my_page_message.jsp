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
<script src="js/msgCount.js"></script>
<script src="js/message.js"></script>
<script src="js/profile.js"></script>
<!--   커스텀 CSS -->
<link href="css/profile.css" rel="stylesheet">
<link rel="stylesheet" href="css/review.css">

<title>Travel Maker</title>

<script type="text/javascript">


</script>

<style type="text/css">
	
	.selector {word-break:break-all;}
	
	.msg_list{
		word-break:break-all;
		white-space:pre-line;
	}

</style>

</head>
<body>

	<div class="tab-pane fade in" id="tab3">
		<div class="container">
			<h1 class="page-header">Message</h1>

			<!--           sender_userid 부분 -->
			<div class="row" style="text-align: center;">
				<c:forEach items="${messageList }" var="msg_List" varStatus="i">
					<div class="message_section container-fluid"
						id="msg_section${i.index }">
						<div class="sender col-lg-3 col-md-3" id="${i.index }">
							<input type="hidden" id="msg_condition_${i.index }" value="1">
							<div class="col-lg-4 col-md-4">
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
							<div class="col-lg-8 col-md-8">
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
							<div class="msg_cosntents col-lg-7 col-md-7">
								<label class="container-fluid control-label">
									${msg_List.msg_contents }</label>
							</div>
							<div class="msg_date col-lg-2 col-md-2">
								<label class="container-fluid control-label">
									${msg_List.msg_date }</label>
							</div>
						</div>
						<div class="msg_contents_box col-lg-9" id="msg_box_${i.index }">
							<input type="hidden" id="msg_box_condition${i.index }" value="1">
							<div class="msg_box" id="msg_box_selectOne${i.index }">
								<div class="msg_list container-fluid">MessageList</div>
							</div>
							<div class="panel panel-default">
<!-- 								<form action="sendMessage.do" method="post" name="form"> -->
									<div class="panel-body">
										<c:if test="${msg_List.msg_send_userid == userid}">
											<input type="hidden" name="msg_receive_userid" value="${msg_List.msg_receive_userid }">
										</c:if>
										<c:if test="${msg_List.msg_send_userid != userid}">
											<input type="hidden" name="msg_receive_userid" value="${msg_List.msg_send_userid }">
										</c:if>
										<input type="hidden" value="">
										<textarea class="sending_msg_form form-control counted"
											name="msg_contents" id="send_msg_contents${i.index }"
											placeholder="Type in your message 메시지 입력" rows="5"
											style="margin-bottom: 10px; resize: none"></textarea>
										<span class="remain_sending_msg pull-right"
											id="remain_sending_msg${i.index }">1000 characters
											remaining</span>
											<input class="btn btn-info send_msg_button" type="button" value="Post New Message"
											id="submit_msg${i.index }">
									</div>
<!-- 								</form> -->
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
			<!-- 							<div class="row" style="text-align: center" id='addbtn'> -->
			<!-- 								<div class="btns"> -->
			<%-- 																		<a href="javascript:moreList();" class="btn btn-primary more_msg" id='addbtn${msg_pre_count }'>MORE</a> --%>
			<!-- 									<div class="btn btn-primary more_msg_list" -->
			<%-- 										id='addbtn${msg_pre_count }'>MORE</div> --%>
			<!-- 								</div> -->
			<!-- 							</div> -->



		</div>
	</div>
</body>
</html>