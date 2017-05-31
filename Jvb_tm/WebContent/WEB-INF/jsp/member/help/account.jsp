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
	$(document).ready(function(){
		$('#submit1').click(function(){
			if($('#firstName1').val() == '') {
				$('#firstName1').focus();
				return false;
			} else if($('#birthday1').val() == '') {
				$('#birthday1').focus();
				return false;
			}
		});
		
		$('#submit2').click(function(){
			if($('#userid2').val() == '') {
				$('#userid2').focus();
				return false;
			} else if($('#firstName2').val() == '') {
				$('#firstName2').focus();
				return false;
			}
		});
	});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2 align="center" style="margin-bottom: 5%">Forgot your account?</h2>

  <ul class="nav nav-tabs">
    <li class="active" style="width: 50%"><a data-toggle="tab" href="#home">ID</a></li>
    <li style="width: 50%"><a data-toggle="tab" href="#menu1">PASSWORD</a></li>
  </ul>

  <div class="tab-content">
  
    <div id="home" class="tab-pane fade in active">
      <p align="center" style="margin-top: 3%; margin-bottom: 5%">
      	Fill in your first name and birthday to find account name.
      </p>
      
      <p>
      	<form action="searchUsername.do" method="post">
      		<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<label for="firstName">First Name</label>
                        <input type="text" name="firstName" id="firstName1" class="form-control input-lg" placeholder="first name">
					</div>  
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<label for="birthday">birthday</label>
						<input type="text" name="birthday" id="birthday1" class="form-control input-lg" placeholder="yyyy-mm-dd">
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-danger btn-block btn-lg" id="submit1" value="Submit">
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-danger btn-block btn-lg" value="Close" onclick="window.close()">
			</div>
      	</form>
      </p>
    </div>
    
    <div id="menu1" class="tab-pane fade">
      <p align="center" style="margin-top: 3%; margin-bottom: 5%">
      	Fill in your email and first name to find password.
      </p>
      
      <p>
      	<form action="searchPassword.do" method="post">
      		<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<label for="firstName">Email</label>
                        <input type="text" name="userid" id="userid2" class="form-control input-lg" placeholder="email">
					</div> 
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<label for="firstName">First Name</label>
						<input type="text" name="firstName" id="firstName2" class="form-control input-lg" placeholder="first name">
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-danger btn-block btn-lg" id="submit2" value="Submit">
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-danger btn-block btn-lg" value="Close" onclick="window.close()">
			</div>
      	</form>
      </p>
    </div>
    
  </div>
</div>
</body>
</html>