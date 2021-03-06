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

<style type="text/css">

	.mid {
		margin-top: 60px;
	}
	#nav-home-tab, #nav-profile-tab{
		width: 50%
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
	
	h4{
		margin-top: 50px;
		font-family: "NANUM";
		
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
				<h1>??????</h1>
			</div>
			<div style="text-align: end;">
				<h3>?????? ?????? ?????? ??????</h3>
				<h3>${total}???</h3>
			</div>
		</div>
	
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="text-align: center;">????????????</a>
		    <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" style="text-align: center;">????????????</a>
		  </div>
		</nav>
		
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		  	<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" style="width: 15%;">NO</th>
			      <th scope="col" style="width: 30%;">?????????</th>
			      <th scope="col" style="width: 20%;">????????????</th>
			      <th scope="col" style="width: 20%;">????????????</th>
			      <th scope="col" style="width: 25%;">????????????</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${p_couponList}" var="p_couponList" varStatus="status">
		  		<tr>
			      <th scope="row">${status.count}</th>
			      <td>${p_couponList.coupon_name}</td>
			      <td>${p_couponList.coupon_discount}???</td>
			      <td><fmt:formatDate value="${p_couponList.coupon_member_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			      <td><fmt:formatDate value="${p_couponList.coupon_member_expirydate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    	</tr>
			    </c:forEach>
			  </tbody>
			</table>
		  
		  </div>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
		  <table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" style="width: 15%;">NO</th>
			      <th scope="col" style="width: 25%;">?????????</th>
			      <th scope="col" style="width: 25%;">????????????</th>
			      <th scope="col" style="width: 20%;">????????????</th>
			      <th scope="col" style="width: 15%;">????????????</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${imp_couponList}" var="imp_couponList" varStatus="status">
			    <tr>
			      <th scope="row">${status.count}</th>
			      <td>${imp_couponList.coupon_name}</td>
			      <td>${imp_couponList.order_info_name}</td>
			      <td>${imp_couponList.coupon_discount}</td>
			      <td>????????????</td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			    <h4 style="text-align: center;">---&nbsp;&nbsp;??????????????? ??????????????? 30??? ?????? ???????????????&nbsp;&nbsp;---</h4>
		  </div>
		</div>
	</div>
</div>
  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>