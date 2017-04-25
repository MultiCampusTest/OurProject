<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
        #map { 
         width: 500px; 
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
      <form class="form-horizontal" role="form">
      	<div class="form-group">
          <label class="col-lg-4 control-label">제목:</label>
          <div class="col-lg-8">
            <input class="form-control" value="제목 입력" type="text">
          </div>
	  	</div>
	  	<div class="form-group">
          <label class="col-lg-4 control-label">여행 일정:</label>
          <div class="col-md-3">
            <input class="form-control" value="제목 입력" type="text">
          </div>
          <div class="col-md-1">~</div>
          <div class="col-md-3">
            <input class="form-control" value="제목 입력" type="text">
          </div>
	  	</div>
	  	<div class="form-group">
	      <label class="col-lg-4 control-label">카테고리:</label>
	      <div class="col-lg-8">
	        <div class="ui-select">
	          <select id="user_time_zone" class="form-control">
	            <option value="eat">먹방</option>
	            <option value="tour">관광</option>
	            <option value="rest">휴양</option>
	          </select>
	        </div>
	      </div>
	    </div>
	    <div class="form-group">
			          <label class="col-lg-4 control-label">상세내용:</label>
			          <div class="col-lg-8">
			            <textarea class="form-control col-sm-5" rows="10"></textarea>
			          </div>
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