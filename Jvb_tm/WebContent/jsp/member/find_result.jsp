<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		var domain = $('span').val();
		alert(domain);
	});
</script>
</head>
<body>
<div style="margin-top: 15%"></div>
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-6 col-sm-offset-3">
				<p>
					<h1><span style="color: #FF605A">${receiver}</span></h1>
				</p>
				<p style="font-size: 20px; color: #5C5C5C;">
					Check the email and change your password for security.
					Always thanks for visiting Travel Maker :)
				</p>
				<a href="" class="btn btn-primary">Go to mailbox</a>
				<a href="loginForm.do" class="btn btn-primary">Sign in</a>
			</div>
		</div>
	</div>
<div style="margin-bottom: 20%"></div>
</body>
</html>