<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>


<!-- Theme JavaScript -->
<script src="js/creative.min.js"></script>


<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Theme CSS -->
<link href="css/creative.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	$(document).ready(function() {

		$('.dropdown,.dropdown-menu').hover(function() {
			if ($(window).width() >= 768) {
				$(this).addClass('open').trigger('shown.bs.dropdown', relatedTarget)
				return false;
			}

		}, function() {
			if ($(window).width() >= 768) {
				$(this).removeClass('open').trigger('hidden.bs.dropdown', relatedTarget)
				return false;
			}
		})

	})
</script>

<style type="text/css">
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}

</style>

</head>
<body>
	<section> <nav id="mainNav"
		class="navbar navbar-default navbar-collapse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="main.do">Travel Maker</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">



				<li><a href="noticeList.do">Notice</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Travel</a>
					<ul class="dropdown-menu">
						<li><a href="travelList.do">All List</a></li>
						<li><a href="travelList.do?sub_category=five">5 days</a></li>
						<li><a href="travelList.do?sub_category=ten">10 days</a></li>
						<li><a href="travelList.do?sub_category=more">15 days</a></li>
						<li class="divider"></li>
						<!-- 						<li class="dropdown-header">네비게이션 헤더</li> -->
						<li><a href="travelList.do?loc_category=seoul">seoul</a></li>
						<li><a href="travelList.do?loc_category=incheon">incheon</a></li>
						<li><a href="travelList.do?loc_category=daejeon">daejeon</a></li>
						<li><a href="travelList.do?loc_category=gwangju">gwangju</a></li>
						<li><a href="travelList.do?loc_category=daegu">daegu</a></li>
						<li><a href="travelList.do?loc_category=busan">busan</a></li>
						<li><a href="travelList.do?loc_category=jeju">jeju</a></li>
						<li><a href="travelList.do?loc_category=gangwon">gangwon</a></li>
						<li><a href="travelList.do?loc_category=gyeonggi">gyeonggi</a></li>
						<li><a href="travelList.do?loc_category=chungcheong">chungcheong</a></li>
						<li><a href="travelList.do?loc_category=jeonla">jeonla</a></li>
						<li><a href="travelList.do?loc_category=kyeongsang">kyeongsang</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Guide</a>
					<ul class="dropdown-menu">
						<li><a href="guideList.do">All List</a></li>
						<li><a href="guideList.do?sub_category=five">5 days</a></li>
						<li><a href="guideList.do?sub_category=ten">10 days</a></li>
						<li><a href="guideList.do?sub_category=more">15 days</a></li>
						<li class="divider"></li>
						<!-- 						<li class="dropdown-header">네비게이션 헤더</li> -->
						<li><a href="guideList.do?loc_category=seoul">seoul</a></li>
						<li><a href="guideList.do?loc_category=incheon">incheon</a></li>
						<li><a href="guideList.do?loc_category=daejeon">daejeon</a></li>
						<li><a href="guideList.do?loc_category=gwangju">gwangju</a></li>
						<li><a href="guideList.do?loc_category=daegu">daegu</a></li>
						<li><a href="guideList.do?loc_category=busan">busan</a></li>
						<li><a href="guideList.do?loc_category=jeju">jeju</a></li>
						<li><a href="guideList.do?loc_category=gangwon">gangwon</a></li>
						<li><a href="guideList.do?loc_category=gyeonggi">gyeonggi</a></li>
						<li><a href="guideList.do?loc_category=chungcheong">chungcheong</a></li>
						<li><a href="guideList.do?loc_category=jeonla">jeonla</a></li>
						<li><a href="guideList.do?loc_category=kyeongsang">kyeongsang</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="reviewList.do">Review</a>
					<ul class="dropdown-menu">
						<li><a href="reviewList.do">All List</a></li>
						<li><a href="reviewList.do?sub_category=five">5 days</a></li>
						<li><a href="reviewList.do?sub_category=ten">10 days</a></li>
						<li><a href="reviewList.do?sub_category=more">15 days</a></li>
						<li class="divider"></li>
						<!-- 						<li class="dropdown-header">네비게이션 헤더</li> -->
						<li><a href="reviewList.do?sub_category=food">food</a></li>
						<li><a href="reviewList.do?sub_category=shopping">shopping</a></li>
						<li><a href="reviewList.do?sub_category=stay">stay</a></li>
						<li><a href="reviewList.do?sub_category=tour">tour</a></li>
					</ul></li>

				<c:choose>
					<c:when test="${userid != null }">
						<li><a class="page-scroll" href="myPage.do"><i class="fa fa-user" aria-hidden="true"></i> MYPAGE</a></li>
						<li><a class="page-scroll" href="logout.do"><i class="fa fa-times" aria-hidden="true"></i> SIGN OUT</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="page-scroll" href="loginForm.do"><i class="fa fa-plane" aria-hidden="true"></i> &nbsp;SIGN IN</a></li>						
						<li><a class="page-scroll" href="joinForm.do"><i class="fa fa-user-plus" aria-hidden="true"></i> &nbsp;SIGN UP</a></li>
					</c:otherwise>
				</c:choose>





			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>

	<!-- /.container-fluid --> </nav> </section>
</body>
</html>