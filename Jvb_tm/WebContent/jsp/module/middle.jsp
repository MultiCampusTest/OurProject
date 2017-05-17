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
									<h1>Singed as <font color="#FF605A">${userid}</font></h1>
									
										
											<img src="imageProfileView.do?img_code=${userid } "
												class="avatar img-circle img-thumbnail profile_img"
												alt="avatar" style="width: 250px; height: 250px">
										
<%-- 									<img src="imageView.do?img_code=${userid }" class="avatar img-circle profile_img"width="250px"> --%>
								</c:when>
								<c:otherwise>
								<h1>Welcome !</h1><br>
								<form action="loginProc.do" method="post">
									<div>
										<input type="text" class="form-control" name="userid" id="userid"
											placeholder="Username">
									</div> <br><br>
									<div>
										<input type="password" class="form-control" name="pwd" id="pwd"
											placeholder="Password">
									</div> <br><br>
									<div>
										<button type="submit" class="form-control btn btn-primary">LOGIN</button>
										<br><br>
										<button type="button" class="form-control btn btn-primary"
										onclick="location.href='joinForm.do'">JOIN</button>
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