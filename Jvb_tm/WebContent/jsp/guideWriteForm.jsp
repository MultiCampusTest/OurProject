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
$(function() {
	$(".selector").flatpickr({

	});
});
</script>
<style>
        #map { 
         width: 400px; 
         height: 500px;; 
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
</style>
</head>
<body>
<div class="container">
  <div>
  	<h2>가이드 구함 입력</h2>
  </div>
  <div class="row">
    <div class="col-md-5">
      <h2>Google Map here</h2>
<!--       <div id="floating-panel"> -->
<!-- 	      <input id="address" type="textbox" value=""> -->
<!--       </div> -->
	  <input id="pac-input" class="controls" type="text" placeholder="Enter a location">
      <input id="submit" type="button" value="search">
      <input id="delete" type="button" value="Delete Markers">
      <div class="mapdiv" id="map"></div>
      <script>
   	var polys =[];
   	var map;
   	var i = 0;
   	var loc = [];
   	var lat = [];
   	var markers = [];
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: {lat: 37.577845, lng: 126.981681}
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
// 			var place = autoComplete.getplace();
// 			geocodeAddress(geocoder, map);
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
            
            var div = document.createElement('div');
            loc[i] = address;
            lat[i] = results[0].geometry.location;
            alert(lat[i]);
            alert(loc[i]);
    	    div.innerHTML = "<span class='glyphicon glyphicon-map-marker'>"+loc[i]+"</span>";
    	    document.getElementById('field').append(div);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
	<div class="container" id="field"></div>
	
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDt288Is5VzyssIHVHJaMi-zrt71D4WJVY&callback=initMap">
    </script>
    </div>
    <div class="col-md-7">
      <h2>Something Else here</h2>    
      <form class="form" role="form" action="#">
      	<div class="form-group">
          <label class="control-label ">TITLE:</label>
          <input class="form-control" placeholder="Insert Title " type="text">
	  	</div>
	  	
	  	<hr>
	  	
	  	<div class="form-group">
          <label class="control-label">DATE:</label><br>
          <input class="selector" id="fromDate" type="text"> 
          ~
          <input class="selector" id="toDate" type="text"><br>
        </div>
        
        <hr>
        
	  	<div class="form-group">
		  <label class="control-label">DATE CATEGORY:</label>
	      <div class="ui-select">
	      	<select id="user_time_zone" class="form-control">
	            <option value="eat">먹방</option>
	            <option value="tour">관광</option>
	            <option value="rest">휴양</option>
	        </select>
	      </div>
	    </div>
	    
	    <hr>
	    
	    <div class="form-group">
		  <label class="control-label"> LOC CATEGORY:</label>
	      <div class="ui-select">
	      	<select id="user_time_zone" class="form-control">
	            <option value="eat">Incheon</option>
	            <option value="tour">Seoul</option>
	            <option value="rest">Busan</option>
	        </select>
	      </div>
	    </div>
	    
	    <hr>
	    <div class="form-group">
          <label class="control-label">CONTENT:</label>
          <textarea class="form-control" placeholder="Insert Content "rows="10"></textarea>
		</div>
		<div class="form-group">
			<input type="submit" value="ok" class="btn btn-primary">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='guideList.do'">
		</div>
      </form>
    </div>
  </div>
</div>
     
</body>
</html>	