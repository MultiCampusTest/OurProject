<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function move() {
		opener.parent.location='loginForm.do'; 
		window.close(); 
	}

	$(document).ready(function(){
		var receivedData = "${member.userid}";
		if(receivedData == '') {
			alert("Sorry, the wrong kind of information was entered");
			location.href="searchAccount.do";
		}
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div align="center" style="margin-top: 25%; margin-bottom: 25%">
					<h2>"Your Email"<br><br><span style="color: #FF605A">${member.userid}</span></h2>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="form-group">
					<input type="button" name="email" id="email" class="btn btn-danger btn-block btn-lg" value="Go to sign up" onclick="move()">
				</div>
				<div class="form-group">
					<input type="button" name="firstName" id="firstName" class="btn btn-danger btn-block btn-lg" value="Close" onclick="window.close()">
				</div>
			</div>
		</div>
	</div>
</body>
</html>