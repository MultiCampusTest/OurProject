<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/review.css">
<script src="js/review.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var cnt = 0;
	$('#fileAdd').click(function(){
		var div = document.getElementById('preDiv');
		$('#container').append( $(div).html() );
		$('.ex_file').each(function(index){
			$(this).attr('id', 'idtest'+index);
		});
		$('.label').each(function(index) {
			$(this).attr('id', 'labelid'+index);
			$(this).attr('for', 'idtest'+index);
			
		})
		$('.ex_image').each(function(index){
			$(this).attr('id', 'img'+index);
			if($(this).attr('id').substring(3) > cnt){
				$(this).attr('src', 'img/review/noimage.png');
			}
		})
		cnt++;
	})
});

function readURL(input) {
	alert($(input).attr('id'));
	var id = $(input).attr('id');
	var num = id.substring(6);
	
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#image' + id).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>
<body>
	<div class="container">
		<div>
			<h3>후기게시판</h3>
		</div>
		<div class="row">
			<button class="btn btn-primary" id="fileAdd">파일 추가</button>
			<div  id="preDiv" class="table-responsive" id="reviewPhoto" style="display: none;">
				<table id="preTable" class="table table-condensed" style="height: inherit; vertical-align: middle;">
						<tr class="clearfix" align="center" style="vertical-align: center">
							<td style="width: 35%; vertical-align: middle;">
								<div class="filebox" style="padding-top: 10px">
									<label for="idtestfirst" id="label" class="label">choose file</label> 
									<input type="file" id="idtestfirst" name="file" class="ex_file" onchange="readURL(this)">
								</div>
							</td>
							<td style="width: 65%; height: 80%">
								<img id="imgfirst" class="ex_image" src="img/review/noimage.png">
							</td>
						</tr>
				</table>
			</div>
			<form action="reviewUpdate.do" method="post" enctype="multipart/form-data">
				<div class="col-md-5">
					<h2>Photo</h2>
					<input type="hidden" name="boardIdx" value="${review.boardIdx }">
					<div class="table-responsive" id="reviewPhoto">
						<table class="table table-condensed" style="height: inherit; vertical-align: middle">
							<c:forEach var="image" items="${reviewImage}">
								<tr class="clearfix" align="center" style="vertical-align: center">
									<td style="width: 35%; vertical-align: middle;">
										<div class="filebox" style="padding-top: 10px">
											<input type="hidden" name="img_idx" value="${image.img_idx }">
											<label for="${image.img_idx }" id="label" class="label">choose file</label> 
											<input type="file" id="${image.img_idx }" name="file" class="ex_file" onchange="readURL(this)">
										</div>
									</td>
									<td style="width: 65%; height: 80%">
										<img  class="ex_image" id="image${image.img_idx }" src="imageView.do?img_idx=${image.img_idx }" style="width: 200px">
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="container">
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