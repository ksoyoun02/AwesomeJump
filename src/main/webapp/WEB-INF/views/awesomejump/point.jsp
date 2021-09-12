<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <s:csrfMetaTags/>
  <title>AwesomeJump - feature</title>
  
  <link rel="icon" href="/resources/awesomejump/img/favicon.png">
  <link rel="stylesheet" href="/resources/awesomejump/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/animate.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/all.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/flaticon.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/themify-icons.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/magnific-popup.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/slick.css">
  <!-- style CSS -->
  <link rel="stylesheet" href="/resources/awesomejump/css/style.css">

  <script defer src="/resources/awesomejump/js/jquery-1.12.1.min.js"></script>
  <script defer src="/resources/awesomejump/js/popper.min.js"></script>
  <script defer src="/resources/awesomejump/js/bootstrap.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.magnific-popup.js"></script>
  <script defer src="/resources/awesomejump/js/masonry.pkgd.js"></script>
  <script defer src="/resources/awesomejump/js/owl.carousel.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.nice-select.min.js"></script>
  <script defer src="/resources/awesomejump/js/slick.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.counterup.min.js"></script>
  <script defer src="/resources/awesomejump/js/waypoints.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.ajaxchimp.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.form.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.validate.min.js"></script>
  <script defer src="/resources/awesomejump/js/mail-script.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>

  <!-- Swiper -->
  <link rel="stylesheet" href="/resources/awesomejump/css/swiper.min.css">
  <script src="/resources/awesomejump/js/swiper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
<script type="text/javascript">
$(document).ready(function(){
	var startNum = $("#listBody tr").length;
	
	if(startNum == 0 || startNum < 10){
		$("#addBtn").remove();
		$("#hrBtn").remove();
	}
});


</script>
<script type="text/javascript">
function moreList() {
	 var startNum = $("#listBody tr").length;
	    var addListHtml = "";  
	    console.log("startNum", startNum);
	    
	    $.ajax({
	    	url: "/point",
	    	type: "POST",
	    	dataType: "json",
	    	beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader,CSRFtoken), 
	    	data:{"startNum":startNum},
	    	
	    	success:function(result){
	    		console.log(result);
	    		
	    		if(result.length<10){
	    			$("#addBtn").remove();
	    			$("#hrBtn").remove();
	    		}
    			var addListHtml= "";
    			
    			if(result.length>0){
    				for(var i = 0; i <result.length; i++){
    					
    					var idx = Number(startNum)+Number(i)+1;	
    					var point_au = result[i].point_au;
    					var timestamp = result[i].point_date;
    					var date = new Date(timestamp);
    					
    					let year = date.getFullYear();
    					let month = date.getMonth() + 1;
    					month = month >= 10 ? month : '0' + month;
    					let day = date.getDate();
    					  day = day >= 10 ? day : '0' + day;
    					  let hour = date.getHours();
    					  hour = hour >= 10 ? hour : '0' + hour;
    					  let min = date.getMinutes();
    					  min = min >= 10 ? min : '0' + min;
    					  
    					  let purchaseDay = year + '-' + month + '-' + day + ' ' + hour + ':' + min;
    					  
    					if(point_au == 'A'){
    						var AU = "적립";
    						var PM = "+";
    						var css = "style='color: blue;'"
    					}else{
    						var AU = "사용";
    						var PM = "-";
    						var css = "style='color: red;'"
    					}
                       addListHtml =
                    	  `
                    	  <tr>
                      		<th>\${idx}</td>
                      		<td>\${result[i].order_info_name}</td>
		      		      	<td>
		      		      		\${AU}
		      		     	</td>
	           		      	<td>\${result[i].order_info_price}원</td>
	       				  	<td \${css}>\${PM}\${result[i].point_amount}p</td>
                      		<td>\${purchaseDay}</td>
                      	  </tr>
                    	  `;
    				
    				 $("#listBody").append(addListHtml); 
    				}
    				
	    		}
	    		
	    	}
	    });
}
</script>
<style type="text/css">
.mid {
		margin-top: 60px;
	}
	
	h1{
		font-family: "NANUM";
		font-weight: bold;
		font-size: 50px;
	}
	
	h3{
		font-family: "NANUM";
		font-weight: bold;
	
	}
</style>
</head>
<body>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/membersNavbar.jsp"/>
  
<div class="container">
	<div class="mid">
	<div style="margin-bottom: 30px;">
		<div style="float: left;">
			<h1>포인트</h1>
		</div>
		<div style="text-align: end;">
			<h3>보유포인트</h3>
			<h3>${mem_point}p</h3>
		</div>
	</div>
	
	<div class="tableList">
		<table class="table table-hover" id="addList">
	 		<thead>
		    <tr>
		      <th scope="col" style="width: 10%;">NO</th>
		      <th scope="col" style="width: 25%;">구매상품</th>
		      <th scope="col" style="width: 15%;">구분</th>
		      <th scope="col" style="width: 15%;">이용금액</th>
		      <th scope="col" style="width: 15%;">포인트</th>
		      <th scope="col" style="width: 20%;">거래일자</th>
		    </tr>
		  </thead>
		  <tbody id="listBody">
		  <c:if test=""></c:if>
		  <c:forEach items="${pointList}" var="pointList" varStatus="status" begin="0" end="9">
		    <tr>
		      <th scope="row">${status.count }</th>
		      <td>${pointList.order_info_name }</td>
		      <c:choose>
			      <c:when test="${pointList.point_au  == 'A'}">
				  	<td>적립</td>
			      </c:when>
			      <c:otherwise>
			      	<td>사용</td>
			      </c:otherwise>
		      </c:choose>
		      <td>${pointList.order_info_price }원</td>
		      <c:choose>
			      <c:when test="${pointList.point_au  == 'A'}">
				  	<td style="color: blue;">+${pointList.point_amount}p</td>
			      </c:when>
			      <c:otherwise>
			      	<td style="color : red;">-${pointList.point_amount}p</td>
			      </c:otherwise>
		      </c:choose>
		      <td><fmt:formatDate value="${pointList.point_date}" pattern="yyyy-MM-dd HH:ss"/></td>
		    </tr>
		  </c:forEach>
		  </tbody>
		</table>
		<div align="center">
			<hr id="hrBtn">
			   <a id="addBtn" href="javascript:moreList();" style="font-family: 'NANUM'; font-weight: bold; font-size: 20px;">
			   		더보기
			   </a>
			<hr id="hrBtn">   
		</div>
	</div>
	</div>
</div>
  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>