<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<s:csrfMetaTags/>
<title>Awesomejump - 1:1 문의</title>
<link rel="icon" href="/resources/awesomejump/img/favicon.png">
<link rel="stylesheet" href="/resources/awesomejump/css/nice-select.css">
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
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>

<br><br><br><br><br><br>
<div class="container">
<div>
	<div class="col-lg-12" style="text-align: center;">
		<h4 class="page-header">문의 게시판</h4>
	</div>
</div>

<form action="/awesomejump/qna/list" id="actionForm" method="get">

<input type="hidden" name="mem_no" value="${qDto.mem_no }">
<div class="row" style="display: flex; justify-content: left;">
		<div class="form-group" hidden="hidden">
			<label>글번호</label><input class="form-control" name="qna_no" 
			value='<c:out value="${qDto.qna_no}"/>' readonly="readonly">
		</div>
		<div style="float: left;">
			<div class="form-inline form-group" >
				<label style="color: #878787; font-weight: 500;">카테고리</label>
				<input style="color: #000; text-align:left; background-color: #fff; border-color: #fff;" class="form-control" name="qna_category" value='<c:out value="${qDto.qna_category}"/>' readonly="readonly">
			</div>
			<div>
				<div class="form-inline form-group">
					<label style="color: #878787; font-weight: 500;">제목</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input style="color: #000; text-align:left; background-color: #fff; border-color: #fff;" class="form-control" name="qna_title" value='<c:out value="${qDto.qna_title}"/>' readonly="readonly">
				</div>
				<div class="form-inline form-group">
					<label style="color: #878787; font-weight: 500;">작성자</label>&nbsp;&nbsp;&nbsp;
					<input style="color: #000; text-align:left; background-color: #fff; border-color: #fff;" class="form-control" name="qna_name" value='<c:out value="${qDto.qna_name}" />' readonly="readonly">
				</div>
			</div>
			<div class="form-inline form-group">
				<label style="color: #878787; font-weight: 500;">내용</label>
				<textarea style="width:500px; height:100px; resize:none; color: #000; text-align:left; background-color: #fff; border-color: #fff;" class="form-control" rows="3" name="qna_content" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${qDto.qna_content}" /></textarea>
			</div>
		</div>
</div>
	<div style="display: flex;">
		<s:authorize access="hasRole('ROLE_ADMIN')">
		<c:if test="${qDto.qna_relevel == 0 && qDto.qna_reply_yn eq 'n'}">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/reply?qna_no=${qDto.qna_no}'">답글</button>
		</c:if>
		</s:authorize>
		
		<s:authentication property="principal" var="member" />
			<s:authorize access="isAuthenticated()">
				<c:if test="${member.mem_no eq qDto.mem_no}">
					<button type="button" data-oper='modify' class="btn btn-outline-secondary" onclick="location.href='/awesomejump/qna/modify?qna_no=<c:out value="${qDto.qna_no}" />'">수정</button>
				</c:if>
			</s:authorize>
			<button data-oper='list' class="btn btn-outline-secondary" onclick="location.href='/awesomejump/qna/list'">목록</button>
	</div>
</form>
	</div>
<jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp" />
</body>
</html>