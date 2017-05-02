<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login-style.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//아이디 쿠키 저장
	    var userid = getCookie("userid");
	    $("input[type=text]").val(userid); 
	     
	    if($("input[type=text]").val() != ""){
	        $("#remember").attr("checked", true);
	    }
	     
	    $("#remember").change(function(){
	        if($("#remember").is(":checked")){
	            var userid = $("input[type=text]").val();
	            setCookie("userid", userid, 7);
	        }else{
	            deleteCookie("userid");
	        }
	    });
	     
	    $("input[type=text]").keyup(function(){
	        if($("#remember").is(":checked")){
	            var userid = $("input[type=text]").val();
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
		

		
		$('input[type]').on('blur', function(){
			if($(this).val() != '')
				$('#msg').text('');
		});
		
		$('button[type=submit]').on('click', function procEvent(){
			var id = $('#userid').val();
			var pw = $('#pwd').val();
			if(id == '') {
				$('#msg').html('<font color="#FF605A">Enter account id</font>');
				$('#userid').focus();
				return false;
			} else if(pw == '') {
				$('#msg').html('<font color="#FF605A">Enter password</font>');
				$('#pwd').focus();
				return false;
			}
			$('msg').remove();
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
				<h1>Travel Maker</h1>
			</div>

			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="account-wall">
					<img class="profile-img" src="img/profile.jpg">
					<form action="login.do" method="post" class="form-signin">
						<input type="text" class="form-control" placeholder="Userid" id="userid" name="userid">
						<input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd">
						<div id="msg"></div>
						<button type="submit" class="btn btn-lg btn-primary btn-block" onClick="return procEvent();">Sign in</button>
						<label class="checkbox pull-left"><input type="checkbox" value="remember" id="remember">Remember me</label>
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