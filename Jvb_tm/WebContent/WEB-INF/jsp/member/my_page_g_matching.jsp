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
<script src="js/matching.js"></script>
<!--   커스텀 CSS -->
<link href="css/profile.css" rel="stylesheet">
<link rel="stylesheet" href="css/review.css">

<title>Travel Maker</title>

<script type="text/javascript">



</script>

</head>
<body>

	<div class="tab-pane fade in" id="tab4">
		<div class="container">
			<h1 class="page-header">Guide Matching</h1>

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
							<div class="guide_request_matching"
								id="guide_req_matching_${i.index }">
								<div class="guide_request_mch_contents col-lg-7">
									<a href="guideView.do?boardIdx=${hold_mch_List.b_idx }"> <label
										class="guide_board_title container-fluid control-label"
										id="${hold_mch_List.b_idx }"> 해당 게시글 제목
											${hold_mch_List.b_idx }</label>
									</a>
								</div>
								<div class="guide_request_mch_date col-lg-2">
									<label
										class="guide_matching_date container-fluid control-label"
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
					<br
						id="guide_br_mathing_section${i.index }_${hold_mch_List.b_idx }">
				</c:forEach>
			</div>







			<h3 class="page-header">Guide Accepted Matching</h3>
			<div class="row" style="text-align: center">
				<c:forEach varStatus="i" items="${acc_matchingList }"
					var="acc_mch_List">
					<c:if test="${acc_mch_List.mch_g_userid==userid }">
						<div class="guide_matching_section container-fluid">
							<div class="guide_accept col-lg-3" id="${i.index }">
								<input type="hidden" id="guide_matched_condition_${i.index }"
									value="1">
								<div class="col-md-4">
									<img class="userid_img"
										src="imageProfileView.do?img_code=${acc_mch_List.mch_t_userid }"
										width="50px" height="50px">
									<!-- 													<img class="userid_img" src="img/profile.jpg" width="50px" -->
									<!-- 														height="50px"> -->
								</div>
								<div class="col-md-8">
									<label class="container-fluid control-label">
										${acc_mch_List.mch_t_userid }</label>
								</div>
							</div>
							<div class="guide_accepted_matching"
								id="guide_accepted_matching_${i.index }">
								<div class="guide_accepted_mch_contents col-lg-7">
									<a href="guideView.do?boardIdx=${acc_mch_List.b_idx }"> <label
										class="container-fluid control-label"> 해당 게시글 제목
											${acc_mch_List.b_idx }</label>
									</a>
								</div>
								<div class="guide_accepted_mch_date col-lg-2">
									<label class="container-fluid control-label">
										${acc_mch_List.mch_date }</label>
								</div>
							</div>
						</div>
					</c:if>
					<br>
				</c:forEach>
			</div>
			<div class="row guide_add_matching_section"
				style="text-align: center"></div>




			<br> <br>

			<!-- 							<div class="jb-center"> -->
			<!-- 								<ul class="pagination"> -->
			<!-- 									<li><a href="#"><span -->
			<!-- 											class="glyphicon glyphicon-chevron-left"></span></a></li> -->
			<%-- 									<c:forEach begin="1" end="10" step="1" varStatus="i"> --%>
			<%-- 										<li class="matching default" id="paging_mch_${i.index }"><a --%>
			<%-- 											href="#">${i.index}</a></li> --%>
			<%-- 									</c:forEach> --%>
			<!-- 									<li><a href="#"><span -->
			<!-- 											class="glyphicon glyphicon-chevron-right"></span></a></li> -->
			<!-- 								</ul> -->
			<!-- 							</div> -->
		</div>
	</div>
</body>
</html>