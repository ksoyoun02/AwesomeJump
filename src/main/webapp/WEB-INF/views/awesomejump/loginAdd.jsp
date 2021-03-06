<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!doctype html>
<html lang="ko">

  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <s:csrfMetaTags/>
  
  <title>AwesomeJump - loginadd</title>

<script type="text/javascript">
  function go_save(){
	  
	  const getName = RegExp(/^[a-zA-Z가-힣]{1}[a-zA-Z0-9가-힣]{3,19}$/);
	  var nickName = document.frm.nickName.value;
	  
	  var CSRFheader = $("meta[name='_csrf_header']").attr('content');
	  var CSRFtoken = $("meta[name='_csrf']").attr('content');
	  
	  if(!getName.test(nickName)){
		  $("#message2").html("닉네임은 특수문자 제외 4글자 이상<br> 20글자 이하로 작성되어야 하며 <br> 첫 글자는 숫자가 올 수 없습니다.").css("color", "red").shake();
		  $("input[name='nickname']").focus();
		  return false;
		  
	  }else{
	   $.ajax({
			type : "POST",
			url : "/nickName_check",
			dataType : "json",
			data : "nickName=" + nickName,
			async: false,
			beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader,CSRFtoken), 
			success : function(data) {
				if (data.message == "1") {
					$("#message2").html("이미 등록된 닉네임 입니다.").css("color", "red").shake();
					$("input[name='nickname']").focus();
				}else{
					//alert("사용가능");
				}
			},
			fail : function() {
				alert("시스템에러");
				return false;
			}
		}); 
	   //return false;
	  }
	  document.frm.action = "/loginAdd";
	  document.frm.submit();
}
  
</script>

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
  <script defer src="/resources/awesomejump/js/stellar.js"></script>
  <script defer src="/resources/awesomejump/js/price_rangs.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  <style type="text/css">
  	h3, h1, h4{
  		font-family: "NANUM";
  		font-weight: bold;
  	}
  	
  	.add input {
  		width: 350px;
    	text-align: center;
    	font-family: "NANUM";
  		font-size: 25px;
  		font-weight: bold;
  		margin: 20px;
  	}
  	
  	.add span {
  		font-family: "NANUM";
  		font-weight: bold;
  		font-size: 30px;
  	}
  </style>
</head>

<body>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>REGISTER</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!--================login_part Area =================-->
  <section class="login_part padding_top" style="padding-top: 10px;">
    <div class="container">
      <div class="row align-items-center">
          <div class="login_part_form" style="margin: auto; text-align: center;">
            <div class="login_part_form_iner">
           	<img alt="" src="/resources/logo2.png">
              <h3 style="margin-bottom: 50px;">회원가입 추가정보 입력</h3>
              <hr style="margin-bottom: 50px;">
              <div class="container">
              <div>
              	<h4>어썸이 처음이시군요?</h4>
			  	<h1 style="margin-bottom: 60px;">닉네임 변경이 필요합니다</h1>
              </div>
			  	<form name="frm" method="post" class="add">
				    <span>이메일 : </span>
				    <input type="text" name="email" id="email" value="${email}" readonly="readonly" style="border: none;"><br>
				    <span>닉네임 : </span>
				    <input type="text" name="nickName" id="nickName" value="${nickName}" onchange="nickNameCheck();" style="border: none; border-bottom: 1px solid; "><br>
				    <span id="message2" style="font-size: 20px; "></span>
				    <input type="hidden" name="token" value="${token }">
				    <input type="hidden" name="social" value="${social }">
				    <br>
				    <button type="button" onclick="go_save();" class="btn btn-primary" style="padding: 20px 80px; font-family: 'NANUM'; font-weight: bold; font-size: 25px; margin: 10px;">추가정보 입력 완료</button>
	   			 <s:csrfInput/>
    			</form>
  				</div>
            </div>
          </div>
      </div>
    </div>
  </section>
  <!--================login_part end =================-->

  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>