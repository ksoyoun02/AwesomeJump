<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Awesomejump - 1:1 문의 수정</title>
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
  
  <script src="https://kit.fontawesome.com/41471e1ffa.js" crossorigin="anonymous"></script>
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
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  
    
<script type="text/javascript">
	$(document).ready(function() {
		
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/awesomejump/qna/remove");
			} else if (operation === 'list') {
				formObj.attr("action", "/awesomejump/qna/list").attr("method", "get");
				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			
			formObj.submit();
		});
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
<br><br><br><br><br><br>
<form action="/awesomejump/qna/modify" method="post" id="qna">

<!--  <input type="hidden" id="qna_no" name="qna_no" value="<c:out value="${qDto.qna_no}" />">
		<input type="hidden" name="pageNum" value='<c:out value="${page.pageNum }"></c:out>'>
		<input type="hidden" name="amount" value='<c:out value="${page.amount }"></c:out>'>
		<input type="hidden" name="keyword" value='<c:out value="${page.keyword }"></c:out>'>
		<input type="hidden" name="type" value='<c:out value="${page.type }"></c:out>'> -->		
	<div class="form-group"  hidden="hidden">
		<label>글 번호</label>
		<input hidden="hidden" class="form-control" name="qna_no" value="${qDto.qna_no}" readonly="readonly">
	</div>
	
	<div class="form-group" hidden="hidden">
		<label>작성자 번호</label>
		<input hidden="hidden" class="form-control" name="mem_no" value="${qDto.mem_no}" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>카테고리</label>
		<select id="qnacategory" name="qna_category">
				<option value="" selected="selected">선택</option>
				<option value="배송문의">배송문의</option>
				<option value="기타문의">기타문의</option>
				<option value="입금문의">입금문의</option>
		</select>
	</div>
	
	<div class="form-group">
		<label>글 제목</label>
		<textarea class="form-control" name="qna_title">${qDto.qna_title}</textarea>
	</div>
	
	<div class="form-group">
		<label>글 내용</label>
		<textarea class="form-control" rows="3" name="qna_content">${qDto.qna_content}</textarea>
	</div>
	
	<div class="form-group">
		<label>작성자</label>
		<input class="form-control" name="qna_name" value='<c:out value="${qDto.qna_name}" />' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>작성일</label>
		<input class="form-control" name="qna_date" value="<fmt:formatDate pattern = 'yyyy/MM/dd' value="${qDto.qna_date}" />" readonly="readonly">
	</div>
	
	<button type="submit" class="btn btn-outline-secondary" data-oper='modify'>수정</button>
	<button type="submit" class="btn btn-outline-secondary" data-oper='remove'>삭제</button>
	<button type="submit" class="btn btn-outline-secondary" data-oper='list'>목록</button>
	
	<s:csrfInput/>
</form>
</body>
</html>