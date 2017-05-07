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

var contents = [];

$(function() {
	$(".selector").flatpickr({

	});
});
// function form_submit(){
// 	$('#btn_submit').click( function() {
// 	     var $form = $('<form></form>');
// 	     $form.attr('action', 'board_write.do');
// 	     $form.attr('method', 'post');
// 	     $form.appendTo('body');
	     
<%-- 	     var idx = $('<input type="hidden" value="<%=idx%>" name="idx">'); --%>
<%-- 	     var page = $('<input type="hidden" value="<%=page%>" name="page">'); --%>
<%-- 	     var category = $('<input type="hidden" value="<%=category%>" name="category">'); --%>
<%-- 	     var keyfield = $('<input type="hidden" value="<%=keyfield%>" name="keyfield">'); --%>
<%-- 	     var keyword = $('<input type="hidden" value="<%=keyword%>" name="keyword">'); --%>
	 
// 	     $form.append(idx).append(page).append(category).append(keyfield).append(keyword);
// 	     $form.submit();
// 	});

// }


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
			 + 'id="day'+next_day+'" rows="10"></textarea>');
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


	$('#submit').on('click',function(){
		$('#content > textarea').each(function(){
			contents.push($(this).val());
		});
		
		form_submit();
	});
	
	
	
})

</script>
<style type="text/css">
#map { 
width: 400px; 
height: 600px;
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

			<ul class="sibal">
				<li class="day" value="1" >DAY1</li>
				
			</ul>
	<ul class="sibal2">
		<li style="padding-top:10px;">
			<div class="add-day-button" onclick="add_day_content()">DAY 추가</div>
		</li>
	</ul>
		</div>
		
	<div class="col-md-5">
		<div>
		<font style="font-size:20px">TITLE</font>
         	<input type="text" placeholder="Insert Title " class="form-control title" name="subject"/>
		<hr/>
		</div>
		<div>
        <font style="font-size:20px">DATE</font><br>
          <input class="selector" id="fromDate" type="text"> 
          ~
          <input class="selector" id="toDate" type="text">
        </div>
	    <hr>
	    <div>
		 <p style="font-size:20px">CATEGORY</p>
	     <div style="float:left; margin-right:20px">
	     <font style="font-size:20px;">DATE</font><br> 
	      	<select class="form-control category">
	            <option value="5days">5DAYS</option>
	            <option value="10days">10DAYS</option> 
	            <option value="15days">15DAYS</option> 
	        </select>
	      </div>
	      <div style="float:left;">
	     	<font style="font-size:20px">LOCATION</font><br>
	      	<select class="form-control category" >
	            <option value="seoul">SEOUL</option>
	            <option value="incheon">INCHEON</option>
	            <option value="gyunggi">GYUNGGI</option>  
	        </select>
	       </div> 
	     </div>
	     <br><br><br>
	  
	    <hr> 
	    
		<div id="content">
		<font style="font-size:20px">CONTENT</font>	 
			<textarea placeholder="Write Your Travel Plan!" class="form-control-text" id="day1" rows="10"></textarea>		
		</div>
		</div>
</div>

		<div class="form-group">
			<input type="button" value="ok" class="btn btn-primary" id="submit">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='travelList.do'">
		</div>
     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArBFw8nNcgJ_mlUdagcoWxjlyIY1pnh7E&callback=initMap">
    </script>
</body>
</html>