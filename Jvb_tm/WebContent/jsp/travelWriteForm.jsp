<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/travelWriteForm.css">
<script type="text/javascript">
	function add_item(){
	    var div = document.createElement('div');
	    div.innerHTML = document.getElementById('pre_set').innerHTML;
	    document.getElementById('field').appendChild(div);
	}
	
	function remove_item(obj){
	    document.getElementById('field').removeChild(obj.parentNode);
	}
</script>
<style>
	#map { 
	 width: 400px; 
	 height: 500px;; 
	} 
</style>
</head>
<body>
<div class="container">
	<div> <h2>여행 공유 입력</h2> </div>
	<div class="container">
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
			<div class="col-md-12">
				<pre class="col-md-2"  style="text-align: center">DAY</pre>
				<pre class="col-md-8"  style="text-align: center">여행계획</pre>
				<button type="button" class="btn btn-primary cla-md-2" style="margin-top: 5px" onclick="add_item()">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				</button>
			</div>	
			<form class="form-vertical" role="form" action="#">
				<div class="col-md-12" id="field"></div>
				<div id="pre_set" style="display:none">
					<input type="text" class="col-md-8" name="" value="" style="height: 80px"> <button class="col-md-2" style="height: 80px" onclick="remove_item(this)">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>

     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
    </script>
</body>
</html>