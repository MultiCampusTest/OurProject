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

<script type="text/javascript">
$(document).ready(function(){
	
	var locCategory = "${locCategory}";
	var subCategory = "${subCategory}";
	
	$('.category').each(function(){
		if(locCategory == $(this).attr('id') || subCategory == $(this).attr('id')){
			$(this).attr('class', 'category active');
		}
	})
	
})
</script>
</head>
<body> 
<div class="container">
      <div class="col-md-12">
         <div class="row">
               <img class="notice_slide" src="img/guide/guide_img.jpg" alt="">
         </div>

      </div>
   </div>
   <br>

<div class="content container" style="padding-top:90px">
<p style="line-height:200%">
<font style="font-size:12pt"><strong>D A Y S</strong></font>
<a href="guideList.do?subCategory=one"><span class="category" id="one">1 Day</span></a>
<a href="guideList.do?subCategory=two"><span class="category" id="two">2 Days</span></a>
<a href="guideList.do?subCategory=three"><span class="category" id="three">3 Days</span></a>
<a href="guideList.do?subCategory=four"><span class="category" id="four">4 Days</span></a>
<a href="guideList.do?subCategory=g_more"><span class="category" id="g_more">5 Days+</span></a>
</p>

<p style="line-height:100%">
<font style="font-size:12pt"><strong>LOCAITON</strong></font>
<a href="guideList.do?locCategory=seoul"><span class="category" id="seoul">SEOUL</span></a>
<a href="guideList.do?locCategory=incheon"><span class="category" id="gyeonggi">INCHEON</span></a>
<a href="guideList.do?locCategory=daejeon"><span class="category" id="daejeon">DAEJEON</span></a>
<a href="guideList.do?locCategory=gwangju"><span class="category" id="gwangju">GWANGJU</span></a>
<a href="guideList.do?locCategory=daegu"><span class="category" id="daegu">DAEGU</span></a>
<a href="guideList.do?locCategory=busan"><span class="category" id="busan">BUSAN</span></a>
<a href="guideList.do?locCategory=jeju"><span class="category" id="jeju">JEJU-DO</span></a>
<a href="guideList.do?locCategory=gangwon"><span class="category" id="gangwon">GANGWON-DO</span></a>
<a href="guideList.do?locCategory=gyeonggi"><span class="category" id="gyeonggi">GYEONGGI-DO</span></a>
<a href="guideList.do?locCategory=chungcheong"><span class="category" id="chungcheong">CHUNGCHEONG-DO</span></a>
<a href="guideList.do?locCategory=jeolla"><span class="category" id="jeolla">JEOLLA-DO</span></a>
<a href="guideList.do?locCategory=gyeongsang"><span class="category" id="gyeongsang">GYEONGSANG-DO</span></a>
</p>
</div>

<hr/>

<div class="container">
<p>A Total of ${count} Travel Plans Have Been Searched</p>
   	<div class="row">
         
	 	<c:forEach items="${list}" var="guide">
			<div class="col-sm-2 col-lg-2 col-md-2">
               <div class="thumbnail">
                <a href="guideView.do?boardIdx=${guide.boardIdx }
                			&page=${current}&locCategory=${locCategory}&subCategory=${subCategory}">
                  <img src="http://maps.googleapis.com/maps/api/staticmap?size=300x400
                        	&key=AIzaSyBX21maM7ZEhRTCF0_hB8DSrYHsKOof2m8
							&path=color:0x333333ff|weight:2|${guide.strLatLng}
							&markers=color:red|label:S|${guide.startLatLng}
							&markers=color:red|label:E|${guide.endLatLng}&sensor=false">
               </a>
                         <div class="caption">                
                           <i class="fa fa-calendar" aria-hidden="true"></i> ${guide.startDate } ~<br>
                             <font style="font-size:12pt"></font><br>
                         </div>
                     </div>
                 </div>
		</c:forEach>
	</div>
	
	<c:if test="${userid!=null }">
		<div style="text-align: right">
		         <input type="button" class="btn btn-primary" value="Write"
		            onclick="location.href='guideWriteForm.do'">
	     	 </div>
	</c:if>
	
</div>
				
		<hr/>
		
	<div class="jb-center">
			<ul class="pagination">
				<li>
				 <c:choose>
				 	<c:when test="${current != 1 }">
				 		<a href="guideList.do?page=${current-1}
				 				&locCategory=${locCategory}&subCategory=${subCategory}">
				 		<span class="glyphicon glyphicon-chevron-left"></span>
				 		</a>
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
								<li class="paging"><a href="guideList.do?page=${i}
									&locCategory=${locCategory}&subCategory=${subCategory}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
				<li>
					<c:choose>
						<c:when test="${current != last }">
						<a href="guideList.do?page=${current+1}
								&locCategory=${locCategory}&subCategory=${subCategory}">
						<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
						</c:when>
						<c:otherwise>
							<a><span
							class="glyphicon glyphicon-chevron-right"></span></a>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
			
		</div> 
		
		
		

          
                
    
</body>
</html>