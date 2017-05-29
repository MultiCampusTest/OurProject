  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/noticeWriteForm.css">
<title>Insert title here</title>

</head>
<body>
 <div class="container">

 <div class="row">
     <div class="col-lg-12">
		 <form class="form" action="noticeModify.do" method="post">
     	 <p class="lead" style="font-size: 50px">
     	 	NOTICE
     	 </p>
	
		 <hr>

         <p class="lead" style="font-size:25px;">
         	TITLE
         </p>
         <input type="text" value="${notice.title}" class="form-control" name="title"/>

         <hr>

         <!-- Content -->
         <p class="lead" style="font-size:25px;">
         	CONTENT
         </p>
         <textarea class="form-control-text" rows="10" name="contents">${contents.contents }</textarea>

		 <div class="form-group" style="float:right">
		 	<input type="hidden" value="${notice.readCount }" name="readCount">
			<input type="hidden" value="${notice.boardIdx }" name="boardIdx">
			<input type="submit" value="ok" class="btn btn-primary">
			<input type="button" value="cancel" class="btn btn-primary" 
								onclick="location.href='noticeView.do?boardIdx=${notice.boardIdx}'">
		</div>
		 </form>
     </div>
 </div>


</div>
</body>
</html>