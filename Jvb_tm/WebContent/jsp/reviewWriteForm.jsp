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

.table-responsive .table {
/* 	border: 0px; */
/* 	width: 500px !important; */
/* 	height: 430px !important; */
/* 	max-width: none !important; */
}

.row-eq-height {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
}
.table {
  background-color: #eee;
  height: 500px;
  margin-bottom: 0;
}
.table-responsive {
  height: 100%;
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
						<table class="table" style="table-layout: fixed;">
						
							<c:forEach begin="1" end="5" var="i">
								<tr align="center">
									<td style="width: 20%">
										<div class="filebox">
											<label for="ex_file">choose file</label> <input type="file"
												id="ex_file">
										</div>
									</td>
									<td style="width: 80%; height: 80%"><img alt=""
										src="img/main/img01.jpg" style="width: 100%; height: 100%"></td>
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
					<div class="form-group">
						<label class="control-label">DATE:</label><br> <input
							class="selector" id="fromDate" type="text"> ~ <input
							class="selector" id="toDate" type="text"><br>
					</div>
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
						<textarea class="form-control" rows="10"></textarea>
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