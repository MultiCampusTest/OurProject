<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <div class="mapdiv" id="map"></div>
      <script>

      // This example creates an interactive map which constructs a polyline based on
      // user clicks. Note that the polyline only appears once its path property
      // contains two LatLng coordinates.

      var poly;
      var map;
      var loc;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15	,
          center: {lat: 37.575991, lng:  126.976926}
        });

        poly = new google.maps.Polyline({
          strokeColor: '#000000',
          strokeOpacity: 1.0,
          strokeWeight: 3
        });
        poly.setMap(map);

        map.addListener('click', addLatLng);
      }

      function addLatLng(event) {
        var path = poly.getPath();
        //클릭시 좌표값 얻기
//         loc = event.latLng;
        
//         alert(loc);

        path.push(event.latLng);

        var marker = new google.maps.Marker({
          position: event.latLng,
          title: '#' + path.getLength(),
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
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