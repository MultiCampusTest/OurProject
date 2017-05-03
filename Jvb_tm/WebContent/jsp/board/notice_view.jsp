  <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!--   커스텀CSS -->
<link href="css/noticeView.css" rel="stylesheet">
  
<title>Insert title here</title>
</head>
<body>
 <div class="container">

 <div class="row">

     <!-- Blog Post Content Column -->
     <div class="col-lg-12">

         <!-- Blog Post -->

         <!-- Title -->
         <h1>NOTICE</h1>

         <!-- Author -->
         <p class="lead">
             by <a href="#">Admin</a>
         </p>

         <hr>

         <!-- Date/Time -->
         <p><span class="glyphicon glyphicon-time"></span> Posted on August 24, 2013 at 9:00 PM</p>

         <hr>


         <!-- Post Content -->
         <p class="lead">
         	여기가 공지사항을 쓰는 곳이야. OTL 삼삼삼삼 하삼 
         	해주삼 안녕하삼 안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼안녕하삼
         	안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 안녕하삼 
         </p>
         <hr>

         <!-- Blog Comments -->

         <!-- Comments Form -->
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form" action="noticeWrite.do" method="post">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${board.b_idx }">
                     <textarea class="form-control" name="cm_content" rows="3"></textarea>
                 </div>
<!--                  <button type="submit" class="btn btn-primary">Submit</button> -->
                 <input type="submit" value="등록" class="btn btn-primary">
             </form>
         </div>

         <hr>
         <!-- Comment -->
        <c:choose>
        	<c:when test="${comments ==null }">
        		댓글이 없습니다.
        	</c:when>
        	<c:otherwise>
        		<c:forEach var="comments" items="${comments}" varStatus="status">
    			<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*comments.cm_depth}"/>px; display: inline-block">    
		       		<c:out value="${comments.cm_writer}"/> <c:out value="${comments.cm_date}"/>
		        	<a href="#" onclick="fn_replyDelete('<c:out value="${comments.cm_idx}"/>')">삭제</a>
		        	<a href="#" onclick="fn_replyUpdate('<c:out value="${comments.cm_idx}"/>')">수정</a>
		        	<a href="#" onclick="fn_replyReply('<c:out value="${comments.cm_idx}"/>')">댓글</a>
		        	<br/>
		        	<div id="reply<c:out value="${comments.cm_idx}"/>">
		        		<c:out value="${comments.cm_content}"/>
		        	</div>
		    	</div><br/>
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