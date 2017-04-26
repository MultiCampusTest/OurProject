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
</head>
<body>
 <div class="container">

 <div class="row">

     <!-- Notice Input Column -->
     <div class="col-lg-12">
     	 <p class="lead" style="font-size: 50px">
     	 	NOTICE
     	 </p>
	
		 <hr>
		 <form class="form" action="#">
         <!-- Title -->
         <p class="lead">
         	TITLE:
         </p>
         <input type="text" placeholder="Insert Title " class="form-control" name="subject"/>

         <hr>

         <!-- Content -->
         <p class="lead">
         	CONTENT:
         </p>
         <textarea placeholder="Insert content " class="form-control-text" rows="10"></textarea>

		 <!-- Widget -->
		 <div class="form-group">
			<input type="submit" value="ok" class="btn btn-primary">
			<input type="button" value="list" class="btn btn-primary" onclick="location.href='noticeList.do'">
		</div>
		 </form>
     </div>
 </div>


</div>
</body>
</html>