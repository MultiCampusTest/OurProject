<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="css/mainSlide.css" rel="stylesheet" />

<script type="text/javascript">		
			$('.carousel').carousel();
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#main_submit').click(function(){
			var logEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if($('#main_userid').val() == '') {
				$('#main_msg').html('<font color="#FF605A">enter email</font>');
				$('#main_userid').focus();
				return false;
			} else if( !logEmail.test($('#main_userid').val()) ) {
				$('#main_msg').html('<font color="#FF605A">wrong email</font>');
				$('#main_userid').focus();
				return false;
			} else if($('#main_pwd').val() == '') {
				$('#main_msg').html('<font color="#FF605A">enter password</font>');
				$('#main_pwd').focus();
				return false;
			} else {
				$('#main_msg').text('');
				
				var id = $('#main_userid').val();
				var pass = $('#main_pwd').val();
				$.ajax({
					url : 'loginProc.do',
					type : 'POST',
					data : { userid : id, pwd : pass },
					dataType : 'json',
					success : function(data) {
						if(data.result) {
							location.href="main.do";
						} else {
							alert("you typed email or password wrong");
							location.href="loginForm.do"
						}
					}, error : function(){
						alert('data error');
					}
				});
			}
		});
	});
</script>

</head>

<body>
	<div id="myCarousel" class="carousel slide"
		data-ride="carousel">
		<!--페이지 표시-->
<!-- 		<ol class="carousel-indicators"> -->
<!-- 			<li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 			<li data-target="#myCarousel" data-slide-to="1"></li> -->
<!-- 			<li data-target="#myCarousel" data-slide-to="2"></li> -->
<!-- 			<li data-target="#myCarousel" data-slide-to="3"></li> -->
<!-- 		</ol> -->
		<!--페이지-->

		<div class="carousel-inner slide-bg ">
			<div class="container">
				<div class="carousel-caption">
					<table width="100%">
						<tr valign="top">
							<td width="40%" align="left">
								<h1>Travel Maker</h1>								
								<br><br>
								<p>								
								We are Korea travel service with guide .
								</p>
								<p>
								Want a special experience in Korea ?
								</p>
								<p>
								If so, let's travel with "Travel Maker" !
								</p>
								<br><br>
								<p>								
								Good thing about "Travel Maker"
								</p>
								<p>								
								You can choose your favorite guide to travel !
								</p>
								<p>								
								You can travel freely with your preferred travel route !
								</p>
								<p>
								You can share your travel information so you can hear other opinions !
								</p>
								<br><br>
								<p>Enjoy your trip !</p>
							</td>
							
							<td width="30%"> </td>
							<td width="30%">
							<c:choose>
								<c:when test="${userid != null}">
									<h1>Singed as <font id="user" color="#FF605A">${userid}</font></h1>
									
										
											<img src="imageProfileView.do?img_code=${userid } "
												class="avatar img-circle img-thumbnail profile_img"
												alt="avatar" style="width: 250px; height: 250px">
										
<%-- 									<img src="imageView.do?img_code=${userid }" class="avatar img-circle profile_img"width="250px"> --%>
								</c:when>
								<c:otherwise>
								<h1>Welcome !</h1><br>
<!-- 								<form action="loginProc.do" method="post"> -->
									<div>
										<input type="text" class="form-control" name="userid" id="main_userid"
											placeholder="Username">
									</div> <br><br>
									<div>
										<input type="password" class="form-control" name="pwd" id="main_pwd"
											placeholder="Password">
										<div id="main_msg"></div>
									</div> <br><br>
									<div>
										<button type="button" id="main_submit" class="form-control btn btn-primary">LOGIN</button>
										<div style="margin-bottom: 5%""></div>
										<button type="button" class="form-control btn btn-primary"
										onclick="location.href='certiForm.do'">JOIN</button>
									</div>
									<div style="margin-top: 20%">
										<a href="http://s05.flagcounter.com/more/57Q"><img src="http://s05.flagcounter.com/count2/57Q/bg_FF605A/txt_FFFFFF/border_FF605A/columns_4/maxflags_15/viewers_0/labels_0/pageviews_1/flags_0/percent_0/" alt="Flag Counter" border="0" style="width: 100%"></a>
									</div>
								</form>							
								</c:otherwise>
							</c:choose>							
							</td>
						</tr>
					</table>
				</div>

			</div>
			<!--슬라이드1-->
			<div class="item active ">
				<img src="img/main/img01.jpg" style="width: 100%" alt="First slide">
			</div>
			<!--슬라이드1-->

			<!--슬라이드2-->
			<div class="item">
				<img src="img/main/img02.jpg" style="width: 100%" data-src=""
					alt="Second slide">
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<img src="img/main/img03.jpg" style="width: 100%" data-src=""
					alt="Third slide">
			</div>
			<!--슬라이드3-->

			<!--슬라이드4-->
			<div class="item">
				<img src="img/main/img04.jpg" style="width: 100%" data-src=""
					alt="fourth slide">
			</div>
			<!--슬라이드4-->
		</div>

		<!--이전, 다음 버튼-->
<!-- 		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span -->
<!-- 			class="glyphicon glyphicon-chevron-left"></span></a> <a -->
<!-- 			class="right carousel-control" href="#myCarousel" data-slide="next"><span -->
<!-- 			class="glyphicon glyphicon-chevron-right"></span></a> -->
	</div>
</body>
</html>