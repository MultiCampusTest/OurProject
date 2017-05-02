  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/travelList.css">

</head>
<body>

<div class="content container" style="padding-top:90px">
<p style="line-height:200%">
<font style="font-size:12pt">D A Y S</font>
<a href="#"><span class="category active">5Days</span></a>
<a href="#"><span class="category">10Days</span></a>
<a href="#"><span class="category">15Days</span></a>
<a href="#"><span class="category">YaHo</span></a>
<a href="#"><span class="category">YaHoHo</span></a>
</p>

<p style="line-height:100%">
<font style="font-size:12pt">LOCAITON</font>
<a href="#"><span class="category active">Seoul</span></a>
<a href="#"><span class="category">Gangwon</span></a>
<a href="#"><span class="category">Incheon</span></a>
<a href="#"><span class="category">Gyeonggi</span></a>
<a href="#"><span class="category">Sejong</span></a>
<a href="#"><span class="category">Chungbuk</span></a>
<a href="#"><span class="category">Chungnam</span></a>
<a href="#"><span class="category">Daejeon</span></a>
</p>

<p style="line-height:100%">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#"><span class="category">Jeonbuk</span></a>
<a href="#"><span class="category">Jeonnam</span></a>
<a href="#"><span class="category">Gwangju</span></a>
<a href="#"><span class="category">Kyeongnam</span></a>
<a href="#"><span class="category">Kyeongbuk</span></a>
<a href="#"><span class="category">Daegu</span></a>
<a href="#"><span class="category">Busan</span></a>
<a href="#"><span class="category">Ulsan</span></a>
<a href="#"><span class="category">Jeju</span></a>
</p>


</div>

<hr/>

<div class="container">
<p><strong>총 Sibal개의 여행계획이 검색되었습니다.</strong></p>
   	<div class="row">
                       <div class="col-sm-2 col-lg-2 col-md-2">
                        <div class="thumbnail">
                            <img src="http://placehold.it/300x400" alt="">
                            <div class="caption">
                                <font style="font-size:12pt">USER_ID</font><br>
                                <font style="font-size:12pt">DATE</font><br>
                                <font style="font-size:12pt">REVIEWS</font>
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <div class="thumbnail">
                            <img src="http://placehold.it/300x400" alt="">
                            <div class="caption">
                               <font style="font-size:12pt">USER_ID</font><br>
                                <font style="font-size:12pt">DATE</font><br>
                                <font style="font-size:12pt">REVIEWS</font>
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <div class="thumbnail">
                            <img src="http://placehold.it/300x400" alt="">
                            <div class="caption">
                               <font style="font-size:12pt">USER_ID</font><br>
                                <font style="font-size:12pt">DATE</font><br>
                                <font style="font-size:12pt">REVIEWS</font>
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <div class="thumbnail">
                            <img src="http://placehold.it/300x400" alt="">
                            <div class="caption">
                              <font style="font-size:12pt">USER_ID</font><br>
                                <font style="font-size:12pt">DATE</font><br>
                                <font style="font-size:12pt">REVIEWS</font>
                            </div>
                          
                        </div>
                    </div>
                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <div class="thumbnail">
                            <img src="http://placehold.it/300x400" alt="">
                            <div class="caption">
                               <font style="font-size:12pt">USER_ID</font><br>
                                <font style="font-size:12pt">DATE</font><br>
                                <font style="font-size:12pt">REVIEWS</font>
                            </div>
                          
                        </div>
                    </div>
                    
<!--                     <div class="col-sm-2 col-lg-2 col-md-2"> -->
<!--                         <div class="thumbnail"> -->
<!--                         <a href="#" title="자세히보기"> -->
<!--                             <img src="http://placehold.it/300x400" alt=""> -->
<!--                          </a> -->
<!--                             <div class="caption"> -->
<!--                                 <font style="font-size:12pt">USER_ID</font><br> -->
<!--                                 <font style="font-size:12pt">DATE</font><br> -->
<!--                                 <font style="font-size:12pt">REVIEWS</font> -->
<!--                             </div> -->
                          
<!--                         </div> -->
<!--                     </div> -->
				</div>
				</div>
				
		<hr/>
		
	<div class="jb-center">
			<ul class="pagination">
				<li><a href="#"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				<c:forEach begin="1" end="10" step="1" varStatus="i">
					<li class="paging ${i.index eq pageNum ? 'active' : '' }"><a
						href="#">${i.index}</a></li>
				</c:forEach>
				<li><a href="#"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
			</ul>
		</div>  

          
                
    
</body>
</html>