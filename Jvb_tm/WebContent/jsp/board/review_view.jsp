  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/review.css">
<script src="js/review.js"></script>

</head>
<body>
	<div class="container">
		<div>
			<h3>후기게시판</h3>
		</div>
		<div class="row">
				<div class="col-md-5">
					<h2>Photo</h2>
					<div class="table-responsive" id="reviewPhoto">
						<table class="table table-condensed"
							style="height: inherit; vertical-align: middle">
								<tr class="clearfix" align="center"
									style="vertical-align: center">
									<c:forEach var="image" items="${reviewImage}">
										<td style="width: 65%; height: 80%">
											<div class="aspect_1_1 imgDiv">
												<img src="imageView.do?img_code=${image.img_idx }">
											</div>
										</td>
									</c:forEach>
								</tr>
						</table>
					</div>
				</div>
				<div class="col-md-7">
					<h2>Something Else here</h2>
					<div class="form-group">
						<label class="control-label ">TITLE:</label> 
						<p class="form-control" value="${review.title }" type="text"/>
					</div>
					<div class="form-group">
						<label class="control-label">CATEGORY:</label>
						<p class="form-control" value="${review.sub_category }"/>
					</div>
					<div class="form-group">
						<label class="control-label">CONTENT:</label>
						<pre class="form-control" rows="10" style="resize: none;" value="${review.contents }"></pre>
					</div>
					<div class="form-group">
						<input type="button" value="modify" class="btn btn-primary" onclick="#">
						<input type="button" value="delete" class="btn btn-primary">
						<input type="button" value="list" class="btn btn-primary" onclick="location.href='reviewList.do'">
					</div>
				</div>
			</form>
		</div>

		<!-- Comments Form -->
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${notice.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
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
                 	 <input type="hidden" name="b_idx" value="${notice.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="cm_parent" >
                 	 <input type="hidden" name="parent_cm">
                 	 <input type="hidden" name="cm_depth">
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
                  		</div>
              			</div>
              				<c:if test="${comments.cm_delete != 'Y' }">
	              				<c:if test="${comments.cm_writer == userid }">
	              					<a onclick="location.href='commentsDelete.do?cm_idx=${comments.cm_idx}&b_idx=${comments.b_idx }'"> 삭제</a>
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
        <hr>
	</div>
</body>
</html>