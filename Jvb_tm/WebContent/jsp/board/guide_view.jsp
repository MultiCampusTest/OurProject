<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/comments.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
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
	
	$('#map_location').append('<img src="http://maps.googleapis.com/maps/api/staticmap?size=500x400&key=AIzaSyBX21maM7ZEhRTCF0_hB8DSrYHsKOof2m8'+
			'&path=color:0x333333ff|weight:2|'+str_latLng+'&markers=color:red|label:S|'+start_latLng+
			'&markers=color:red|label:E|'+end_latLng+'&sensor=false">');

}) 

$("#message").click(function(){
    $('div.modal').modal({
                  remote : 'modal.html'
            });
})
</script>
</head>
<body>  
<div class="container">
	<div> <h2>I'm Looking For a Guide</h2> </div>
	<hr>
	<div class="row">
		<div class="col-md-6">
			<p class="lead">
        	${guide.title }
           </p>
           <div style="font-size:17px;">
            <i class="fa fa-calendar" aria-hidden="true"></i> ${guide.startDate } ~ ${guide.endDate }
           </div>
			<div id="map_location"></div>
    	</div>
    	<div class="col-md-6">
		    <div class="form-group">
	          <p class="lead" style="font-size:25px;">
         		CONTENT
         	  </p>
         	  <hr>
	          <textarea readonly="readonly" rows="19" cols="75" name="contents">${contents.contents }</textarea>
			</div> 
			<div class="form-group">
				<c:choose>
					<c:when test="${userid eq guide.userid }">
						<input type="button" value="Modify" class="btn btn-primary" 
								onclick="location.href='guideModifyForm.do?boardIdx=${guide.boardIdx}'">
					</c:when>
				</c:choose>
				<input type="button" value="list" class="btn btn-primary" onclick="location.href='guideList.do'">
			</div>
	    </div>
  </div>
  <br><br>
  
  
<!-- Comments Form -->
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${guide.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="site" value="guide">
                     <textarea class="form-control" name="cm_content" rows="3"></textarea>
                 </div>
<!--                  <button type="submit" class="btn btn-primary">Submit</button> -->
                 <input type="submit" value="등록" class="btn btn-primary">
             </form>
         </div>
         
<!--         reComments input, nondisplay -->
         <div class="well" style="display: none;" id="reComments">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post" name="reForm">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${guide.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="cm_parent" >
                 	 <input type="hidden" name="parent_cm">
                 	 <input type="hidden" name="cm_depth">
                 	 <input type="hidden" name="site" value="guide">
                     <textarea class="form-control" name="cm_content" rows="3"></textarea>
                 </div>
                 <input type="submit" value="등록" class="btn btn-primary">
                 <input type="button" value="취소" class="btn btn-primary" onclick="commentsCancel()">
             </form>
         </div>
         
<!--          comments update form -->
         <div class="well" style="display: none;" id="updateComments">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsUpdate.do" method="post" name="updateForm">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${guide.boardIdx }">
                 	 <input type="hidden" name="cm_idx" >
                 	 <input type="hidden" name="site" value="guide">
                     <textarea class="form-control" name="cm_content" rows="3"></textarea>
                 </div>
                 <input type="submit" value="수정" class="btn btn-primary">
                 <input type="button" value="취소" class="btn btn-primary" onclick="commentsUpdateCancel()">
             </form>
         </div>		

         <hr>
         <!-- Comment List -->
        <c:choose>
        	<c:when test="${comments ==null }">
        		댓글이 없습니다.
        	</c:when>
        	<c:otherwise>
        		<c:forEach var="comments" items="${comments}" varStatus="status">
        			<div class="media" style="margin-left : ${25*comments.cm_depth}px">
           				<a class="pull-left" href="#">
                 		<img class="media-object" src="http://placehold.it/64x64" alt="">
            			</a>
             			<div class="media-body">
	                 		<h4 class="media-heading">${comments.cm_writer }
	                 		<input type="hidden" name="cm_idx" value="${comments.cm_idx}">
	                      		<small>${comments.cm_date }</small>
	                  		</h4>
	                  		<div id="commentsDiv${comments.cm_idx}">
	                  			${comments.cm_content }
	                  		<c:if test="${comments.cm_depth == 0 }">
	                  			<button type="button" class="btn btn-primary btn-lg glyphicon glyphicon-envelope" data-toggle="modal" data-target="#myModal"></button>
	                  			<div id="myModal" class="modal fade" role="dialog">
								  <div class="modal-dialog">
								
								    <!-- Modal content-->
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <h4 class="modal-title">메시지를 입력하세요</h4>
								      </div>
								      <div class="modal-body">
								        <textarea rows="10" cols="75"></textarea>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								
								  </div>
								</div>
	                  		</c:if>
	                  		
	                  		</div>
              			</div>
              				<c:if test="${comments.cm_delete != 'Y' }">
	              				<c:if test="${comments.cm_writer == userid }">
	              					<a onclick="location.href='commentsDelete.do?cm_idx=${comments.cm_idx}&b_idx=${comments.b_idx }&site=notice'"> 삭제</a>
	              					<a onclick="commentsUpdate(${comments.cm_idx})"> 수정</a>
	              				</c:if>
	              				<c:if test="${userid != null }">
		              				<a onclick="commentsInput(${comments.cm_idx},${comments.cm_parent },'${comments.cm_writer }',${comments.cm_depth })"> 댓글</a>
		              			</c:if>	
              				</c:if>
          		    </div>
          		</c:forEach>
        	</c:otherwise>
        </c:choose>
</div>
</body>
</html>