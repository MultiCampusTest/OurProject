  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--   커스텀CSS -->
<link href="css/noticeView.css" rel="stylesheet">
  
<title>Insert title here</title>
<script src="js/comments.js"></script>
</head>
<body>
 <div class="container">

 <div class="row">
     <div class="col-lg-12">
        
         <h1>NOTICE</h1>

         <p class="lead">
             by Admin
         </p>

         <hr>

         <p><span class="glyphicon glyphicon-time"></span> 
         <fmt:formatDate value="${notice.writeDate}" pattern="yyyy-MM-dd" /></p>
         <hr>
		
		<p class="lead" style="font-size:25px;">
         	TITLE
         </p>
        <p class="lead">
        	${notice.title }
        </p>
         
         <hr>

         <p class="lead" style="font-size:25px;">
         	CONTENT
         </p>
         
         <p class="lead" id="contents">
         ${contents.contents }
         </p>
         
         <hr>
<%--          <c:choose> --%>
<%-- 			<c:when test="${userid == admin}"> --%>
<!-- 				<input type="button" class="btn btn-primary" value="Modify" -->
<%-- 						style="float:left;" onclick="location.href='noticeModifyForm.do?boardIdx=${notice.boardIdx}'"> --%>
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>
		 <c:if test="${userid == notice.userid}">
		 	<input type="button" class="btn btn-primary" value="Modify" style="float:left;" onclick="location.href='noticeModifyForm.do?boardIdx=${notice.boardIdx}'">
		 </c:if>
			<input type="button" class="btn btn-primary" value="LIST" onclick="location.href='noticeList.do?page=${page}&searchValue=${searchValue }'">
		<br>
		<br>

<!-- Comments Form -->
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post">
                 <div class="form-group">
                 	 <input type="hidden" name="b_writer" value="${notice.userid }">
                	 <input type="hidden" name="b_code" value="${notice.code }">
                	 <input type="hidden" name="comment_pre_depth" value="0">
                 	 <input type="hidden" name="b_idx" value="${notice.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="site" value="notice">
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
                 	 <input type="hidden" name="b_writer" value="${notice.userid }">
                	 <input type="hidden" name="b_code" value="${notice.code }">
                	 <input type="hidden" name="comment_pre_depth" value="1">
                	 <input type="hidden" name="b_idx" value="${notice.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="cm_parent" >
                 	 <input type="hidden" name="parent_cm">
                 	 <input type="hidden" name="cm_depth">
                 	 <input type="hidden" name="site" value="notice">
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
                 	 <input type="hidden" name="b_idx" value="${notice.boardIdx }">
                 	 <input type="hidden" name="cm_idx" >
                 	 <input type="hidden" name="site" value="notice">
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
           						<img class="userid_img" src="imageProfileView.do?img_code=${comments.cm_writer }"
                              	 width="50px" height="50px">
<!--                  			<img class="media-object" src="http://placehold.it/64x64" alt=""> -->
            			</a>
             			<div class="media-body">
                 		<h4 class="media-heading">${comments.cm_writer }
                 		<input type="hidden" name="cm_idx" value="${comments.cm_idx}">
                      		<small>${comments.cm_date }</small>
                  		</h4>
                  		<div id="commentsDiv${comments.cm_idx}">
                  			${comments.cm_content }
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
 </div>
 <!-- /.row -->

 <hr>


    </div>
</body>
</html>