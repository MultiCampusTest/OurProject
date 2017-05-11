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
	    $("input[type=text]").val(userid); 
	     
	    if($("input[type=text]").val() != "") {
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
	});
</script>
<title>Sign in</title>
</head>
<body>
<script>
window.fbAsyncInit = function() {
    FB.init({
      appId      : '534503966938051',
      xfbml      : true,
      version    : 'v2.9'
    });
    FB.AppEvents.logPageView();
  };
  
  function fbAjaxRequest(response) {
	  $.ajax({
		 url : 'idCheck.do',
		 type : 'POST',
		 data : {userid : response.id},
		 dataType : 'json',
		 success : function(data) {
			if(data.result)
				alert('이미 가입한 아이디');
			else
				alert('가입 가능');
				var form = document.createElement("form");
				form.setAttribute("method", "get");
				form.setAttribute("action", "joinForm.do");
				for(var key in response) {
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", key);
					hiddenField.setAttribute("value", response[key]);
					form.appendChild(hiddenField);
				}
				document.body.appendChild(form);
				form.submit();
		}, error : function() {
			alert('data error');
		}
	});
  }
  
  function facebook_btn() {
	  FB.login(function(response) {
		    if (response.authResponse) {
		    	console.log('Welcome!  Fetching your information.... ');
		    	FB.api('/me?fields=id,email,first_name,last_name,gender', function(response) {
		    		fbAjaxRequest(response);
		    	});
		    } else {
		     console.log('User cancelled login or did not fully authorize.');
		    }
	  }, { scope: 'public_profile, email',  return_scopes: true });
  };
  
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

	<div class="margin-section-top"></div>
	<div class="container">
		<div class="row">
			<div class="text-title">
				<h1>Travel Maker</h1>
			</div>

			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="account-wall">
					<img class="profile-img" src="img/profile.jpg">
					<form action="loginProc.do" method="post" class="form-signin">
						<input type="text" class="form-control" placeholder="Userid" id="userid" name="userid">
						<input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd">

						<div>
							<span class="remember"><input type="checkbox" value="remember" id="remember">Remember me</span>
							<span class="need-help"><a href="#" id="need-help">Forgot password</a></span>
						</div><br>
						<button type="submit"  id="loginform_submit" class="btn btn-lg btn-primary btn-block" onClick="return procEvent();">SIGN IN</button>
					</form>
				<a href="joinForm.do" class="text-center new-account">Create an account</a>
				</div>
				<br>
			</div>
		</div>
	</div>
	<div class="margin-section-bottom"></div>
</body>
</html>