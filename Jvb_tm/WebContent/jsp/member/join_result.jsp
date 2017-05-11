<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/stepwizard.css">
<title>Insert title here</title>
</head>
<body>
<div class="margin-section-top" style="margin-top: 5%"></div>
	<div class="stepwizard">
    <div class="stepwizard-row">
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">1</button>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-default btn-circle">2</button>
            <p>Step 2</p>
        </div>
        <div class="stepwizard-step">
            <button type="button" class="btn btn-primary btn-circle">3</button>
            <p>Step 3</p>
        </div> 
    </div>
	</div>
	<div style="margin-top: 10%"></div>
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-6 col-sm-offset-3">
				<img src="img/congratulations.png" width="100%"><br><br>
				<h3>Dear, <font color="#FF605A">${f_name}</font></h3>
				<p style="font-size: 20px; color: #5C5C5C;">
					Thank you for joining us. We provide you with awesome experience
					while sharing information and preparing your trip.
					We hope you can have a good time on our site!</p>
				<a href="main.do" class="btn btn-primary">START NOW</a>
			</div>
		</div>
	</div>
	<div class="margin-section-bottom" style="margin-bottom: 20%"></div>
</body>
</html>