<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap-theme.min.css">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	
</head>
<body>
	<!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 -->
	<div class="row">
		<div class="col-xs-12 col-md-8 btn-danger">.col-xs-12 .col-md-8</div>
		<div class="col-xs-6 col-md-4 btn-default">.col-xs-6 .col-md-4</div>
	</div>
	<br>
	<br>
	<br>

	<!-- 컬럼들은 모바일에서 50% 너비로 시작하고 데스크탑에서는 33.3% 너비가 됩니다 -->
	<div class="row">
		<div class="col-xs-6 col-md-4 btn-primary">.col-xs-6 .col-md-4</div>
		<div class="col-xs-6 col-md-4 btn-warning">.col-xs-6 .col-md-4</div>
		<div class="col-xs-6 col-md-4 btn-info">.col-xs-6 .col-md-4</div>
	</div>
	<br>
	<br>
	<br>

	<!-- 컬럼들은 모바일과 데스크탑에서 항상 50% 너비가 됩니다 -->
	<div class="row">
		<div class="col-xs-6 btn-success">.col-xs-6</div>
		<div class="col-xs-6 btn-danger">.col-xs-6</div>
	</div>
	<br>
	<br>
	<br>


</body>

</html>