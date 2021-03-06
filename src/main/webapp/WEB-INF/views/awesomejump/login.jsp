<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="ko">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="google-signin-scope" content="profile email">
 <meta name="google-signin-client_id" content="54924421221-tv5t5ilotp2e66qmhun67cqq8g1mlhmo.apps.googleusercontent.com">
 
  <s:authorize access="isAuthenticated()">
    <% response.sendRedirect("/members"); %>
  </s:authorize>
  <s:csrfMetaTags/>
  
  <title>AwesomeJump - login</title>
  
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
  <link rel="stylesheet" href="/resources/awesomejump/css/custom/login.css">
  
  
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
  <script defer src="/resources/awesomejump/js/custom/login.js"></script>
  <style type="text/css">
p {
font-size: 20px;
}
</style>
</head>
<body class="login">
  
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>

  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>LOGIN</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!--================login_part Area =================-->
  <section class="login_part padding_top" style="padding-top: 50px;">
    <div class="container">
          <div class="login_part_form" style="margin: auto;">
            <div class="login_part_form_iner" style="text-align: center;">
              <img alt="" src="/resources/logo2.png" style="margin-bottom: 60px;">
              <h3 style="font-size: 40px;">
                ?????????
              </h3>
                <div class="col-md-12 form-group p_star">
                  <input type="text" class="form-control" id="username" name="username" value="" placeholder="user@email.com" style="font-size: 25px; font-family: 'NANUM'; font-weight: bold;">
                </div>
                <div class="col-md-12 form-group p_star">
                  <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password" style="font-size: 25px; font-family: 'NANUM'; font-weight: bold;">
                </div>
                <div class="col-md-12 min-height-30px">
                  <p class="text-danger" id="login-result"></p>
                </div>
                <div class="col-md-12 form-group">
                  <div class="creat_account d-flex align-items-center">
                    <input type="checkbox" id="remember-me" name="remember-me">
                    <label for="f-option" style="font-size: 20px; font-family: 'NANUM'; font-weight: bold;" >Remember me</label>
                  </div>
                  <button id="login-submit" class="btn_3">LOGIN</button>
                  <a class="lost_pass" href="/forgotPassword" style="font-size: 18px;">forget password?</a>
                </div>
              
               <br>
               <div style="margin: 60px;">
               <hr style="margin-bottom: 40px;">
				<h3 style="margin-bottom: 40px; font-size: 40px;">???????????????</h3>
				<div class="register_logo">
					<div class="logosize" style="float: left; margin-left: 13%; margin-right: 8px;">
						<a href="javascript:kakaoLogin();"><img src="/resources/kakao.png"></a>
						<img src="/resources/naver.png" onclick="document.getElementById('naver_id_login_anchor').click();" style="cursor: pointer;">
					</div>
					<div>
						<div class="g-signin2" onclick="checkI();" data-onsuccess="onSignIn" ></div>
						<input type="hidden" value="-1" id="hiddenCheck">
					</div>
				</div>
					<!-- <img id="googleBtn" src="/resources/google.png" style="border: none;"> -->
					<!-- <div class="g-signin2" data-onsuccess="onSignIn" ></div> -->
   					<!-- <button type="button" onclick="signOut();">Sign Out</button> -->
				
			</div>
            </div>
          </div>
        </div>
      
  </section>
  <!--================login_part end =================-->

  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

  <!-- ????????? ?????? ????????? -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <!-- ????????? ?????? ????????? -->
  <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"></script>
  <div id="naver_id_login" style="display: none;"></div>
  <!-- ?????? ?????? ????????? -->
  <script src="https://apis.google.com/js/platform.js" async defer></script>

</body>
</html>