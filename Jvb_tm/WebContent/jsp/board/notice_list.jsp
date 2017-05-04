  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!--   커스텀 CSS, JS -->
<link href="css/noticeList.css" rel="stylesheet">
<!-- <script src="js/profile.js"></script> -->
 
</head>
<body>
	<div class="container">
		<div class="col-md-15">

			<div class="row">
					<img class="notice_slide" src="img/notice/notice_img.jpg" alt="">
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
						<td>${notice.boardIdx }</td>
						<td><a href="noticeView.do?boardIdx=${notice.boardIdx}"
							style="text-decoration: none">${notice.title }</a></td>
						<td>${notice.userid}</td>
						<td><fmt:formatDate value="${notice.writeDate}"
								pattern="yyyy-MM-dd" /></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${userid != admin }">
				<input type="button" class="btn btn-primary" value="등록" onclick="location.href='noticeWriteForm.do'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-primary" value="관리자가아니네?" onclick="location.href='main.do'">
			</c:otherwise>
		</c:choose>
		<br>

		<div class="jb-center">
			<ul class="pagination">
				<li>
				 <c:choose>
				 	<c:when test="${current != 1 }">
				 		<a href="noticeList.do?page=${current-1}"><span
						class="glyphicon glyphicon-chevron-left"></span></a>
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
								<li class="paging"><a href="noticeList.do?page=${i}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
				<li>
					<c:choose>
						<c:when test="${current != last }">
						<a href="noticeList.do?page=${current+1}"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
						</c:when>
						<c:otherwise>
							<a><span
							class="glyphicon glyphicon-chevron-right"></span></a>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>


	</div>
</body>
</html>