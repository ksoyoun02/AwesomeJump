<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
<br><br><br><br><br><br>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">문의 답글</h1>
	</div>
</div>
<br><br><br><br><br><br>
<form action="/awesomejump/qna/list" id="actionForm" method="get">
	<input type="hidden" name="qna_no" value="${qDto.qna_no }">
	<input type="hidden" name="qna_ref" value="${qDto.qna_ref }">
	<input type="hidden" name="qna_restep" value="${qDto.qna_restep }">
	<input type="hidden" name="qna_relevel" value="${qDto.qna_relevel }">
	<input type="hidden" name="qna_reply_yn" value="${qDto.qna_reply_yn }">
<div class="row">
		<div class="form-group">
			<label>글번호</label><input class="form-control" name="qna_no" 
			value='<c:out value="${qDto.qna_no}"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>카테고리</label><input class="form-control" name="qna_category" value='<c:out value="${qDto.qna_category}"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>제목</label><input class="form-control" name="qna_title" value='<c:out value="${qDto.qna_title}"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>내용</label><textarea class="form-control" rows="3" name="qna_content" readonly="readonly">
			<c:out value="${qDto.qna_content}" />
			</textarea>
		</div>
		<div class="form-group">
			<label>작성자</label><input class="form-control" name="qna_name" value='<c:out value="${qDto.qna_name}" />' readonly="readonly">
		</div>
			<button type="button" data-oper='modify' class="btn btn-default" onclick="location.href='/awesomejump/qna/modify?qna_no=<c:out value="${qDto.qna_no}" />'">수정</button>
			<button data-oper='list' class="btn btn-default" onclick="location.href='/awesomejump/qna/list'">목록</button>
</div>
</form>
</body>
</html>