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
<script src="js/msgCount.js"></script>


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

<!-- Facebook API -->
<script type="text/javascript" src="js/facebookAPI.js"></script>

<!-- scrollreveal  -->
<!-- <script src="vendor/scrollreveal/scrollreveal.min.js"></script> -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	function popup() {
		var uri = 'searchAccount.do'
		var width = 520;
		var height = 470;
		var top = (screen.availHeight - height) / 2;
		var left = (screen.availWidth - width) / 2;
		var strFeature;
		strFeature = 'height=' + height + ',width=' + width +

			',menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top=' + top + ',left=' + left

		window.open(uri, 'search', strFeature);
	}

	

	$(document).ready(function() {
		
		msgCount();

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
		});

		var userid = getCookie("userid");
		$('#top_userid').val(userid);

		if ($('#top_userid').val() != "") {
			$('#top_checkbox').attr("checked", true);
		}

		$('#top_checkbox').change(function() {
			if ($('#top_checkbox').is(":checked")) {
				var userid = $('#top_userid').val();
				setCookie("userid", userid, 7);
			} else {
				deleteCookie("userid");
			}
		});

		$('#top_userid').keyup(function() {
			if ($('#top_checkbox').is(":checked")) {
				var userid = $('#top_userid').val();
				setCookie("userid", userid, 7);
			}
		});

		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}

		$('#top_submit').click(function() {
			var logEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if ($('#top_userid').val() == '') {
				$('#top_msg').html('<font color="#FF605A">enter email</font>');
				$('#top_userid').focus();
				return false;
			} else if (!logEmail.test($('#top_userid').val())) {
				$('#top_msg').html('<font color="#FF605A">wrong email</font>');
				$('#top_userid').focus();
				return false;
			} else if ($('#top_pwd').val() == '') {
				$('#top_msg').html('<font color="#FF605A">enter password</font>');
				$('#top_pwd').focus();
				return false;
			} else {
				$('#top_msg').text('');

				var id = $('#top_userid').val();
				var pass = $('#top_pwd').val();
				$.ajax({
					url : 'loginProc.do',
					type : 'POST',
					data : {
						userid : id,
						pwd : pass
					},
					dataType : 'json',
					success : function(data) {
						if (data.result) {
							location.href = "main.do";
						} else {
							alert("you typed email or password wrong");
							location.href = "loginForm.do"
						}
					},
					error : function() {
						alert('data error');
					}
				});
			}
		});
	});
</script>

<style type="text/css">
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
</style>

