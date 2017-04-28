<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<style type="text/css">
	#map { 
	 width: 400px; 
	 height: 500px; 
	} 
	
.hi{
 	height:450px; 

}
.sibal{
list-style:none;
/* display: block; */
width: 167px;
/* height:450px; */
 height:100%;
border-collapse: collapse;
overflow-y: auto;

}

.sibal2{

list-style:none;
background-color:#FF605A;
 color:#ffffff;

}

.day{
padding: 15px;
background-color:#FF605A;
/* border-color: #f2f2f2; */
/* border-style:solid; */
/* border-width: 1px; */
border-radius: 0; 
font-size:15px;
color:#ffffff;
width:150px; 
/* height:50px; */
 text-align:center;
}

.dayday{
/* border-color:#fffff; */
/* width:150px; */
height:50px;
/* line-height:20px; */
/* border:solid 1px #fff; */
text-align:center;

cursor:pointer;
padding-top:10px;
}


</style>
</head>
<body>
<div class="container">
	<div> <h2>여행 공유 입력</h2> </div>
		<br>
		<div class="col-md-5">
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
		<div class="col-md-2 hi">
			<ul class="sibal">
				<li class="day day1">DAY1</li>
				<li class="day day2">DAY2</li>
				<li class="day day3">DAY3</li>
				<li class="day day4">DAY4</li>
				<li class="day day5">DAY5</li>
<!-- 				<li class="day day5">DAY5</li> -->
<!-- 				<li class="day day5">DAY5</li> -->
<!-- 				<li class="day day5">DAY5</li> -->
<!-- 				<li class="day day5">DAY5</li> -->
<!-- 				<li class="day day5">DAY5</li> -->
<!-- 				<li class="day day5">DAY5</li> -->
<!-- 				<li class="day day5">DAY10</li> -->
				
			</ul>
	<ul class="sibal2">
		<li class="dayday" onclick="#">
			DAY추가
		</li>
	</ul>
		</div>

</div>

     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
    </script>
</body>
</html>