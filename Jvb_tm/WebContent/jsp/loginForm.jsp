<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css);
@import url(http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);

body {
	font-family: 'Roboto';
}

.box {
	background-color: #fff;
	padding: 25px 40px;
	margin-top: 30px; /*Remove, its example*/
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.input-group {
	margin: 5px 0px;
}
 
.addon-facebook {
	background-color: #345387;
	border: none;
	border-radius: 2px 0px 0px 2px;
	color: #fff;
}

.btn-facebook,
.btn-facebook:hover {
	background-color: #4b6ea9;
	color: #fff;
	border-radius: 0px 2px 2px 0px;
	font-size: 15px;
}

.btn-primary {
	border-radius: 2px;
	background-color: #FF605A;
	border-color: #FF605A;
	margin: 10px 0px;
}

p {
	color: #aebbcb;
} 

a {
	color: #FF605A;
}

.divider-form {
    border: 1px solid #EBEFF1;
    margin: 15px -40px 10px;
}

label {
	text-transform: uppercase;
	color: #FF6A64;
}

strong {
	color: #95a5bb;
}

.form-control {
    background: none;
    height: 40px;
    border: none;
    border-radius: 0px;
    box-shadow: none;
    color: #8b9eb6;
    padding: 0px;
}

.form-control:focus {
    box-shadow: none;
}
</style>
</head>
<body class="container-fluid">
<script>
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      testAPI();
    } else {
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '534503966938051',
    cookie     : true,
    xfbml      : true,
    version    : 'v2.8'
  });

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {fields: 'id,first_name,last_name,email,gender'}, function(response) {
      console.log('Successful login for: ' + response.name);
      console.log(JSON.stringify(response));
      document.getElementById('first_name').innerHTML = 'First Name : ' + response.first_name;      
      document.getElementById('last_name').innerHTML = 'last Name : ' + response.last_name;
      document.getElementById('email').innerHTML = 'Email : ' + response.email;
      document.getElementById('gender').innerHTML = 'Gender : ' + response.gender;
      document.getElementById('image').src = 'http://graph.facebook.com/' + response.id + '/picture?type=large';
    });
  }
</script>

    <div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="box">
				
				<div class="logo">
					<img src="http://static2.traveltek.net/images/www.travelmaker.co.uk/img/Travelmakerlogo.gif">
				</div>
				
				<form role="form">

					<div class="divider-form"></div>

					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label>
						<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
					</div>

					<div class="divider-form"></div>

					<div class="form-group">
						<label for="exampleInputPassword1">Password</label>
						<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
					</div>

					<div class="divider-form"></div>

					<button type="submit" class="btn-block btn btn-lg btn-primary">LOG IN</button>

					<div class="input-group">
					</div>

					<p class="text-center">Already have an account? <a href="joinForm.do"><b>Sign up here</b></a></p>
					<p class="text-center">
					<fb:login-button size="large" scope="public_profile,email" onlogin="checkLoginState();">Sign up with Facebook</fb:login-button>
					
					<div>
						<div id="first_name"></div>
						<div id="last_name"></div>
						<div id="id"></div>
						<div id="email"></div>
						<div id="gender"></div>
						<div>
							<img id="image" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>