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
			<form action="reviewModify.do" method="post"
				enctype="multipart/form-data">



				<div class="col-md-5">
					<h2>Photo</h2>
					<div class="table-responsive" id="reviewPhoto">
						<table class="table table-condensed"
							style="height: inherit; vertical-align: middle">

							<c:forEach begin="1" end="5" var="i" varStatus="status">
								<tr class="clearfix" align="center"
									style="vertical-align: center">
									<td style="width: 35%; vertical-align: middle;">
										<div class="filebox" style="padding-top: 10px">

											<label for="ex_file${status.index}" id="label${status.index}"
												class="label">choose file</label> <input type="file"
												id="ex_file${status.index}" onchange="readURL(this)">
										</div>
									</td>




									<!-- 									사진어케가져옴???? -->
									<td style="width: 65%; height: 80%">
										<div class="aspect_1_1 imgDiv">
											<img src="${review.img_path }">
										</div>

									</td>






								</tr>
							</c:forEach>

						</table>
					</div>
				</div>
				<div class="col-md-7">
					<h2>Something Else here</h2>
					<div class="form-group">
						<label class="control-label ">TITLE:</label> <input
							class="form-control" value="${review.title }" type="text">
					</div>
					<div class="form-group">
						<label class="control-label">CATEGORY:</label>
						<div class="ui-select">
							<select id="review_category" class="form-control">
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
						<textarea class="form-control" rows="10" style="resize: none;">${review.contents }</textarea>
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