<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<s:csrfMetaTags />

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
<link rel="stylesheet" href="/resources/awesomejump/css/custom/address.css">

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
<script defer src="/resources/awesomejump/js/custom/address.js"></script>
<!-- Daum Postcode -->
<script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Swiper -->
<link rel="stylesheet" href="/resources/awesomejump/css/swiper.min.css">
<script src="/resources/awesomejump/js/swiper.min.js"></script>
</head>

<body class="address">

  <!-- Header -->
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp" />
  <!-- 회원 정보 페이지 메뉴바(MembersNavbar) -->
  <jsp:include page="/WEB-INF/templates/awesomejump/membersNavbar.jsp" />

  <section class="address-list">
    <div class="container">
      <div class="row">
      </div>
      <div class="d-flex justify-content-center flex-wrap address-card mt-3">
        <c:forEach var="address" items="${addressList}">
          <div class="card m-2" style="width: 320px !important">
            <div class="card-header">
              <strong>${address.address_nickname}</strong>
            </div>
            <div class="card-body">
              <div class="mb-2"><strong>주문자명 : </strong>${address.address_receiver_name}</div>
              <div class="mb-2"><strong>주소 : </strong>${address.address_detail}</div>
              <div class="mb-2"><strong>연락처 : </strong>${address.address_receiver_phone}</div>
              <a href="#" class="btn btn-danger float-right ml-2" id="addressDeleteBtn">삭제</a> 
              <a href="#" class="btn btn-primary float-right" id="addressModifyBtn" 
               data-address-no="${address.address_no}" 
               data-address-nickname="${address.address_nickname}"
               data-address-detail="${address.address_detail}"
               data-address-postcode="${address.address_postcode}"
               data-address-receiver-name="${address.address_receiver_name}"
               data-address-receiver-phone="${address.address_receiver_phone}">수정</a>
            </div>
          </div>
        </c:forEach>
        <div class="card m-2" style="width: 320px !important">
          <div class="m-auto p-5">
            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addressPlusModal">새로운 배송지 추가..</a> 
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp" />

  <!-- 주소 추가 모달 -->
  <div class="modal fade p-0" id="addressPlusModal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog"
    aria-labelledby="#addressPlusModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <form action="address/newAddress" method="POST" id="newAddressForm">
          <s:csrfInput/>
          <div class="modal-header">
            <h5 class="modal-title" id="addressPlusModalLabel">배송지 등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <div class="form-group row">
                <label for="address_nickname" class="offset-lg-2 col-lg-2 col-form-label">배송지명</label>
                <div class="col-lg-6">
                  <input type="text" class="form-control" id="newAddress_nickname" name="address_nickname">
                </div>
              </div>
              <div class="form-group row">
                <label for="address_receiver_name" class="offset-lg-2 col-lg-2 col-form-label">주문자명</label>
                <div class="col-lg-6">
                  <input type="text" class="form-control" id="newAddress_receiver_name" name="address_receiver_name">
                </div>
              </div>
              <div class="form-group row">
                <label for="address_receiver_phone" class="offset-lg-2 col-lg-2 col-form-label">연락처</label>
                <div class="col-lg-6">
                  <input type="text" class="form-control" id="newAddress_receiver_phone" name="address_receiver_phone">
                  <p id="va-newAddress_receiver_phone" class="form-text text-danger"></p>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-4 col-sm-6 offset-lg-2">
                  <input class="form-control" type="text" id="newAddress_postcode" placeholder="우편번호" name="address_postcode" readonly>
                </div>
                <div class="col-lg-4 col-sm-6">
                  <input class="btn btn-primary w-100" type="button" onclick="newAddress_execDaumPostcode()" id="newAddress_postcodeBtn" value="우편번호 찾기"><br>
                </div>
                <div class="col-lg-8 col-12 offset-lg-2 mt-4">
                  <input class="form-control" type="text" id="newAddress_address" placeholder="주소" name="addressList" readonly><br>
                </div>
                <div class="col-lg-4 col-sm-6 offset-lg-2">
                  <input class="form-control" type="text" id="newAddress_detailAddress" name="addressList" placeholder="상세주소">
                </div>
                <div class="col-lg-4 col-sm-6">
                  <input class="form-control" type="text" id="newAddress_extraAddress" name="addressList" placeholder="참고항목">
                </div>
              </div>
              <div class="col-lg-8 offset-lg-2">
                <p id="va-newAddress" class="form-text text-danger"></p>
              </div>
            </div>
            <div class="col-lg-8 offset-lg-2 postcode-wrapper">
              <div id="newAddress_wrap" style="display: none; border: 1px solid; height: 300px; margin: 5px 0; position: relative">
                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="newAddressbtnFoldWrap"
                  style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" alt="접기 버튼">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="newAddressBtn">저장</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</body>
</html>