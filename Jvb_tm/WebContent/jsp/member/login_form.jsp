 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/loginForm.css">
<script type="text/javascript">
	$(document).ready(function(){
	    var userid = getCookie("userid");
	    $('#userid').val(userid); 
	     
	    if($('#userid').val() != "") {
	        $("#remember").attr("checked", true);
	    }
	     
	    $("#remember").change(function(){
	        if($("#remember").is(":checked")){
	            var userid = $('#userid').val();
	            setCookie("userid", userid, 7);
	        }else{
	            deleteCookie("userid");
	        }
	    });
	     
	    $('#userid').keyup(function(){
	        if($("#remember").is(":checked")){
	            var userid = $('#userid').val();
	            setCookie("userid", userid, 7);
	        }
	    });
	 
		function setCookie(cookieName, value, exdays){
	   		var exdate = new Date();
	  		exdate.setDate(exdate.getDate() + exdays);
	    	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    	document.cookie = cookieName + "=" + cookieValue;
		}
	 
		function deleteCookie(cookieName){
	    	var expireDate = new Date();
	    	expireDate.setDate(expireDate.getDate() - 1);
	    	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
	 
		function getCookie(cookieName) {
	    	cookieName = cookieName + '=';
	    	var cookieData = document.cookie;
	    	var start = cookieData.indexOf(cookieName);
	    	var cookieValue = '';
	    	if(start != -1){
	        	start += cookieName.length;
	        	var end = cookieData.indexOf(';', start);
	        	if(end == -1)end = cookieData.length;
	        	cookieValue = cookieData.substring(start, end);
	    	}
	    	return unescape(cookieValue);
		}
	});
</script>
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
						<input type="email" class="form-control" placeholder="Email" id="userid" name="userid" required="">
						<input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd" required="">

						<div>
							<span class="remember"><input type="checkbox" value="remember" id="remember">Remember me</span>
							<span style="float: right"><a href="#">Forgot password</a></span>
						</div><br>
						<button type="submit"  id="loginform_submit" class="btn btn-lg btn-primary btn-block">SIGN IN</button>
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