 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 로그인 폼 스타일 -->
<link rel="stylesheet" href="css/loginForm.css">
<!-- 예외처리 -->
<script type="text/javascript" src="js/loginException.js"></script>
<title>Sign in</title>
</head>
<body>
	<div class="margin-section-top"></div>
	<div class="container">
		<div class="row">
			<div class="text-title">
				<h1>Sign in</h1>
			</div>
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="account-wall">
					<img class="profile-img" src="img/profile.jpg">
					<form action="loginProc.do" method="post" class="form-signin">
						<input type="text" class="form-control" placeholder="Email" id="form_userid" name="userid">
						<input type="password" class="form-control" placeholder="Password" id="form_pwd" name="pwd">
						<div>
							<span class="remember">
								<input type="checkbox" value="remember" id="form_checkbox">Remember me
							</span>
							<span style="float: right"><a href="findPassword.do">Forgot password</a></span>
						</div>
						<br>
						<button type="submit" id="form_submit" class="btn btn-lg btn-primary btn-block">SIGN IN</button>
						<div id="form_msg" style="text-align: center"></div>
					</form>
					<a href="certiForm.do" class="text-center new-account">Create an account</a>
				</div>
				<br>
			</div>
		</div>
	</div>
	<div class="margin-section-bottom"></div>
</body>
</html>