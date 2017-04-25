<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--   커스텀 CSS -->
<link href="css/noticeList.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="col-md-15">

			<div class="row carousel-holder">

				<div class="">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="img/notice/img01.jpg"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="img/notice/img02.jpg"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="img/notice/img03.jpg"
									alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a> 
					</div>
				</div>

			</div>

		</div>
	</div>
	<br>

	<div class="container">
		<h2>Notice</h2>
		<table class="table table-hover">
			<colgroup>
				<col width="60" />
				<col />
				<col width="120" />
				<col width="120" />
				<col width="80" />
			</colgroup>
			<thead>
				<tr>
					<th>#</th>
					<th>title</th>
					<th>wrtier</th>
					<th>date</th>
					<th>views</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<td>${notice.num }</td>
						<td><a href="noticeView.do?num=${notice.num }"
							style="text-decoration: none">${notice.title }</a></td>
						<td>${notice.userid }</td>
						<td><fmt:formatDate value="${notice.writedate }"
								pattern="yyyy-MM-dd" /></td>
						<td>${notice.readCount }</td>
					</tr>
				</c:forEach>
				<tr>

					<td>John</td>
					<td><a href="#">Nada
							Sisisisisbalabal</a></td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>

				</tr>
			</tbody>
		</table>
		<div class="jb-center">
			<ul class="pagination">
				<li><a href="#"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
			</ul>
		</div>


	</div>
</body>
</html>