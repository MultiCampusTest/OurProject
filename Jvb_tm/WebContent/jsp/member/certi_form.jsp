<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/stepwizard.css">
<script type="text/javascript" src="js/facebookAPI.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="margin-section-top" style="margin-top: 5%"></div>
<div class="stepwizard">
    <div class="stepwizard-row">
        <div class="stepwizard-step">
            <button type="button" class="btn btn-primary btn-circle">1</button>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">2</button>
            <p>Step 2</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">3</button>
            <p>Step 3</p>
        </div> 
    </div>
</div>
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h1 style="text-align: center; font-style: bold;">Verify your identification</h1>
				<br>
				<p style="text-align: center; font-style: bold;">
					We require you to verify the identification<br>Please use the method to process registration below
				</p>
					<div style="margin-top: 10%"></div>

					<div class="form-group">
						<a class="btn btn-block btn-social btn-google-plus"> <i class="fa fa-google-plus"></i> &nbsp;Connect with Google</a>
					</div>
					<div class="form-group">
						<a href="javascript:facebook_btn()" class="btn btn-block btn-social btn-facebook"><i class="fa fa-facebook"></i> &nbsp;Connect with Facebook</a>
					</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	<div style="margin-top: 10%"></div>
</body>
</html>