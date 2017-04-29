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
			 + 'id="day'+next_day+'" rows="14"></textarea>');
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
				$('#day-content > strong').text($(this).attr('id'));
				$(this).show(500);
			}else{
				$(this).hide();
			}
		});
	});


})

</script>
<style type="text/css">
#map { 
 width: 400px; 
 height: 500px; 
} 
	

.sibal{

list-style:none;
max-height:400px;
width:160px;
border-collapse: collapse;
overflow-y: auto;

}

.sibal2{

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

.form-group{
	text-align:center;
	margin-top:50px;
	
}

.fa-trash{ 
 	float:right;  
 	margin-top:3px;
 }
</style>
</head>
<body>
<div class="container">
	<div> <h2>TRAVEL PLANNING</h2> </div>
		<hr/>
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
		<div class="col-md-2">
		<form action="" method="post">
			<ul class="sibal">
				<li class="day" value="1" >DAY1</li>
				
			</ul>
	<ul class="sibal2">
		<li style="padding-top:10px;">
			<div class="dayday" onclick="add_day_content()">DAY 추가</div>
		</li>
	</ul>
		</div>
		
		<div class="col-md-5" id="content">
			 <h2 id="day-content" style="margin-top:0;"><strong style="text-transform: uppercase;">day1</strong></h2>
			 <hr/>
			 <textarea placeholder="Write Your Travel Plan!" class="form-control-text" id="day1" rows="14"></textarea>
		</div>
</div>

		<div class="form-group">
			<input type="submit" value="ok" class="btn btn-primary">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='travelList.do'">
		</div>
	</form>

     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
    </script>
</body>
</html>