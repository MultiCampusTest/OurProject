  <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
             by Admin
         </p>

         <hr>

         <!-- Date/Time -->
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

         <!-- Post Content -->
         <p class="lead" style="font-size:25px;">
         	CONTENT
         </p>
         <p class="lead">
         	${contents.contents}
         </p>
         <hr>
         <c:choose>
			<c:when test="${userid != admin }">
				<input type="button" class="btn btn-primary" value="Modify"
						style="float:right;" onclick="location.href='noticeModifyForm.do'">
			</c:when>
		</c:choose>
		<br>
		<br>


         <!-- Comments Form -->
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${notice.boardIdx }">
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
        			<div class="media" style="margin-left : ${20*comments.cm_depth}px">
           				<a class="pull-left" href="#">
                 		<img class="media-object" src="http://placehold.it/64x64" alt="">
            			</a>
             			<div class="media-body">
                 		<h4 class="media-heading">${comments.cm_writer }작성자
                      		<small>${comments.cm_date }작성날짜</small>
                  		</h4>
                  			${comments.cm_content }내용
              			</div>
              			<a href="#"> 삭제</a>
              			<a href="#"> 수정</a>
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