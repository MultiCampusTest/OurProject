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
      <h2>Something Else here</h2>    
      <form class="form" role="form" action="#">
      	<div class="form-group">
          <label class="control-label ">TITLE:</label>
          <input class="form-control" value="제목 입력" type="text">
	  	</div>
	  	<div class="form-group">
          <label class="control-label">DATE:</label><br>
          <input class="selector" id="fromDate" type="text"> 
          ~
          <input class="selector" id="toDate" type="text"><br>
        </div>
	  	<div class="form-group">
		  <label class="control-label">CATEGORY:</label>
	      <div class="ui-select">
	      	<select id="user_time_zone" class="form-control">
	            <option value="eat">먹방</option>
	            <option value="tour">관광</option>
	            <option value="rest">휴양</option>
	        </select>
	      </div>
	    </div>
	    <div class="form-group">
          <label class="control-label">CONTENT:</label>
          <textarea class="form-control" rows="10"></textarea>
		</div>
		<div class="form-group">
			<input type="submit" value="ok" class="btn btn-primary">
			<input type="button" value="list" class="btn btn-primary">
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