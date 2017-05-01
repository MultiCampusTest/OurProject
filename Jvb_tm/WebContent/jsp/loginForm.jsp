<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/login-style.css">

<script>
	$(document).ready(function() {
	
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				testAPI();
			} else {
				document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
			}
		}

		function checkLoginState() {
				FB.getLoginStatus(function(response) {
					statusChangeCallback(response);
				});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '534503966938051',
				cookie : true,
				xfbml : true,
				version : 'v2.8'
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function testAPI() {
			//     console.log('Welcome!  Fetching your information.... ');
			FB.api('/me', {
			fields : 'id,first_name,last_name,email,gender'
		}, function(response) {
			console.log('Successful login for: '+ response.name);
			console.log(JSON.stringify(response));
			$('#first_name').text(response.first_name);
			$('#last_name').text(response.last_name);
			$('#email').text(response.email);
			$('#gender').text(response.gender);
			$('#image').text('http://graph.facebook.com/' + response.id + '/picture?type=large');
			});
		}
	});
</script>
</head>
<body class="container-fluid">
<div class="section-start"></div>
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="box">
				
				<div class="logo">
					<img src="http://static2.traveltek.net/images/www.travelmaker.co.uk/img/Travelmakerlogo.gif">
				</div>
				
				<form action="login.do">
					<div class="divider-form"></div>

					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label>
						<input type="text" class="form-control" id="exampleInputEmail1" name="userid" placeholder="Enter email">
					</div>

					<div class="divider-form"></div>

					<div class="form-group">
						<label for="exampleInputPassword1">Password</label>
						<input type="password" class="form-control" id="exampleInputPassword1" name="pwd" placeholder="Password">
					</div>

					<div class="divider-form"></div>

					<button type="submit" class="btn-block btn btn-lg btn-primary">LOG IN</button>

					<div class="input-group">
					</div>

					<p class="text-center">Don't have an account? <a href="joinForm.do"><b>Register Now!</b></a></p>
					
					<p class="text-center"><br>
					<fb:login-button size="large" scope="public_profile,email" onlogin="checkLoginState();">Sign up with Facebook</fb:login-button>
					</p>
<!-- 					<div> -->
<!-- 						<div id="first_name"></div> -->
<!-- 						<div id="last_name"></div> -->
<!-- 						<div id="id"></div> -->
<!-- 						<div id="email"></div> -->
<!-- 						<div id="gender"></div> -->
<!-- 						<div> -->
<!-- 							<img id="image" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</form>
			</div>
		</div>
	</div>
	<div class="section-end"></div>
</body>
</html>