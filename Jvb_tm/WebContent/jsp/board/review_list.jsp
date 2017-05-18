  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/travelList.css">

<script type="text/javascript">
$(document).ready(function(){
	
	var subCategory = "${subCategory}";
	
	$('.category').each(function(){
// 		alert(subCategory);
		if(subCategory == $(this).attr('id')){
// 		alert($(this).attr('id'));
			$(this).attr('class', 'category active');
		}
	})	
	
})
</script>


</head>
<body>
	<div class="content container" style="padding-top: 90px">
		<p style="line-height: 100%">
			<font style="font-size: 12pt">CATEGORY</font> 
			<a href="reviewList.do?subCategory=food"><span class="category" id="food">Food</span></a> 
			<a href="reviewList.do?subCategory=shopping"><span class="category" id="shopping">Shopping</span></a> 
			<a href="reviewList.do?subCategory=stay"><span class="category" id="stay">Stay</span></a> 
			<a href="reviewList.do?subCategory=tour"><span class="category" id="tour">Tour</span></a>
		</p>

	</div>

	<hr />

	<div class="container">
		<p>A Total of ${count} Travel Plans Have Been Searched</p>
	 	<div class="row">
			<c:forEach var="review" items="${list}">
		 		<div class="col-sm-2 col-lg-2 col-md-2">
					<div class="thumbnail">
							<a href="reviewView.do?boardIdx=${review.boardIdx }">
							<img src="imageShow.do?img_code=${review.boardIdx }" style="width: 200px; height: 100px">

						<div class="caption" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
							<font style="font-size: 12pt">${review.title }</font><br>
							<font style="font-size: 12pt">${review.userid }</font><br> 
							<font style="font-size: 12pt"><fmt:formatDate value="${review.writeDate}" pattern="yyyy-MM-dd"/></font><br>
						</div>
						</a>
					</div>					
				</div>
			</c:forEach>
	 	</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-sm-2 col-lg-2 col-md-2"> -->
<!-- 				<div class="thumbnail"> -->
<!-- 					<img src="http://placehold.it/300x400" alt=""> -->
<!-- 					<div class="caption"> -->
<!-- 						<font style="font-size: 12pt">USER_ID</font><br> <font -->
<!-- 							style="font-size: 12pt">DATE</font><br> <font -->
<!-- 							style="font-size: 12pt">REVIEWS</font> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-2 col-lg-2 col-md-2"> -->
<!-- 				<div class="thumbnail"> -->
<!-- 					<img src="http://placehold.it/300x400" alt=""> -->
<!-- 					<div class="caption"> -->
<!-- 						<font style="font-size: 12pt">USER_ID</font><br> <font -->
<!-- 							style="font-size: 12pt">DATE</font><br> <font -->
<!-- 							style="font-size: 12pt">REVIEWS</font> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-2 col-lg-2 col-md-2"> -->
<!-- 				<div class="thumbnail"> -->
<!-- 					<img src="http://placehold.it/300x400" alt=""> -->
<!-- 					<div class="caption"> -->
<!-- 						<font style="font-size: 12pt">USER_ID</font><br> <font -->
<!-- 							style="font-size: 12pt">DATE</font><br> <font -->
<!-- 							style="font-size: 12pt">REVIEWS</font> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-2 col-lg-2 col-md-2"> -->
<!-- 				<div class="thumbnail"> -->
<!-- 					<img src="http://placehold.it/300x400" alt=""> -->
<!-- 					<div class="caption"> -->
<!-- 						<font style="font-size: 12pt">USER_ID</font><br> <font -->
<!-- 							style="font-size: 12pt">DATE</font><br> <font -->
<!-- 							style="font-size: 12pt">REVIEWS</font> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-2 col-lg-2 col-md-2"> -->
<!-- 				<div class="thumbnail"> -->
<!-- 					<img src="http://placehold.it/300x400" alt=""> -->
<!-- 					<div class="caption"> -->
<!-- 						<font style="font-size: 12pt">USER_ID</font><br> <font -->
<!-- 							style="font-size: 12pt">DATE</font><br> <font -->
<!-- 							style="font-size: 12pt">REVIEWS</font> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="col-sm-2 col-lg-2 col-md-2"> -->
<!-- 				<div class="thumbnail"> -->
<!-- 					<a href="#" title="자세히보기"> <img -->
<!-- 						src="http://placehold.it/300x400" alt=""> -->
<!-- 					</a> -->
<!-- 					<div class="caption"> -->
<!-- 						<font style="font-size: 12pt">USER_ID</font><br> <font -->
<!-- 							style="font-size: 12pt">DATE</font><br> <font -->
<!-- 							style="font-size: 12pt">REVIEWS</font> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div style="text-align: right">
			<input type="button" class="btn btn-primary" value="Write"
				onclick="location.href='reviewWriteForm.do'">
		</div>
	</div>

	<hr />
	<div class="jb-center">
			<ul class="pagination">
				<li>
				 <c:choose>
				 	<c:when test="${current != 1 }">
				 		<a href="reviewList.do?page=${current-1}&subCategory=${subCategory}">
				 		<span class="glyphicon glyphicon-chevron-left"></span>
				 		</a>
				 	</c:when>
				 	<c:otherwise>
				 		<a><span class="glyphicon glyphicon-chevron-left"></span></a>
				 	</c:otherwise>
				 </c:choose>
				 </li>
				 				
				<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								<li class="paging active"><a>${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="paging"><a href="reviewList.do?page=${i}&subCategory=${subCategory}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
				<li>
					<c:choose>
						<c:when test="${current != last }">
						<a href="reviewList.do?page=${current+1}&subCategory=${subCategory}">
						<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
						
						</c:when>
						<c:otherwise>
							<a><span
							class="glyphicon glyphicon-chevron-right"></span></a>
						</c:otherwise>
					</c:choose>
					
					
				</li>
			</ul>
		</div> 
</body>
</html>