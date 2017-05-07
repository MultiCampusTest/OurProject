<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 달력 -->  
<link rel="stylesheet" href="https://unpkg.com/flatpickr/dist/flatpickr.min.css">
<script src="https://unpkg.com/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ru.js"></script>
<link rel="stylesheet" href="css/calender.css">
<link rel="stylesheet" href="css/guideWriteForm.css">
<script type="text/javascript">

	var polys =[];
	var map;
	var i = 0;
	var loc = [];
	var lat = [];
	var markers = [];
	
  function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: {lat: 37.566535, lng: 126.97796919999996}
    });
    var geocoder = new google.maps.Geocoder();
    
    poly = new google.maps.Polyline({
        strokeColor: '#000000',
        strokeOpacity: 1.0,
        strokeWeight: 3
      });
    poly.setMap(map);
    
	//자동완성
	var autoComplete = new google.maps.places.Autocomplete(document.getElementById('pac-input'));
	autoComplete.addListener('place_changed', function() {
//			var place = autoComplete.getplace();
//			geocodeAddress(geocoder, map);
	});

   function setMapOnAll(map) {
       for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
       }
 	   for(var i=0; i<polys.length; i++){
 		   polys[i].setMap(map);
 	   }
   }
   
   function clearMarkers() {
       setMapOnAll(null);
   }

   function deleteMarkers() {
       clearMarkers();
       markers = [];
       path = [];
     }
    
   document.getElementById('delete').addEventListener('click', function() {
	  deleteMarkers();
	  loc = [];
	  lat = [];
	  document.removeChild(div);
   });

    document.getElementById('submit').addEventListener('click', function() {
      geocodeAddress(geocoder, map);
      i++;
    });
  }

  function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('pac-input').value;
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === 'OK') {
    	
    	
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
        markers.push(marker);
       
        polys.push(poly);
        var path = poly.getPath();
        path.push(results[0].geometry.location);
        resultsMap.setCenter(results[0].geometry.location);
        
        loc[i] = address;
        lat[i] = results[0].geometry.location;
        	
        alert(lat[i]);
        alert(loc[i]);
//         var div = document.createElement('div');
// 	    div.innerHTML = "<span class='glyphicon glyphicon-map-marker'>"+loc[i]+"</span>";
// 	    document.getElementById('field').append(div);
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }


$(function() {
	$(".selector").flatpickr({

	});
});

$(document).ready(function(){
	$("#test").on("click",function(){
		request.setAttribute("lat",lat);
	});
})

</script>
<style>
        #map { 
         width: 450px; 
         height: 600px;
         margin-top:10px; 
        } 
        #floating-panel {
	        top: 10px;
	        left: 25%;
	        z-index: 5;
	        background-color: #fff;
	        padding: 5px;
	        border: 1px solid #999;
	        text-align: center;
	        font-family: 'Roboto','sans-serif';
	        line-height: 30px;
	        padding-left: 10px;
      }
      #pac-input{
      	width: 400px;
      }
      
   .selector{
 	text-align:center; 
 	width: 200px;
 	}
 	
 	.category{
 		width:200px;
 		font-size:15px;
 	}
</style>
</head>
<body>
<div class="container">
  <div> <h2>FIND YOUR GUIDE</h2> </div>
  <hr>
  <div class="row">
    <div class="col-md-5">
      <div>
		  <input id="pac-input" class="form-control" type="text" placeholder="Enter a location" style="margin-bottom:10px;" >
	      <input class="btn btn-primary" id="submit" type="button" value="search">
	      <input class="btn btn-primary" id="delete" type="button" value="Delete Markers">
      </div>
      <div class="mapdiv" id="map"></div>

	
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDt288Is5VzyssIHVHJaMi-zrt71D4WJVY&callback=initMap">
    </script>
    </div>
    <div class="col-md-7">
      
    <form class="form" action="guideWrite.do" method="post">
      <div>
		<font style="font-size:20px">TITLE</font>
         	<input type="text" placeholder="Insert Title " class="form-control title" name="title"/>
	  </div>

	  <hr>
	  	
	  <div class="form-group">
          <font style="font-size:20px">DATE</font><br>
          <input class="selector" name="startDate"  id="fromDate" type="text"> 
          ~
          <input class="selector" name="endDate" id="toDate" type="text"><br>
        </div>
        <hr>
   
        <div>
		 <p style="font-size:20px">CATEGORY</p>
	     <div style="float:left; margin-right:20px">
	     <font style="font-size:20px;">DATE</font><br> 
	      	<select class="form-control category" name="subCategory">
	            <option value="five">5DAYS</option>
	            <option value="ten">10DAYS</option> 
	            <option value="more">15DAYS+</option> 
	        </select>
	      </div>
	      <div style="float:left;">
	     	<font style="font-size:20px">LOCATION</font><br>
	      	<select class="form-control category" name="locCategory" >
	            <option value="seoul">SEOUL</option>
	            <option value="incheon">INCHEON</option>
	            <option value="gyeonggi">GYEONGGI-DO</option>
	            <option value="daejeon">DAEJEON</option>
	            <option value="gwangju">GWANGJU</option>
	            <option value="daegu">DAEGU</option>
	            <option value="busan">BUSAN</option>
	            <option value="jeju">JEJU</option>
	            <option value="gangwon">GANGWON-DO</option>
	            <option value="chungcheong">CHUNGCHEONG-DO</option>
	            <option value="jeolla">JEOLLA-DO</option>
	            <option value="gyeongsang">GYEONGSANG-DO</option>
	        </select>
	       </div> 
	     </div>
		<br><br><br>	    
	    <hr>
	    <div class="form-group">
          <font style="font-size:20px">CONTENT</font>	 
          <textarea class="form-control" placeholder="Insert Content" rows="14" name="contents"></textarea>
		</div>
		<div class="form-group">
			<input type="submit" value="ok" class="btn btn-primary" id="test">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='guideList.do'">
		</div>
      </form>
    </div>
  </div>
</div>
     
</body>
</html>	