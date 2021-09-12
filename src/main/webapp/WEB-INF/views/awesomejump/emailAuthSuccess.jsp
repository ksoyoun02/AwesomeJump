<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="ko">

  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <s:csrfMetaTags/>
  <s:authorize access="isAuthenticated()">
    <% response.sendRedirect("/members"); %>
  </s:authorize>
  
  
  <title>AwesomeJump - join</title>
  
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
  @font-face {
	src : url("/resources/awesomejump/fonts/NanumBarunpenR.ttf");
	font-family: "NANUM";
}	
  #mid {
  	 text-align: center;
  	 margin-top: 100px;
  	 margin-bottom: 100px;
  }
  
  #mid input{
  	margin: 10px;
    width: 300px;
    padding: 15px;
    font-family: NANUM;
    font-weight: bold;
    font-size: 25px;
  }
  
  #box {
  	background-color: #cef4ff30;
    padding: 90px;
    
  }
  
  h1{
  	font-family: NANUM;
  	font-weight: bold;
  }
  h3{
  	font-family: NANUM;
  	font-weight: bold;
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
              <h2>register</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

<section>
<div class="container">
	<div id="mid">
	  <img alt="" src="/resources/logo2.png" style="margin-bottom: 20px;"><br><br>
		<div id="box">
			<h1 style="margin-bottom: 50px;">이메일 인증 성공</h1>
			<h3 style="margin-bottom: 50px;">이메일 인증이 완료되었습니다.</h3>
			
			<a href="/"><input class="btn btn-outline-primary" type="button" value="메인으로 가기"></a>
			<a href="/login"><input class="btn btn-outline-primary" type="button" value="로그인하기"> </a>
		</div>
	</div>
</div>
</section>
  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>