<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 	jQuery library (served from Google) -->
<script src="vendor/jquery/jquery.min.js"></script>
<!-- bxSlider Javascript file -->
<script src="vendor/jquery/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="vendor/jquery/jquery.bxslider.css" rel="stylesheet" />

<script type="text/javascript">
	$(window).ready(function() {
		$('.bxslider').bxSlider({
			mode : 'fade', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			speed : 800, //default:500 이미지변환 속도
			auto : true, //default:false 자동 시작
			autoControls : true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
			pager: false // 페이지 동그라미 여부, true 보이게
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
</body>
</html>