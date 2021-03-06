<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="ko">
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <s:csrfMetaTags/>
  
  <title>AwesomeJump - login</title>
  
  <style type="text/css">

  </style>
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
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
  
  function emailCheck() {
	  var CSRFheader = $("meta[name='_csrf_header']").attr('content');
	  var CSRFtoken = $("meta[name='_csrf']").attr('content');
	  
	  var emailVal = $("#email").val();

	  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  // ????????? ????????? ????????? ?????? regExp??? ??????

	  if (emailVal.match(regExp) != null) {
	    $.ajax({
	    	url : "/forgotPassword",
	    	type : "POST",
	    	dataType : "json",
	    	beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader,CSRFtoken),
	    	data : "email=" + emailVal,
	    	success:function(result){
	    		
	    		if(result.result == 2){
	    			alert(result.message);
	    			location.href = "/login";
	    		}else if(result.result == 1){
	    			alert(result.message);
	    			location.href = "/login";
	    		}else if(result.result == 0){
	    			alert(result.message);
	    		}
	    	}
	    });
	  }
	  else {
	    alert('????????? ????????? ?????? ?????????.');
	  }
}
  </script>
 <script type="text/javascript">
 $(function(){
	 $("#loading").hide();
 });
$(function (){
	$(document).ajaxStart(function(){
		$("#loading").show();
	});
	
	$(document).ajaxStop(function(){
		$("#loading").hide();
	});
});

 
 </script>
  <style type="text/css">
  .mid {
  	margin-top: 60px;
  	text-align: center;
  }
  #email {
 	 width: 400px;
    height: 50px;
    border: none;
    margin: 50px 0 20px 0;
    border-bottom: 1px solid #c1c1c1;
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
            
              <h2>Forget Password?</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

<section>
<div class="container">
	<div class="mid">
		<img alt="" src="/resources/logo2.png"><br>
		<h3 style="font-family: 'NANUM';font-weight: bold; font-size: 30px;">???????????? ??????</h3>
		<input type="text" id="email" name="email" placeholder="???????????? ??????????????????" style="text-align: center; font-size: 20px; font-family: 'NANUM';"><br>
		<div id="loading">
			<img src="/resources/loading.gif" style="margin-bottom: 20px;">
			<h3 style="font-family: 'NANUM'; font-weight: bold; margin-bottom: 20px;">????????? ??????????????????</h3>
		</div>
		<input type="button" value="???????????? ???????????? ??????" onclick="emailCheck();" class="btn btn-primary" style="padding: 20px 80px; font-family: 'NANUM'; font-weight: bold; font-size: 25px;">
	</div>
	
</div>

</section>
  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>