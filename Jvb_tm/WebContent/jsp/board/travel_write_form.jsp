  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!-- /달력 -->
<link rel="stylesheet" href="css/travelWriteForm.css">
<script type="text/javascript">

	var polys =[];
	var map;
	var i = 0;
	var loc = [];
	var latLng = [];
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
// 				var place = autoComplete.getplace();
// 				geocodeAddress(geocoder, map);
	});
	
	function deleteMarkers() {
		   
		   for(var i = 0; i < markers.length; i++) {
		         markers[i].setMap(null);
		       }
		   for(var i=0; i<polys.length; i++){
		 		   polys[i].setMap(null);
		 	   }
		   
	       markers = [];
	       path = [];
	       polys = [];
	       poly = new google.maps.Polyline({
		        strokeColor: '#000000',
		        strokeOpacity: 1.0,
		        strokeWeight: 3
		      });
	   	   poly.setMap(map);
	     }
	
	document.getElementById('delete').addEventListener('click', function() {
	  deleteMarkers();
	  loc = [];
	  latLng = [];
	  $('#input_latLng').empty();
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
	    latLng[i] = results[0].geometry.location;
	    
	    
	    $('#input_latLng').append('<input type="hidden" name="latLng" value="'+latLng[i]+'">');
	
	
	  } else {
	    alert('Geocode was not successful for the following reason: ' + status);
	  }
	});
	}



$(function() {
	$(".selector").flatpickr({

	});
});



function delete_check(id){
	var msg = "Do You Really Want To Delete?"
	if(confirm(msg)!=0){
		delete_day_content(id);
	}else{
		return;
	}
}

function delete_day_content(id){
	var delete_day_number = id.substring(10);
	var delete_content_day = id.substring(7);
	$('#'+id).parents('li').remove();
	$('#'+delete_content_day).remove();
	
	$('.sibal > li').each(function(){
		
		if(delete_day_number < $(this).val()){
			var next_day_number = $(this).val()-1;
			$(this).val(next_day_number);
			$(this).html('DAY'+next_day_number);
			$(this).append('<i class="fa fa-trash fa-1x" aria-hidden="true"'
					+ 'id="delete-day'+next_day_number+'" onclick=delete_check(this.id)></i>');
		}
		
	});
	
	$('#content > textarea').each(function(){
		var content_number = $(this).attr('id').substring(3);
		if(delete_day_number < content_number){
			var next_content_number = content_number-1;
			$(this).attr('id','day'+next_content_number);
		}
		
	});
}
	
function add_day_content(){
	
	var this_day = $('.sibal > li:last-child').val();
 	var next_day = Number(this_day)+1;
	$('.sibal').append('<li class="day">DAY'+next_day+'</li>');
	$('.sibal > li:last-child').val(next_day);
	$('.sibal > li:last-child').append('<i class="fa fa-trash fa-1x" aria-hidden="true"'
										+ 'id="delete-day'+next_day+'" onclick=delete_check(this.id)></i>');
	
	$('#content').append('<textarea placeholder="Write Your Travel Plan!" class="form-control-text"' 
			 + 'id="day'+next_day+'" name="contents" rows="10" style="resize:none;"></textarea>');
	$('#content > textarea:last-child').hide();

}



$(document).ready(function(){
	
$('.sibal').on('click','li',function(){
	var day_value = $(this).val();
	$('.sibal > li').each(function(){
		if(day_value ==$(this).val()){
			$(this).addClass('on');
		}else{
			$(this).removeClass('on');
		}
	});
	
	var new_day_value = 'day'+day_value;
		$('#content textarea').each(function(){
			if(new_day_value == $(this).attr('id')){
				$(this).show(500);
			}else{
				$(this).hide();
			}
		});
	});


// 	$('#submit').on('click',function(){
// 		$('#content > textarea').each(function(){
// 			contents.push($(this).val());
// 		});
		
// 		form_submit();
// 	});
})

</script>
<style type="text/css">
#map { 
width: 400px; 
height: 600px;
margin-top:10px; 
} 

 #pac-input{
      	width: 400px;
      }

.sibal{

list-style:none;
max-height:550px;
width:160px;
border-collapse: collapse;
overflow-y: auto;

}

.ssibal{

list-style:none;
background-color:#FF605A;
color:#ffffff;
width:140px; 
height:50px;


}

.sibal .on{
background-color:#DC524D;

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
cursor:pointer;
}

.day:hover{
background-color:#DC524D;
}


.add-day-button{
line-height:20px;
margin:0 auto;
width:110px;
height:30px;
line-height:32px; 
border:solid 1px #fff;
text-align:center;
cursor:pointer;
}

.form-control-text {
  display: block;
  width: 100%;
  height: auto;
  padding: 6px 12px;
  font-size: 20px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.form-control-text:focus {
  border-color: #FF605A;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}

.title{
	height: 40px;	
	font-size: 20px;
	
}

.form-control:focus {
  border-color: #FF605A;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}

.form-group{
	text-align:center;
	margin-top:50px;
	
}

.fa-trash{ 
 	float:right;  
 	margin-top:3px;
 }
 
 .selector{
 	
 	text-align:center; 
 }
 
 .category{
 	width:200px;
	font-size:15px;
 }
</style>
</head> 
<body>
<div class="container">
  
	<div> <h2>TRAVEL PLANNING</h2> </div>
	 <hr>
	 <div class="row"> 
		<div class="col-md-5">
		<div>
		  <input id="pac-input" class="form-control" type="text" placeholder="Enter a location" style="margin-bottom:10px;" >
	      <input class="btn btn-primary" id="submit" type="button" value="search">
	      <input class="btn btn-primary" id="delete" type="button" value="Delete Markers">
      </div>
			<div id="map"></div>
			<script async defer
    		src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDt288Is5VzyssIHVHJaMi-zrt71D4WJVY&callback=initMap">
   			</script>
		</div>
		<div class="col-md-2">

			<ul class="sibal">
				<li class="day" value="1" >DAY1</li>
				
			</ul>
	<ul class="ssibal">
		<li style="padding-top:10px;">
			<div class="add-day-button" onclick="add_day_content()">DAY 추가</div>
		</li>
	</ul>
		</div>
		
	<form action="travelWrite.do" method="post">
	  <div class="col-md-5">
		<div>
		<font style="font-size:20px">TITLE</font>
         	<input type="text" placeholder="Insert Title " class="form-control title" name="title"/>
		<hr/>
		</div>
		
		<div>
        <font style="font-size:20px">DATE</font><br>
          <input class="selector" id="fromDate" name="startDate" type="text"> 
          ~
          <input class="selector" id="toDate" name="endDate" type="text">
        </div>
	    <hr>
	    <div>
		 <p style="font-size:20px">CATEGORY</p>
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
	    
		<div id="content">
		<font style="font-size:20px">CONTENT</font>	 
			<textarea placeholder="Write Your Travel Plan!" class="form-control-text" name="contents"
							id="day1" rows="10" style="resize:none;"></textarea>		
			</div>
		<div class="form-group">
			<input type="hidden" value="t" name="code">
			<input type="submit" value="ok" class="btn btn-primary">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='travelList.do'">
		</div>
		<div id="input_latLng"></div>
		</div>
	 </form>	
	</div>
</div>  
</body>
</html>