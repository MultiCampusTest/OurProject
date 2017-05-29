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

<script type="text/javascript">

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
						onclick="location.href='myPage.do'" data-toggle="tab">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<div class="hidden-xs">My Profile</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="update" class="btn btn-default"
						onclick="location.href='editProfile.do'" data-toggle="tab">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<div class="hidden-xs">Edit Profile</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="message" class="btn btn-default"
						onclick="location.href='message.do'" data-toggle="tab">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						<div class="hidden-xs">Message</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="g_matching" class="btn btn-default"
						onclick="location.href='guideMatching.do'" data-toggle="tab">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						<div class="hidden-xs">Guide Matching</div>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="t_matching" class="btn btn-default"
						onclick="location.href='travelMatching.do'" data-toggle="tab">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						<div class="hidden-xs">Travel Matching</div>
					</button>
				</div>
			</div>


			<c:import url="/WEB-INF/jsp/member/my_page_${url }.jsp"
				charEncoding="UTF-8">
<%-- 				<c:param name="mypage_include" value="${mypage_include }" /> --%>
			</c:import>
			
		

		</div>
	</div>

</body>
</html>