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
	    $('#form_userid').val(userid); 
	     
	    if($('#form_userid').val() != "") {
	        $('#form_checkbox').attr("checked", true);
	    }
	     
	    $('#form_checkbox').change(function(){
	        if($('#form_checkbox').is(":checked")){
	            var userid = $('#form_userid').val();
	            setCookie("userid", userid, 7);
	        }else{
	            deleteCookie("userid");
	        }
	    });
	     
	    $('#form_userid').keyup(function(){
	        if($('#form_checkbox').is(":checked")){
	            var userid = $('#form_userid').val();
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
		
		
		
		
		$('#form_submit').click(function(){
			var logEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if($('#form_userid').val() == '') {
				$('#form_msg').html('<font color="#FF605A">enter email</font>');
				$('#form_userid').focus();
				return false;
			} else if( !logEmail.test($('#form_userid').val()) ) {
				$('#form_msg').html('<font color="#FF605A">wrong email</font>');
				$('#form_userid').focus();
				return false;
			} else if($('#form_pwd').val() == '') {
				$('#form_msg').html('<font color="#FF605A">enter password</font>');
				$('#form_pwd').focus();
				return false;
			} else {
				$('#form_msg').text('');
			}
		});
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
						<input type="text" class="form-control" placeholder="Email" id="form_userid" name="userid">
						<input type="password" class="form-control" placeholder="Password" id="form_pwd" name="pwd">

						<div>
							<span class="remember"><input type="checkbox" value="remember" id="form_checkbox">Remember me</span>
							<span style="float: right"><a href="findPassword.do">Forgot password</a></span>
						</div><br>
						<button type="submit"  id="form_submit" class="btn btn-lg btn-primary btn-block">SIGN IN</button>
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