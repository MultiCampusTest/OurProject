<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/review.css"> -->
<style type="text/css">
	.userid_img {
		border-radius: 50em;
		 -webkit-transition: all 0.3s ease-in-out;
		  -moz-transition: all 0.3s ease-in-out;
		   -o-transition: all 0.3s ease-in-out;
		    -ms-transition: all 0.3s ease-in-out;
		     transition: all 0.3s ease-in-out; }
</style>

<script src="js/comments.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="container">
		<div>
			<h3>Let's Share Your Review</h3>
		</div>
		<div class="row">
<!-- 				<div class="col-md-5"> -->
<!-- 					<h2>Photo</h2> -->
<!-- 					<div class="table-responsive" id="reviewPhoto"> -->
<!-- 						<table class="table table-condensed" style="height: inherit; vertical-align: middle"> -->
<%-- 							<c:forEach var="image" items="${reviewImage}"> --%>
<!-- 								<tr class="clearfix" align="center" style="vertical-align: center"> -->
<!-- 									<td style="width: 65%; height: 80%"> -->
<%-- 											<img src="imageView.do?img_idx=${image.img_idx }" style="width: 200px"> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="col-md-7">
					<h2>Contents</h2>
					<div class="form-group">
						<label class="control-label ">TITLE:</label> <br>
							${review.title }
					</div>
					<hr>
					<div class="form-group">
						<label class="control-label ">WRITER:</label> <br>
							${review.userid }
					</div>
					<hr>
					<div class="form-group">
						<label class="control-label">CATEGORY:</label><br>
							${review.subCategory }
					</div>
					<hr>
					<div class="form-group">
						<label class="control-label">CONTENT:</label>
							${contents.contents }
					</div>
					<div class="form-group">
					<c:if test="${userid == review.userid}">
						<input type="button" value="modify" class="btn btn-primary" onclick="location.href='reviewModifyForm.do?boardIdx=${review.boardIdx}'">
						<input type="button" value="delete" class="btn btn-primary" onclick="location.href='reviewDelete.do?boardIdx=${review.boardIdx}'">
					</c:if>
						<input type="button" value="list" class="btn btn-primary" 
						onclick="location.href='reviewList.do?boardIdx=${review.boardIdx}&page=${page}&searchValue=${searchValue}&subCategory=${subCategory}'">
					</div>
				</div>
		</div>
 
		<!-- Comments Form -->
		<c:if test="${userid != null }">
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post" onsubmit="return inputCommentEven();">
                 <div class="form-group">
                 	 <input type="hidden" name="b_writer" value="${review.userid }">
                	 <input type="hidden" name="b_code" value="${review.code }">
                	 <input type="hidden" name="comment_pre_depth" value="0">
                 	 <input type="hidden" name="b_idx" value="${review.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="site" value="review">
                     <textarea class="form-control" id="cm_content" name="cm_content" rows="3"></textarea>
                 </div>
<!--                  <button type="submit" class="btn btn-primary">Submit</button> -->
                 <input type="submit" value="submit" class="btn btn-primary">
             </form>
         </div>
         </c:if>
         
         
<!--         reComments input, nondisplay -->
         <div class="well" style="display: none;" id="reComments">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsWrite.do" method="post" name="reForm">
                 <div class="form-group">
                 	 <input type="hidden" name="b_writer" value="${review.userid }">
                	 <input type="hidden" name="b_code" value="${review.code }">
                	 <input type="hidden" name="comment_pre_depth" value="1">
                 	 <input type="hidden" name="b_idx" value="${review.boardIdx }">
                 	 <input type="hidden" name="cm_writer" value="${userid}">
                 	 <input type="hidden" name="cm_parent" >
                 	 <input type="hidden" name="parent_cm">
                 	 <input type="hidden" name="cm_depth">
                 	 <input type="hidden" name="site" value="review">
                     <textarea class="form-control" name="cm_content" rows="3"></textarea>
                 </div>
                 <input type="submit" value="submit" class="btn btn-primary">
                 <input type="button" value="cancel" class="btn btn-primary" onclick="commentsCancel()">
             </form>
         </div>
         
<!--          comments update form -->
         <div class="well" style="display: none;" id="updateComments">
             <h4>Leave a Comment:</h4>
             <form role="form" action="commentsUpdate.do" method="post" name="updateForm" onsubmit="return updateCommentEven();">
                 <div class="form-group">
                 	 <input type="hidden" name="b_idx" value="${review.boardIdx }">
                 	 <input type="hidden" name="cm_idx" >
                 	 <input type="hidden" name="site" value="review">
                     <textarea class="form-control" name="cm_content" rows="3" id="cm_update_content"></textarea>
                 </div>
                 <input type="submit" value="update" class="btn btn-primary">
                 <input type="button" value="cancel" class="btn btn-primary">
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
	              					<a onclick="location.href='commentsDelete.do?cm_idx=${comments.cm_idx}&b_idx=${comments.b_idx }&site=review'"> delete</a>
	              					<a onclick="commentsUpdate(${comments.cm_idx})"> update</a>
	              				</c:if>
	              				<c:if test="${userid != null }">
		              				<a onclick="commentsInput(${comments.cm_idx},${comments.cm_parent },'${comments.cm_writer }',${comments.cm_depth })"> re-comment</a>
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