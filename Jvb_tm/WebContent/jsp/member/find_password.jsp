<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#userid').keyup(function(){
			if($(this).val() != '') {
				$('#findEmailMsg').text('');
			}
		}).blur(function() {
			if($(this).val() == '') {
				$('#findEmailMsg').html('<font color="#FF605A">enter email</font>');
			}
		});
		
		$('#find').click(function(){
			var email = $('#userid').val();
			var searchEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if(email == '') {
				$('#findEmailMsg').html('<font color="#FF605A">enter email</font>');
				$('#userid').focus();
			} else if(!searchEmail.test($('#userid').val())) {
				$('#findEmailMsg').html('<font color="#FF605A">wrong email</font>');
				$('#userid').focus();
			} else {
				$.ajax({
					url : 'idCheck.do',
					type : 'POST',
					data : { userid : email },
					dataType : 'json',
					success : function(data) {
						if(data.result) {
							location.href="getPassword.do?userid=" + email;
						} else {
							alert("Email doesn't exist.");
						}
					}, error : function(data) {
						alert('Data Error');
					}
				});
			}
		});
	});
</script>
</head>
<body>
<div style="text-align: center; margin-top: 5%; margin-bottom: 5%">
	<p><h1>Forgot your password?</h1>
</div>
<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-body">
                    <fieldset>
			    	  	<div class="form-group">
			    	  		<p>Enter your email address and we will send you a link to reset your password.</p>
			    		    <input type="text" id="userid" name="userid" class="form-control" placeholder="Enter your email">
			    		</div>
			    		<button class="btn btn-primary btn-block" type="button" id="find">Confirm</button>
			    		<div id="findEmailMsg" style="text-align: center"></div>
			    	</fieldset>
			    </div>
			</div>
		</div>
	</div>
</div>
<div class="margin-section-top" style="margin-bottom: 5%"></div>
</body>
</html>