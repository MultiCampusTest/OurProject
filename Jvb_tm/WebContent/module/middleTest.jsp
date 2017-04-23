<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<!--페이지-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!--페이지-->

		<div class="carousel-inner">
			<!--슬라이드1-->
			<div class="item active">
				<img src="../img/main/img01.jpg" style="width: 100%"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 1</h1>
						<p>텍스트 1</p>
					</div>
				</div>
			</div>
			<!--슬라이드1-->

			<!--슬라이드2-->
			<div class="item">
				<img src="../img/main/img02.jpg" style="width: 100%" data-src=""
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 2</h1>
						<p>텍스트 2</p>
					</div>
				</div>
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<img src="../img/main/img03.jpg" style="width: 100%" data-src=""
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 3</h1>
						<p>텍스트 3</p>
					</div>
				</div>
			</div>
			<!--슬라이드3-->

			<!--슬라이드4-->
			<div class="item">
				<img src="../img/main/img04.jpg" style="width: 100%" data-src=""
					alt="f slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 4</h1>
						<p>텍스트 4</p>
					</div>
				</div>
			</div>
			<!--슬라이드4-->
		</div>

		<!--이전, 다음 버튼-->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
</body>
</html>