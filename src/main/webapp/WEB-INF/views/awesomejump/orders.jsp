<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<s:csrfMetaTags/>

<title>AwesomeJump - orders</title>

<link rel="stylesheet" href="/resources/awesomejump/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/animate.css">
<link rel="stylesheet" href="/resources/awesomejump/css/all.css">
<link rel="stylesheet" href="/resources/awesomejump/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/awesomejump/css/slick.css">
<link rel="stylesheet" href="/resources/awesomejump/vendor/rateit/rateit.css">
<!-- style CSS -->
<link rel="stylesheet" href="/resources/awesomejump/css/style.css">
<link rel="stylesheet" href="/resources/awesomejump/css/custom/orders.css">

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
<script defer src="/resources/awesomejump/js/custom/orders.js"></script>

<style type="text/css">
p {
font-size: 20px;
}
</style>
<!-- Swiper -->
<link rel="stylesheet" href="/resources/awesomejump/css/swiper.min.css">
<script src="/resources/awesomejump/js/swiper.min.js"></script>
</head>

<body class="orders">

  <!-- Header -->
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp" />
  <!-- 회원 정보 페이지 메뉴바(MembersNavbar) -->
  <jsp:include page="/WEB-INF/templates/awesomejump/membersNavbar.jsp" />
  
  <section class="orderInfo">
    <div class="container-fluid">
      <div class="offset-xl-2 col-xl-8">
        <div class="accordion mt-5" id="orderInfoaccordion">
          <c:if test="${reviewWriteResult}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              <strong>상품 후기를 등록하였습니다. &nbsp;&nbsp;</strong><a href="#"><u>확인</u></a>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </c:if>
          <c:forEach var="orderInfo" items="${orderInfoList}" varStatus="status">
            <div class="card">
              <div class="card-header d-none d-md-block" id="headingOne">
                <div class="d-flex p-3 orderInfo align-items-center" 
                     data-toggle="collapse" data-target="#collapse${status.index}" 
                     aria-expanded="true" aria-controls="collapse${status.index}">
                    <div class="mr-3">
                      <i class="far fa-file fa-2x orderDetailBtn"
                         data-order-info-uid="${orderInfo.order_info_uid}"
                         data-order-info-name="${orderInfo.order_info_name}"
                         data-order-info-date='<fmt:formatDate value="${orderInfo.order_info_date}" pattern="yy-MM-dd"/>'
                         data-order-info-price='<fmt:formatNumber value="${orderInfo.order_info_price}" type="currency"/>'
                         data-order-info-approval="${orderInfo.order_info_approval}"
                         data-order-info-receive-name="${orderInfo.order_info_receive_name}"
                         data-order-info-phone="${orderInfo.order_info_phone}"
                         data-order-info-postcode="${orderInfo.order_info_postcode}"
                         data-order-info-address="${orderInfo.order_info_address}"
                         data-order-info-request="${orderInfo.order_info_request}">
                        <span class="tooltip-text">상세 정보</span>
                      </i>
                    </div>
                    <div class="mr-5"><fmt:formatDate value="${orderInfo.order_info_date}" pattern="yy-MM-dd"/></div>
                    <div class="ml-5">${orderInfo.order_info_name}</div>
                    <div class="ml-auto"><fmt:formatNumber value="${orderInfo.order_info_price}" type="currency"/></div>
                </div>
              </div>
              <div class="d-block d-md-none p-1 lead">
                <fmt:formatDate value="${orderInfo.order_info_date}" pattern="yy-MM-dd"/>
                <i class="far fa-file fa-lg p-1 float-right mobileOrderDetailBtn"></i>
              </div>
              <div class="border-bottom d-none d-md-block" style="position: relative; top: 2px;"></div>
              <div id="collapse${status.index}" class="collapse" aria-labelledby="headingOne" data-parent="#orderInfoaccordion">
                <c:forEach var="orderDetail" items="${orderInfo.orderDetailList}">
                  <div class="d-flex p-3 orderDetailInfo">
                    <div class="detailDiv1">
                      <c:if test="${orderDetail.imagePath != ''}">
                        <img class="rounded" src="/upload${orderDetail.imagePath}">
                      </c:if>
                    </div>
                    <div class="detailDiv2">
                      ${orderDetail.product_name}<br>
                      [${orderDetail.product_option_color} / ${orderDetail.product_option_size}]
                    </div>
                    <div class="detailDiv3">${orderDetail.order_detail_quantity}개</div>
                    <div class="detailDiv4"><fmt:formatNumber value="${orderDetail.product_price}" type="currency"/></div>
                    <div class="detailDiv5">${orderDetail.order_detail_shipping}</div>
                    <div class="detailDiv6">
                      <c:choose>
                        <c:when test="${orderDetail.order_detail_review_yn eq 'y'}">
                          <button class="btn writeReviewBtn border"
                              data-order-detail-review-yn="${orderDetail.order_detail_review_yn}">후기 완료</button>
                        </c:when>
                        <c:otherwise>
                          <button class="btn writeReviewBtn border" 
                              data-product-no="${orderDetail.product_no}"
                              data-order-detail-no="${orderDetail.order_detail_no}" 
                              data-product-name="${orderDetail.product_name}" 
                              data-product-option-color="${orderDetail.product_option_color}" 
                              data-product-option-size="${orderDetail.product_option_size}" 
                              data-toggle="tooltip" data-placement="top" title="배송이 완료되면 리뷰를 작성하실 수 있어요">
                            후기 작성
                          </button>
                        </c:otherwise> 
                      </c:choose>
                    </div>
                  </div>
                </c:forEach>
              </div>
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