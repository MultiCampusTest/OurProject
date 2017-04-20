<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/creative.min.css" rel="stylesheet">

<!-- bxSlider CSS file -->
<link href="vendor/jquery/jquery.bxslider.css" rel="stylesheet" />

<script type="text/javascript">
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			mode : 'fade', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			speed : 1000, //default:500 이미지변환 속도
			auto : true, //default:false 자동 시작
			autoControls : true //default:false 정지,시작 콘트롤 노출, css 수정이 필요
		});
	});
</script>

</head>
<body>
	<ul class="bxslider">
		<li><img src="img/main/img01.jpg" style="width: 100%" /></li>
		<li><img src="img/main/img02.jpg" style="width: 100%" /></li>
		<li><img src="img/main/img03.jpg" style="width: 100%" /></li>
		<li><img src="img/main/img04.jpg" style="width: 100%" /></li>
	</ul>


	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- 	jQuery library (served from Google) -->
	<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
	<!-- bxSlider Javascript file -->
	<script src="vendor/jquery/jquery.bxslider.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/creative.min.js"></script>
</body>
</html>