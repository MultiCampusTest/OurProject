<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	//좌표값 받기
	var list = [];
	<c:forEach items="${mapPosition}" var="latLng">
		list.push("${latLng.latLng}");
	</c:forEach>
	
	var start_latLng = list[0];
	var end_latLng = list[list.length-1];
	var str_latLng = "";
	for (var i = 0; i < list.length; i++) {
		str_latLng += list[i] +"|";
	} 
	
	str_latLng = str_latLng.slice(0,-1);
	
	$('#map_location').append('<img src="http://maps.googleapis.com/maps/api/staticmap?size=450x400&key=AIzaSyBX21maM7ZEhRTCF0_hB8DSrYHsKOof2m8'+
			'&path=color:0x333333ff|weight:2|'+str_latLng+'&markers=color:red|label:S|'+start_latLng+
			'&markers=color:red|label:E|'+end_latLng+'&sensor=false">');
	
		  
		$('.sibal > li').each(function(){
			if(1 == $(this).val()){
				$(this).addClass('on');
			}else{
				$(this).removeClass('on');
			}
		});
		
		$('#content textarea').each(function(){
			if('day1' == $(this).attr('id')){
				$(this).show();
			}else{
				$(this).hide();
			}
		});
	
	$('.sibal > li').on('click',function(){
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
					$(this).show();
				}else{
					$(this).hide();
				}
			});
		});
})
</script>

<style type="text/css">
.sibal{
list-style:none;
max-height:400px;
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

 
 .category{
 	width:200px;
	font-size:15px;
 }
</style>
</head>
<body>
<div class="container">
  
	<div> <h2>Let's Share Your Travel Plans</h2> </div>
	 <hr>
	 <div class="row"> 
		<div class="col-md-5">
			<p class="lead">
        	 By ${travel.userid }
           </p>
           <div style="font-size:17px;">
            <i class="fa fa-calendar" aria-hidden="true"></i> ${travel.startDate } ~ ${travel.endDate }
           </div>
			<div id="map_location"></div>
		</div>
		<div class="col-md-2">
			<ul class="sibal">
				<c:forEach items="${contents}" var="contents">
					<li class="day" value="${contents.contentsSeq + 1}" >DAY${contents.contentsSeq+1}</li>
				</c:forEach>
			</ul>
		</div>
		
	  <div class="col-md-5">
	          <p class="lead" style="font-size:25px;">
	          	${travel.title }
         	  </p>
         	  <hr>
	          <font class="lead" style="font-size:25px;">
         		CONTENT
         	  </font>
         	  <br>
         	  <div id="content">         	  
         	  <c:forEach items="${contents}" var="contents">
					<textarea class="form-control-text" id="day${contents.contentsSeq+1}"
						rows="12" style="resize:none;" readonly="readonly">${contents.contents }</textarea>
			  </c:forEach>
         	  </div>
         	  <br>
		<div class="button-list"> 
				<c:choose>
					<c:when test="${userid eq travel.userid }">
						<input type="button" value="Modify" class="btn btn-primary" 
								onclick="location.href='guideModifyForm.do?boardIdx=${guide.boardIdx}'">
						<input type="button" value="delete" class="btn btn-primary" 
								onclick="delete_event()">
					</c:when>
				</c:choose>
				<input type="button" value="list" class="btn btn-primary" onclick="location.href='travelList.do'">
			</div>
		</div>
	</div>
</div>

</body>
</html>