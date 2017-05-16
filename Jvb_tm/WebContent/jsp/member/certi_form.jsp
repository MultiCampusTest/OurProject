<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/stepwizard.css">

<title>Insert title here</title>
<!-- 페이스북 -->
<script type="text/javascript" src="js/facebookAPI.js"></script>

<!-- 구글 -->
<script type="text/javascript" src="js/googleAPI.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>

<!-- 카카오 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="js/kakaoAPI.js"></script>

<!-- 네이버 -->
<script type="text/javascript"	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"	charset="utf-8"></script>

</head>
<body>
<div style="margin-top: 5%"></div>
<div class="stepwizard">
    <div class="stepwizard-row"">
        <div class="stepwizard-step">
            <button type="button" class="btn btn-primary btn-circle">1</button>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">2</button>
            <p>Step 2</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">3</button>
            <p>Step 3</p>
        </div> 
    </div>
</div>
<div style="margin-top: 5%"></div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h1 style="text-align: center; font-style: bold">Verify your identification :)</h1>
				<br>
				<p style="text-align: center; font-style: bold">
					We require you to log in social service for checking your identification
				</p>
				<div style="margin-top: 10%"></div>
				<div class="form-group" style="text-align: center">
					<div id="gSignInWrapper">
					<a href="javascript:facebook_btn()"><img id="profile" src="img/facebook.png"></a>
						<a href="#" id="customBtn" class="customGPlusSignIn">
							<img id="profile" src="img/google.png">
							<script>startApp();</script>
						</a>
					<a href="javascript:loginWithKakao()"><img id="profile" src="img/kakaotalk.png"></a>
					<a href="javascript:document.getElementById('naver_id_login_anchor').click();"><img src="img/naver.png"></a>
					<div id="naver_id_login" style="display: none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10%"></div>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("qWsYFF9T4cuKU1gpSWN1","http://localhost:8080/Jvb_tm/jsp/member/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 40);
		naver_id_login.setDomain("http://localhost:8080/Wawa/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
</body>
</html>