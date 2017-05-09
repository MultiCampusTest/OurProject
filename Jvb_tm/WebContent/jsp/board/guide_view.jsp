<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	var list = new Array();
	<c:forEach items="${mapPosition}" var="latLng">
		list.push("${latLng}");
	</c:forEach>
	
	var start_latLng = list[0];
	var end_latLng = list[list.length-1];
    var str_latLng = "";
	for (var i = 0; i < list.length; i++) {
    	str_latLng += list[i] +"|";
	}
	
	str_latLng = str_latLng.slice(0,-1);
	
	$('#map_location').append('<img src="http://maps.googleapis.com/maps/api/staticmap?size=400x500&key=AIzaSyBX21maM7ZEhRTCF0_hB8DSrYHsKOof2m8'+
			'&path=color:0x333333ff|weight:2|'+str_latLng+'&markers=color:red|label:S|'+start_latLng+
			'&markers=color:red|label:E|'+end_latLng+'&sensor=false">');

})
</script>
</head>
<body>  
<div class="container">
	<div class="row">
		<div class="col-md-5">
			<div id="map_location">
			
		</div>
    	</div>
    	<div class="col-md-7">
	      	<div class="form-group">
	          <label class="control-label">TITLE</label>
	          <pre class="form-control">${guide.title}</pre>
		  	</div>
		  	
		  	<hr>
		  	
		  	<div class="form-group">
	          <label class="control-label">DATE:</label><br>
	          <pre class="form-control col-md-6">${guide.startDate }</pre> 
	          ~
	          <pre class="form-control col-md-6">${guide.endDate }</pre>
	        </div>
	        
	        <hr>
	        
		  	<div class="form-group">
			  <label class="control-label">DATE CATEGORY:</label>
		      <pre class="form-control">category</pre>
		    </div>
		    
		    <hr>
		    
		    <div class="form-group">
			  <label class="control-label"> LOC CATEGORY:</label>
		      <pre class="form-control">location</pre>
		    </div>
		    
		    <hr>
		    <div class="form-group">
	          <label class="control-label">CONTENT:</label>
	          <pre class="form-control">${contents.contents }</pre>
			</div>
			<div class="form-group">
				<input type="button" value="list" class="btn btn-primary" onclick="location.href='guideList.do'">
			</div>
	    </div>
  </div>
  <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form">
                 <div class="form-group">
                     <textarea class="form-control" rows="3"></textarea>
                 </div>
                 <button type="submit" class="btn btn-primary">Submit</button>
             </form>
         </div>

         <hr>
	<div class="media">
	        <a class="pull-left" href="#">
	            <img class="media-object" src="http://placehold.it/64x64" alt="">
	        </a>
	        <div class="media-body">
	            <h4 class="media-heading">댓글 단 사람
	                <small>August 25, 2014 at 9:30 PM</small>
	            </h4>
	            	여기에 댓글
	        </div>
	</div>
</div>
</body>
</html>