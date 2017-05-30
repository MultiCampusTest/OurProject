  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/noticeWriteForm.css">
<script type="text/javascript">
function noticeCheck(){
	 
	 if(document.frm.title.value.length==0){
		 alert("제목을 입력하세요.");
		 document.frm.title.focus();
		 return false;
	 }
	 
	 if(document.frm.contents.value.length==0){
		 alert("내용을 입력하세요.");
		 document.frm.contents.focus();
		 return false;
	 }
	
	 
	 return true;
}
</script>
</head>
<body>
 <div class="container">

 <div class="row">

     <!-- Notice Input Column -->
     <div class="col-lg-12">
		 <form name="frm" class="form" action="noticeWrite.do" method="post">
     	 <p class="lead" style="font-size: 50px">
     	 	NOTICE
     	 </p>
	
		 <hr>
         <!-- Title -->
         <p class="lead" style="font-size:25px;">
         	TITLE
         </p>
         <input type="text" placeholder="Insert Title " class="form-control" name="title"/>

         <hr>

         <!-- Content -->
         <p class="lead" style="font-size:25px;">
         	CONTENT
         </p>
         <textarea placeholder="Insert content " class="form-control-text" rows="10" name="contents"></textarea>

		 <!-- Widget -->
		 <div class="form-group" style="float:right">
		 	<input type="hidden" value="admin" name="userid">
		 	<input type="hidden" value="n" name="code">
			<input type="submit" value="ok" class="btn btn-primary" onclick="return noticeCheck()">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='noticeList.do'">
		</div>
		 </form>
     </div>
 </div>
</div>
</body>
</html>