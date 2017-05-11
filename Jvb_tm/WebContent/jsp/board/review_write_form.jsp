  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>review write</title>

<link rel="stylesheet" href="css/review.css">
<script src="js/review.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#fileAdd').click(function(){
			type : 'post',
			url : 'reviewWrite.do',
			data : 
		});
	})
</script>

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
					<button class="btn btn-primary" id="fileAdd">파일 추가</button>
					<form action="reviewWrite.do" method="post" enctype="multipart/form-data">
						<table id="preset" class="table table-condensed" style="height: inherit; vertical-align: middle;">
							<c:forEach begin="1" end="5" var="i" varStatus="status">
								<tr class="clearfix" align="center" style="vertical-align: center">
									<td style="width: 35%; vertical-align: middle;">
										<div class="filebox" style="padding-top: 10px">

											<label for="ex_file${status.index}" id="label${status.index}" class="label">choose file</label> 
												<input type="file" name="file" id="ex_file${status.index}" onchange="readURL(this)">
										</div>
									</td>


									<td style="width: 65%; height: 80%">
										<div class="aspect_1_1 imgDiv">
											<img id="img${status.index }" src="img/review/noimage.png">
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
						<label class="control-label ">TITLE:</label> 
						<input class="form-control" name="title" type="text">
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
						<textarea class="form-control" name="contents" rows="10" style="resize: none;"></textarea>
					</div>
					<input type="hidden" name="code" value="r"> 
					<div class="form-group">
						<input type="submit" value="ok" class="btn btn-primary"> 
						<input type="reset" value="reset" class="btn btn-primary"> 
						<input type="button" value="list" class="btn btn-primary" onclick="location.href='reviewList.do'">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>