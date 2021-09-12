<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>AwesomeJump - myReview</title>

<link rel="stylesheet" href="/resources/awesomejump/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/animate.css">
<link rel="stylesheet" href="/resources/awesomejump/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/awesomejump/css/slick.css">
<link rel="stylesheet" href="/resources/awesomejump/vendor/rateit/rateit.css">
<!-- style CSS -->
<link rel="stylesheet" href="/resources/awesomejump/css/style.css">
<link rel="stylesheet" href="/resources/awesomejump/css/custom/myReview.css">

<script defer src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script defer src="/resources/awesomejump/js/popper.min.js"></script>
<script defer src="/resources/awesomejump/js/bootstrap.min.js"></script>
<script defer src="/resources/awesomejump/js/jquery.magnific-popup.js"></script>
<script defer src="/resources/awesomejump/js/owl.carousel.min.js"></script>
<script defer src="/resources/awesomejump/js/jquery.counterup.min.js"></script>
<script defer src="/resources/awesomejump/js/jquery.nice-select.min.js"></script>
<script defer src="/resources/awesomejump/js/slick.min.js"></script>
<script defer src="/resources/awesomejump/js/jquery.ajaxchimp.min.js"></script>
<script defer src="/resources/awesomejump/vendor/rateit/jquery.rateit.min.js"></script>
<!-- custom js -->
<script defer src="/resources/awesomejump/js/custom.js"></script>

<!-- Swiper -->
<link rel="stylesheet" href="/resources/awesomejump/css/swiper.min.css">
<script src="/resources/awesomejump/js/swiper.min.js"></script>
</head>

<body>
  <!-- Header -->
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp" />
  <!-- 회원 정보 페이지 메뉴바(MembersNavbar) -->
  <jsp:include page="/WEB-INF/templates/awesomejump/membersNavbar.jsp" />

  <section class="myReviewList">
    <div class="container">
      <div class="divTable offset-xl-2 col-xl-8 mt-5">
        <div class="divTableHead">
          <div class="divTableRow">
            <div class="divTableCell"><h4>상품 사진</h4></div> 
            <div class="divTableCell"><h4>상품 이름</h4></div>
            <div class="divTableCell"><h4>후기 내용</h4></div>
            <div class="divTableCell"><h4>후기 별점</h4></div>
            <div class="divTableCell"><h4>작성일</h4></div>
          </div>
        </div>
        <div class="divTableBody">
          <c:forEach var="myReview" items="${myReviewList}">
            <div class="divTableRow">
              <div class="divTableCell">
                <img class="rounded m-2" src="/upload${myReview.productImagePath}" width="100px" height="100px">
              </div>
              <div class="divTableCell">${myReview.product_name}</div>
              <div class="divTableCell">${myReview.review_content}</div>
              <div class="divTableCell">
                <span class="rateit" data-rateit-value="${myReview.review_grade}" data-rateit-ispreset="true" data-rateit-readonly="true"></span>
              </div>
              <div class="divTableCell"><fmt:formatDate value="${myReview.review_date}" pattern="yy-MM-dd"/></div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp" />

</body>
</html>