<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel Maker</title>

<link href="css/mainSlide.css" rel="stylesheet" />

<script type="text/javascript">
	$('.carousel').carousel();
</script>

</head>
<body>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!--페이지 표시-->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>
		<!--페이지-->

		<div class="carousel-inner">
			<!--슬라이드1-->
			<div class="item active ">
				<img src="img/about/about01.png" style="width: 100%" alt="First slide">
			</div>
			<!--슬라이드1-->

			<!--슬라이드2-->
			<div class="item">
				<img src="img/about/about02.png" style="width: 100%" data-src=""
					alt="Second slide">
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<img src="img/about/about03.png" style="width: 100%" data-src=""
					alt="Third slide">
			</div>
			<!--슬라이드3-->

			<!--슬라이드4-->
			<div class="item">
				<img src="img/about/about04.png" style="width: 100%" data-src=""
					alt="fourth slide">
			</div>
			<!--슬라이드4-->
		</div>

		<!--이전, 다음 버튼-->
		<a class="carousel-control aaa_left" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span></a> 
		
		<a class="carousel-control aaa_right" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span></a>
	</div>

</body>
</html>