<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<s:csrfMetaTags/>
<title>Awesomejump - 1:1 문의</title>
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
<link rel="stylesheet" href="/resources/awesomejump/css/custom/members.css">

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
<script defer src="/resources/awesomejump/js/custom/members.js"></script>

<!-- Swiper -->
<link rel="stylesheet" href="/resources/awesomejump/css/swiper.min.css">
<script src="/resources/awesomejump/js/swiper.min.js"></script>

<script type="text/javascript">
	function reply() {
		if(document.replyRegister.content.value == "") {
			alert ('문의 내용을 입력해 주세요.');
		} else if (document.replyRegister.qna_yn.value == "y") {
			if (document.replyRegister.qna_pw.value == "") {
				alert ('비밀번호를 입력해 주세요.');
			} else {
				document.replyRegister.submit();
			} 
		} else {
			document.replyRegister.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
<br><br><br><br><br><br>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">문의 게시판 답글</h1>
	</div>
</div>
<s:authentication property="principal" var="member"/>
<section id="container">
	<form action="/admin/reply" method="post" name="replyRegister">
	<s:csrfInput/>
	
	<input type="hidden" name="qna_no" value="${qDto.qna_no }">
	<input type="hidden" name="qna_ref" value="${qDto.qna_ref }">
	<input type="hidden" name="qna_restep" value="${qDto.qna_restep }">
	<input type="hidden" name="qna_relevel" value="${qDto.qna_relevel }">
	<input type="hidden" name="qna_reply_yn" value="${qDto.qna_reply_yn }">
	
		<div class="form-group">
			<label for="mem_no">작성자번호</label><input class="form-control" type="text" name="mem_no" readonly="readonly" value="${member.mem_no}"/>
		</div>
		<div class="form-group">
			<label for="qna_category">카테고리</label>
			<select id="qnacategory" name="qna_category">
				<option value="문의답변">문의답변</option>
			</select>
		</div>
		<div class="form-group">
			<label for="qna_title">제목</label><input id="title" value="문의답변" class="form-control" name="qna_title" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="qna_content">내용</label><textarea class="form-control" id="content" name="qna_content" ></textarea>
		</div>
		<div class="form-group">
			<label for="qna_name">작성자</label><input type="text" id="writer" name="qna_name" value="${member.mem_nickname}" readonly="readonly"  />
		</div>
		<div class="form-inline">
			<input type="radio" name="qna_yn" id="qna_yn1" value="n" class="radio" /><span>공개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="qna_yn" id="qna_yn2" value="y" class="radio" checked="checked" /><span>비공개</span>
			<input type="password" name="qna_pw" id="qna_pw">
		</div>
		<button type="button" class="btn btn-default" onclick="reply();" >등록</button>	
		<button type="button" class="btn btn-default" onclick="location.href='/admin/qna'">취소</button>
		
		
	</form>
</section>
</body>
</html>