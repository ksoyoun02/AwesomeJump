<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <s:csrfMetaTags/>
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
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  <script type="text/javascript">
  	function coupon(coupon_no) {
  		var CSRFheader = $("meta[name='_csrf_header']").attr('content');
		var CSRFtoken = $("meta[name='_csrf']").attr('content');
		
		$.ajax({
			type : "POST",
			url : "/postCoupon",
			dataType : "json",
			data : "coupon_no="+coupon_no,
			beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader,CSRFtoken),
			success: function(data){
				if(data.result == -1){
					alert("로그인 후 이용 가능합니다");
				}else if(data.result == -2){
					alert("이미 발급된 쿠폰입니다");
				}else if(data.result == 1){
					alert("쿠폰이 발급되었습니다");
				}else if(data.result == -3){
					alert("다시 시도해주세요");
				}
			},
			fail : function(){
				
			}
		});
		
	}
  </script>
  <style>
   @media screen and (max-width : 768px){
	 .couponList img {
    	width: 40%!important;
    	margin: 20px!important;
    }
    	h2 {
    		font-size: 25px!important;
    	}
    	.notice span {
    		font-size: 15px!important;
    	}
    	.noticeh2 {
    		margin: 20px 70px 20px 30px!important;
    	}
   }
   
   
    body {
      min-height: 1000px;
    }  
    h1 {
	    margin: auto;
	    font-family: "NANUM";
	    font-weight: bold;
	    font-size: 4vw;
	    background-color: #ffc5e936;
	    width: 90%;
	    padding: 6%;
	    border-radius: 120px;
    }
    .couponList img {
    	width: 500px;
    	margin: 30px;
    
    }
    h2 {
    	font-family: "NANUM";
    	font-size: 3rem;
    }
    
    .notice span{
   		font-family: "NANUM";
   		font-size: 1.5rem;
    	font-weight: bold;
    }
    .notice {
    	margin-top: 40px;
    }
    
    .noticeh2{
   		float: left; 
    	margin: 20px 70px 50px 250px;
    }
  </style>
  
</head>

<body>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
	<div style="height: 200px; background-color: #ecfdff;"></div>
  <div class="container" style="text-align: center;">
  	<div style="margin: 60px;">
  		<img src="/resources/logo2.png" style="padding-bottom: 20px;">
  		<h1>쿠폰이벤트</h1>
  	</div>
	  <div class="couponList">
	  	<img src="/resources/awesomejump/coupon/1000.JPG" onclick="coupon(2)" style="cursor: pointer;">
	  	<img src="/resources/awesomejump/coupon/2000.JPG" onclick="coupon(3)" style="cursor: pointer;">
	  	<img src="/resources/awesomejump/coupon/3000.JPG" onclick="coupon(4)" style="cursor: pointer;">
	  	<img src="/resources/awesomejump/coupon/4000.JPG" onclick="coupon(5)" style="cursor: pointer;">
	  </div>
	  <br><hr>
	  <div class="notice">
	  	<div class="noticeh2">
	  		<h2>!</h2>
	  		<h2>읽어보세요</h2>
	  	</div>
	  	<div style="text-align: left; margin: auto;">
	  		<span>• 쿠폰발급은 로그인 후 가능</span><br>
	  		<span>• 회원에게만 적용되며 로그인 후 사용 가능</span><br>
	  		<span>• 기간은 쿠폰 발급 후 1주일 (그 이후에는 자동 삭제)</span><br>
	  		<span>• 마이페이지 > 회원정보 > 쿠폰에서 쿠폰 확인</span><br>
	  		<span>• 타 쿠폰과 중복 사용 불가</span>
	  	</div>
	  </div>
	  <br><br><hr>
  </div>

  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>