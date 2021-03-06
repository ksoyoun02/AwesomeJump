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
<script type="text/javascript">
   function qnaregister() {
      var params = jQuery("#qna").serialize();
      jQuery.ajax({
         url: '/awesomejump/qna/register',
         type: 'POST',
         data: params,
         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
         beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
         dataType: 'html',
         success: function(result){
            if(result){
               alert("문의가 등록되었습니다.");
               window.location.href="/awesomejump/qna/list";
            } else {
               alert("다시 시도해 주세요");
            }
         }
      });
   }
   
   function register() {
		if(document.qnaRegister.title.value == "") {
			alert ('문의 제목을 입력해 주세요.');
		} else if (document.qnaRegister.content.value == "") {
			alert ('문의 내용을 입력해 주세요.');
		} else if (document.qnaRegister.qnacategory.value == "") {
			alert ('카테고리를 선택해 주세요.');
		} else if (document.qnaRegister.qna_yn.value == "y") {
			if (document.qnaRegister.qna_pw.value == "") {
				alert ('비밀번호를 입력해 주세요.');
			} else {
				document.qnaRegister.submit();
			}
		} else {
			document.qnaRegister.submit();
		}
	}
   
</script>
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
  <script defer src="/resources/awesomejump/js/contact.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.ajaxchimp.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.form.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.validate.min.js"></script>
  <script defer src="/resources/awesomejump/js/mail-script.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	var result = '<c:out value="${result}" />';  
  });
  
  </script>
  
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
<br><br><br><br><br><br>
<div class="row" >
	<div class="col-lg-12" style="text-align: center;">
		<h4 class="page-header">문의 게시판</h4>
	</div>
</div>
<s:authentication property="principal" var="member"/>
<section id="container" id="registerPage">
	<form id="qna" action="/awesomejump/qna/register" method="post" name="qnaRegister">
		<div hidden="hidden" class="form-group">
			<label for="mem_no">작성자번호</label><input readonly="readonly" class="form-control" type="text" name="mem_no"  value="${member.mem_no}" />
		</div>
		<div class="form-group">
			<label for="qna_category">카테고리</label>
			<select id="qnacategory" name="qna_category">
						<option id="qnacategory" value="" selected="selected">선택</option>
						<option value="배송문의">배송문의</option>
						<option value="기타문의">기타문의</option>
						<option value="입금문의">입금문의</option>
			</select>
		</div>
		<div class="form-group">
			<label for="qna_title">제목</label><input id="title" class="form-control" name="qna_title">
		</div>
		<div class="form-group">
			<label for="qna_content">내용</label><textarea class="form-control" id="content" name="qna_content" ></textarea>
		</div>
		<div class="form-group">
			<label for="qna_name">작성자</label><input type="text" id="writer" name="qna_name" value="${member.mem_nickname}" readonly="readonly" />
		</div>
		<div class="form-inline">
			<input type="radio" name="qna_yn" id="qna_yn1" value="n" class="radio" /><span>공개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="qna_yn" id="qna_yn2" value="y" class="radio" checked="checked" /><span>비공개</span>&nbsp;&nbsp;
			<input type="password" name="qna_pw" id="qna_pw">
		</div>
		<br>
		<button id="qna" type="button" class="btn btn-outline-secondary" onclick="register();">등록</button>	
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='/awesomejump/qna/list'">취소</button>
		
		<s:csrfInput/>
	</form>
</section>
<script type="text/javascript">
	$(document).ready(function() {
		$("input:radio[name=qna_yn]").click(function() {
			if ($("input[name=qna_yn]:checked").val() == "y") {
				$("input:text[name=qna_pw]").attr("disabled",false);
			} else if ($("input[name=qna_yn]:checked").val() == "n") {
				$("input:text[name=qna_pw]").attr("disabled",true);
			}
		});
	});
</script>
</body>
</html>