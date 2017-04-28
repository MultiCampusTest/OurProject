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
	
// 	function add_item(){
// 	    var div = document.createElement('div');
// 	    div.innerHTML = document.getElementById('pre_set').innerHTML;
// 	    document.getElementById('field').appendChild(div);
// 	}
	
// 	function remove_item(obj){
// 	    document.getElementById('field').removeChild(obj.parentNode);
// 	}
function add_day(){
	var text = $('.sibal > li:last-child').text();
 	var index = parseInt(text.substring(3));
	$('.sibal').append('<li class="day">DAY'+(index+1)+'</li>');
	
}



</script>
<style type="text/css">
#map { 
 width: 400px; 
 height: 500px; 
} 
	
.hi{
/*  	height:450px;  */

}
.sibal{
list-style:none;
/* display: block; */
/* height:450px; */
/*  height:100%; */
/* height:200px; */
max-height:400px;
border-collapse: collapse;
overflow-y: auto;

}

.sibal2{

list-style:none;
background-color:#FF605A;
color:#ffffff;
width:140px; 
height:50px;
/* height:50px;	 */

}

.day{
padding: 15px;
background-color:#FF605A;
border-color: #D2C9C9; 
border-style:solid; 
border-width: 1px; 
border-radius: 0; 
font-size:15px;
color:#ffffff;
width:140px; 
height:50px; 
text-align:center;
}

.dayday{

line-height:20px;
margin:0 auto;
width:110px;
height:30px;
line-height:32px; 
border:solid 1px #fff;
text-align:center;
cursor:pointer;
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
							
							
							
							
			</ul>
	<ul class="sibal2">
		<li style="padding-top:10px;">
			<div class="dayday" onclick="add_day()">DAY 추가</div>
		</li>
	</ul>
		</div>

</div>

     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
    </script>
</body>
</html>