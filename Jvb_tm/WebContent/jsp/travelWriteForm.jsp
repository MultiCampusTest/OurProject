<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	#map { 
	 width: 400px; 
	 height: 500px;; 
	} 
</style>
</head>
<body>
<div class="container">
<div>
<h2>여행 공유 입력</h2>
</div>
	<div class="row">
		<div class="col-md-5">
			<h2>Google Map here</h2>
			<div id="map"></div>
			<script>
		      function initMap() {
		        var uluru = {lat: -25.363, lng: 131.044};
		        var map = new google.maps.Map(document.getElementById('map'), {
		          zoom: 4,
		          center: uluru
		        });
		        var marker = new google.maps.Marker({
		          position: uluru,
		          map: map
		        });
		      }
	      </script>
		</div>
		<div class="col-md-7">
			<button type="button" class="btn btn-primary">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			</button>
		</div>
	</div>
</div>

     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
    </script>
</body>
</html>