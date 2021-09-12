<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Awesomejump - 리뷰 쓰기</title>

<link rel="icon" href="/resources/awesomejump/img/favicon.png">
<link rel="stylesheet" href="/resources/awesomejump/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/animate.css">
<link rel="stylesheet" href="/resources/awesomejump/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/all.css">
<link rel="stylesheet" href="/resources/awesomejump/css/flaticon.css">
<link rel="stylesheet" href="/resources/awesomejump/css/themify-icons.css">
<link rel="stylesheet" href="/resources/awesomejump/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/awesomejump/css/slick.css">
<link rel="stylesheet" href="/resources/awesomejump/css/style.css">
  
  <script defer src="/resources/awesomejump/js/jquery-1.12.1.min.js"></script>
  <script defer src="/resources/awesomejump/js/popper.min.js"></script>
  <script defer src="/resources/awesomejump/js/bootstrap.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.magnific-popup.js"></script>
  <script defer src="/resources/awesomejump/js/swiper.min.js"></script>
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
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  
  <script type="text/javascript">
  function register() {
		if(document.reviewRegister.grade.value == "") {
			alert ('별점을 입력해 주세요.');
		} else if (document.reviewRegister.content.value == "") {
			alert ('리뷰 내용을 입력해 주세요.');
		} else {
			document.reviewRegister.submit();
		}
	}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
<br><br><br><br><br>
<h4>리뷰 쓰기</h4>
<s:authentication property="principal" var="member"/>
<section id="container">
	<form id="review" action="/awesomejump/reviewRegister" method="post" name="reviewRegister">
		<div class="form-group">
			<label for="mem_no">작성자번호</label><input readonly="readonly" class="form-control" type="text" name="mem_no"  value="${member.mem_no}" />
		</div>
		<div class="form-group">
			<label for="product_no">상품번호</label><input class="form-control" type="text" name="product_no" />
		</div>
		<div class="form-group">
			<label for="review_grade">별점</label><input class="form-control" type="text" id="grade" name="review_grade" />
		</div>
		<div class="form-group">
			<label for="review_content">내용</label><textarea class="form-control" id="content" name="review_content" ></textarea>
		</div>
		<div class="form-group">
			<label for="review_name">작성자</label><input type="text" id="writer" name="review_name" value="${member.mem_nickname}" readonly="readonly" />
		</div>
		
		<button type="button" onclick="register();" class="btn btn-default">등록</button>	
		<button type="button" class="btn btn-default" onclick="location.href='/awesomejump/memDetailProduct'">취소</button>
		
		<s:csrfInput/>
	</form>
</section>
</body>
</html>