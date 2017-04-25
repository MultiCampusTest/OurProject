<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet" >

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

<style type="text/css">
/* Bootstrap Navigation Overriding by Readiz */
.navbar-default .navbar-collapse {
	background-color: #FFFFFF !important;
	border-color: #e7e7e7;
}

.navbar-default .navbar-brand {
	color: #F05F40;
}

</style>

</head>
<body>
<section>
	<nav id="mainNav"
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
				<li><a class="page-scroll" href="noticeList.do">Notice</a></li>
				<li><a class="page-scroll" href="">Travel</a></li>
				<li><a class="page-scroll" href="">Guide</a></li>
				<li><a class="page-scroll" href="">Review</a></li>
				<c:choose>
					<c:when test="${u_idx != null }">
						<li><a class="page-scroll" href=""><i class="fa fa-sign-in fa-1g" aria-hidden="true"></i>Login</a></li>				
					</c:when>
					<c:otherwise>
						<li><a class="page-scroll" onclick="location.href='myPage.do'"><i class="fa fa-sign-in fa-1g" aria-hidden="true"></i>회원님</a></li>
					</c:otherwise>
				</c:choose>
				<li><a class="page-scroll" href="myPage.do">MyPage</a></li>
				<li><a class="page-scroll" href="joinForm.do">Join</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>

	<!-- /.container-fluid --> </nav>
</section>
</body>
</html>