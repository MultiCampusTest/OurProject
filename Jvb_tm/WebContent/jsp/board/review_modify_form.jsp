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
			<form action="reviewUpdate.do" method="post" enctype="multipart/form-data">
				<div class="col-md-5">
					<h2>Photo</h2>
					<input type="hidden" name="boardIdx" value="${review.boardIdx }">
					<div class="table-responsive" id="reviewPhoto">
						<table class="table table-condensed" style="height: inherit; vertical-align: middle">
							<c:forEach var="image" items="${reviewImage}">
								<tr class="clearfix" align="center" style="vertical-align: center">
									<td style="width: 65%; height: 80%">
											<img src="imageView.do?img_idx=${image.img_idx }" style="width: 200px">
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="col-md-7">
					<h2>게시글을 수정하시오</h2>
					<div class="form-group">
						<label class="control-label ">TITLE:</label> 
						<input class="form-control" name="title" value="${review.title }" type="text">
					</div>
					<div class="form-group">
						<label class="control-label">CATEGORY:</label>
						<div class="ui-select">
							<select name="subCategory" id="review_category" class="form-control">
								<option value="select">select</option>
								<option value="food" id="food">food</option>
								<option value="shopping" id="shopping">shopping</option>
								<option value="stay" id="stay">stay</option>
								<option value="tour" id="tour">tour</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">CONTENT:</label>
						<textarea  name="contents" class="form-control" rows="10" style="resize: none;">${contents.contents }</textarea>
					</div>
					<div class="form-group">
						<input type="submit" value="modify" class="btn btn-primary">
						<input type="reset" value="reset" class="btn btn-primary">
						<input type="button" value="list" class="btn btn-primary"
							onclick="location.href='reviewList.do'">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>