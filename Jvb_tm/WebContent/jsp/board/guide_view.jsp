<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
// 	var list = new Array(); 
// 	<c:foreach items="${mapPosition}" var="loc">
// 	list.push("${loc.latLng}");
// 	alert(${loc.latLng});
// 	</c:foreach>

	var list = ${mapPosition[0].latLng};
	alert(list);
})
</script>
</head>
<body>  
<div class="container">
	<div class="row">
		<div class="col-md-5">
      		<h2>Google Map here</h2>
			<div id="map" >
<!-- 				<img src="http://maps.googleapis.com/maps/api/staticmap?center=37.566535,126.97796919999996&size=400x500&visible=37.5609781462155,126.98567233576205 -->
<!-- 							&markers=color:red%7C37.5759879,126.97796919999996&markers=color:red%7C37.6783756,126.77117739999994 -->
<!-- 							&key=AIzaSyBX21maM7ZEhRTCF0_hB8DSrYHsKOof2m8&sensor=false"> -->
				
				<img src="http://maps.googleapis.com/maps/api/staticmap?size=400x500&key=AIzaSyBX21maM7ZEhRTCF0_hB8DSrYHsKOof2m8
				&path=color:0x333333ff|weight:2|37.5759879,126.97796919999996|37.6783756,126.77117739999994|37.4562557,126.70520620000002
				&markers=color:red|label:S|37.5759879,126.97796919999996&markers=color:red|label:E|37.4562557,126.70520620000002&sensor=false">
			
			
			</div>
    	</div>
    	<div class="col-md-7">
	      	<h2>Guide 구함</h2>    
	      	<div class="form-group">
	          <label class="control-label ">TITLE:</label>
	          <pre class="form-control">title</pre>
		  	</div>
		  	
		  	<hr>
		  	
		  	<div class="form-group">
	          <label class="control-label">DATE:</label><br>
	          <pre class="form-control col-md-6">firstDay</pre> 
	          ~
	          <pre class="form-control col-md-6">lastDay</pre>
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
	          <pre class="form-control">content</pre>
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