</head>
<body>
<input type="text" value="hello" id="hello">
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


				<li><a href="about.do">About</a></li>

				<li><a href="noticeList.do">Notice</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Travel</a>
					<ul class="dropdown-menu">
						<li><a href="travelList.do">All List</a></li>
						<li><a href="travelList.do?subCategory=five">5 Day</a></li>
						<li><a href="travelList.do?subCategory=ten">10 Days</a></li>
						<li><a href="travelList.do?subCategory=t_more">10 Days+</a></li>
						<li class="divider"></li>
						<!-- 						<li class="dropdown-header">네비게이션 헤더</li> -->
						<li><a href="travelList.do?locCategory=seoul">SEOUL</a></li>
						<li><a href="travelList.do?locCategory=incheon">INCHEON</a></li>
						<li><a href="travelList.do?locCategory=daejeon">DAEJEON</a></li>
						<li><a href="travelList.do?locCategory=gwangju">GWANGJU</a></li>
						<li><a href="travelList.do?locCategory=daegu">DAEGU</a></li>
						<li><a href="travelList.do?locCategory=busan">BUSAN</a></li>
						<li><a href="travelList.do?locCategory=jeju">JEJU-DO</a></li>
						<li><a href="travelList.do?locCategory=gangwon">GANGWON-DO</a></li>
						<li><a href="travelList.do?locCategory=gyeonggi">GYEONGGI-DO</a></li>
						<li><a href="travelList.do?locCategory=chungcheong">HUNGCHEONG-DO</a></li>
						<li><a href="travelList.do?locCategory=jeonla">JEOLLA-DO</a></li>
						<li><a href="travelList.do?locCategory=kyeongsang">GYEONGSANG-DO</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Guide</a>
					<ul class="dropdown-menu">
						<li><a href="guideList.do">All List</a></li>
						<li><a href="guideList.do?subCategory=one">1 Day</a></li>
						<li><a href="guideList.do?subCategory=two">2 Days</a></li>
						<li><a href="guideList.do?subCategory=three">3 Days</a></li>
						<li><a href="guideList.do?subCategory=four">4 Days</a></li>
						<li><a href="guideList.do?subCategory=g_more">5 Days+</a></li>
						<li class="divider"></li>
						<!-- 						<li class="dropdown-header">네비게이션 헤더</li> -->
						<li><a href="guideList.do?locCategory=seoul">SEOUL</a></li>
						<li><a href="guideList.do?locCategory=incheon">INCHEON</a></li>
						<li><a href="guideList.do?locCategory=daejeon">DAEJEON</a></li>
						<li><a href="guideList.do?locCategory=gwangju">GWANGJU</a></li>
						<li><a href="guideList.do?locCategory=daegu">DAEGU</a></li>
						<li><a href="guideList.do?locCategory=busan">BUSAN</a></li>
						<li><a href="guideList.do?locCategory=jeju">JEJU-DO</a></li>
						<li><a href="guideList.do?locCategory=gangwon">GANGWON-DO</a></li>
						<li><a href="guideList.do?locCategory=gyeonggi">GYEONGGI-DO</a></li>
						<li><a href="guideList.do?locCategory=chungcheong">CHUNGCHEONG-DO</a></li>
						<li><a href="guideList.do?locCategory=jeolla">JEOLLA-DO</a></li>
						<li><a href="guideList.do?locCategory=gyeongsang">GYEONGSANG-DO</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="reviewList.do">Review</a>
					<ul class="dropdown-menu">
						<li><a href="reviewList.do">All List</a></li>
						<!-- 						<li><a href="guideList.do?subCategory=one">1 Day</a></li> -->
						<!-- 						<li><a href="guideList.do?subCategory=two">2 Days</a></li> -->
						<!-- 						<li><a href="guideList.do?subCategory=three">3 Days</a></li> -->
						<!-- 						<li><a href="guideList.do?subCategory=four">4 Days</a></li> -->
						<!-- 						<li><a href="guideList.do?subCategory=guide_more">5 Days+</a></li> -->
						<!-- 						<li class="divider"></li> -->
						<!-- 						<li class="dropdown-header">네비게이션 헤더</li> -->
						<li><a href="reviewList.do?subCategory=food">Food</a></li>
						<li><a href="reviewList.do?subCategory=shopping">Shopping</a></li>
						<li><a href="reviewList.do?subCategory=stay">Stay</a></li>
						<li><a href="reviewList.do?subCategory=tour">Tour</a></li>
					</ul></li>

				<c:choose>
					<c:when test="${userid != null }">
						<li><a class="page-scroll msg_count" href="myPage.do" id="${useid }">MYPAGE &nbsp;<i
								class="fa fa-cog" aria-hidden="true" id="msg_ReadCount"></i>
								&nbsp;
								<i style="display: none; color:#FF605A" class="glyphicon glyphicon-envelope msg_count_icon" aria-hidden="true"></i>
								<span style="color: #FF605A" id="msgReadCountNum"></span>
								</a></li>
						<li><a class="page-scroll" href="logout.do">SIGN
								OUT&nbsp;<i class="fa fa-times-circle" aria-hidden="true"></i>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="page-scroll" href="certiForm.do">SIGN UP</a></li>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="loginForm.do"
								class="dropdown-toggle" data-toggle="dropdown">Sign in <b
									class="caret"></b></a>
								<ul class="dropdown-menu"
									style="padding: 15px; min-width: 250px;">
									<li>
										<div class="row">
											<div class="col-md-12">
												<!-- 												<form action="loginProc.do" method="post" class="form" role="form" accept-charset="UTF-8"> -->
												<div class="form">
													<div class="form-group">
														<label class="sr-only" for="exampleInputEmail2">Email</label>
														<input type="text" class="form-control" id="top_userid"
															name="userid" placeholder="Email">
													</div>
													<div class="form-group">
														<label class="sr-only" for="exampleInputPassword2">Password</label>
														<input type="password" class="form-control" id="top_pwd"
															name="pwd" placeholder="Password">
													</div>
													<div class="checkbox">
														<label><input type="checkbox" id="top_checkbox">
															Remember me</label>
													</div>
													<div class="form-group">
														<button type="button" id="top_submit"
															class="btn btn-primary btn-block">Sign in</button>
														<div id="top_msg" style="text-align: center"></div>
													</div>
												</div>
												<!-- 												</form> -->
											</div>
										</div>
									</li>
									<li class="divider"></li>
									<li>
										<div class="row">
											<div class="col-md-12" style="text-align: center">
												<a href="javascript:popup();">Forgot your account?</a>
											</div>
										</div>
								</ul></li>
						</ul>
					</c:otherwise>
				</c:choose>


			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>

	<!-- /.container-fluid --> </nav> </section>
</body>
</html>