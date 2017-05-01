<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login-style.css">
<title>Insert title here</title>
</head>
<body>
<div class="margin-section-top"></div>
<div class="container">
    <div class="row">
    	<div class="text-title">
    		<h1>Travel Maker</h1>
    	</div>
    
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <img class="profile-img" src="img/profile.jpg">
                <form class="form-signin">
                <input type="text" class="form-control" placeholder="Account ID" required autofocus>
                <input type="password" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Sign in</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
                	<a href="#" class="pull-right need-help">Forgot password</a><span class="clearfix"></span>
                </form>
            </div>
            <a href="joinForm.do" class="text-center new-account">Create an account</a>
        </div>
    </div>
</div>
<div class="margin-section-bottom"></div>
</body>
</html>