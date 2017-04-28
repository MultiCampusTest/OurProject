<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>review write</title>

<!-- 달력 -->
<link rel="stylesheet"
	href="https://unpkg.com/flatpickr/dist/flatpickr.min.css">
<script src="https://unpkg.com/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ru.js"></script>
<link rel="stylesheet" href="css/calender.css">

<script type="text/javascript">
	$(function() {
		$(".selector").flatpickr({

		});
	});

	$(function() {
		var divs = document.getElementsByClassName('imgDiv');
		for (var i = 0; i < divs.length; ++i) {
			var div = divs[i];
			var divAspect = div.offsetHeight / div.offsetWidth;
			div.style.overflow = 'hidden';

			var img = div.querySelector('img');
			var imgAspect = img.height / img.width;

			if (imgAspect <= divAspect) {
				// 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
				var imgWidthActual = div.offsetHeight / imgAspect;
				var imgWidthToBe = div.offsetHeight / divAspect;
				var marginLeft = (imgWidthActual - imgWidthToBe) / 2;

				img.style.cssText = 'width: auto; height: 100%; margin-left: '
					+ marginLeft + 'px;';
			} else {
				// 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
				img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
			}
		}

	});

	// 이미지 파일 추가 함수
	$(document).ready(function() {
		$('.label').on('click', function() {
			var id = $(this).attr('id');
			var num = id.substring(5);

			readURL = function(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#img' + num).attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
		});
	});
</script>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #FFFFFF;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #FF605A;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.row-eq-height {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.table {
	background-color: #fff;
	height: 500px;
	margin-bottom: 0;
	text-align: center;
	vertical-align: middle;
}

.table-responsive {
	height: 100%;
}

div.aspect_1_1 {
	width: 200px;
	height: 80px;
}

.clearfix:after {
	content: " ";
	visibility: hidden;
	display: block;
	height: 0;
	clear: both;
}

td {
	vertical-align: middle;
	width: 100%;
	height: 100%;
	margin: auto;
	text-align: center;
	vertical-align: middle;
	display: table-cell;
	text-align: center;
}

.filebox {
	width: 100px;
	height: 50px;
	display: inline-block;
}


</style>
</head>
<body>
	<div class="container">
		<div>
			<h3>후기게시판</h3>
		</div>
		<div class="row">
			<form action="reviewWrite.do" method="post"
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
												class="label">choose file</label> 
												<input type="file" id="ex_file${status.index}" onchange="readURL(this)">
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
						<label class="control-label ">TITLE:</label> <input
							class="form-control" value="제목 입력" type="text">
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<label class="control-label">DATE:</label><br> <input -->
<!-- 							class="selector" id="fromDate" type="text"> ~ <input -->
<!-- 							class="selector" id="toDate" type="text"><br> -->
<!-- 					</div> -->
					<div class="form-group">
						<label class="control-label">CATEGORY:</label>
						<div class="ui-select">
							<select id="review_category" class="form-control">
								<option value="food">food</option>
								<option value="shopping">shopping</option>
								<option value="stay">stay</option>
								<option value="tour">tour</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">CONTENT:</label>
						<textarea class="form-control" rows="10" style="resize: none;"></textarea>
					</div>
					<div class="form-group">
						<input type="submit" value="ok" class="btn btn-primary"> <input
							type="button" value="list" class="btn btn-primary"
							onclick="location.href='guideList.do'">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>