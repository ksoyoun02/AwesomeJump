<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
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
  
  <!-- Swiper -->
  <link rel="stylesheet" href="/resources/awesomejump/css/swiper.min.css">
  <script src="/resources/awesomejump/js/swiper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  <script type="text/javascript">
  function deleteCookie(pno) {
	  var date = new Date();
      date.setDate(date.getDate() - 1);

      var Cookie = "";
      Cookie += "recent"+pno+"=;";
      Cookie += "Expires=" + date.toUTCString();

      // 쿠키를 집어넣는다.
      document.cookie = Cookie;
      
      alert("선택 상품이 삭제되었습니다");
      location.reload();
  }

  </script>
  <script type="text/javascript">
  
  function allCheck(){
	  var chk = $("#allCheck").prop("checked");
	  if(chk) {
	   $(".chBox").prop("checked", true);
	  } else {
	   $(".chBox").prop("checked", false);
	  }
  }

  function selectDelete() {
	var checkArr = [];
	
	$("input[class='chBox']:checked").each(function(){
		checkArr.push($(this).attr("data-cartNum"));
		//alert(checkArr);
		for(var i = 0 ; i<checkArr.length; i++){
			var date = new Date();
		      date.setDate(date.getDate() - 1);

		      var Cookie = "";
		      Cookie += "recent"+checkArr[i]+"=;";
		      Cookie += "Expires=" + date.toUTCString();

		      document.cookie = Cookie;
		}
	});
	 alert("선택 상품이 삭제되었습니다");
     location.reload();
}
  </script>
  <style>
    body {
      min-height: 1000px;
    }  
     .selectDelete_btn {
        border: none;
   	 	border-radius: 20px;
    	padding: 10px 50px;
    }
    .recent_btn {
    	border: none;
   	 	border-radius: 20px;
    	padding: 5px 60px;
    	margin: 5px;
    	font-family: "NANUM";
	font-size: 15px;
    }
    
    .pImg{
    	width: 150px; 
    	border-radius: 50px!important;
    	object-fit: cover;
    }
	@media (min-width: 768px)
	.container {
	    max-width: 700px;
	}
	
	p{
	font-family: "NANUM";
	font-size: 15px;
	font-weight: bold;
	}
  </style>
 
</head>
<body>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/membersNavbar.jsp"/>

  <div class="container">
    <div>
    </div>
    <section class="cart_area padding_top" style="padding-top: 80px;">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
              	<th style="width: 10%;"><input type="checkbox" name="allCheck" id="allCheck" class="allCheck" onclick="allCheck();"></th> 
                <th scope="col" style="width: 20%;">상품사진</th>
                <th scope="col" style="width: 30%;">상품명</th>
                <th scope="col" style="width: 15%;padding-right: 5px;padding-left: 5px;">적립금</th>
                <th scope="col" style="width: 15%;">가격</th>
                <th scope="col" style="width: 20%;">이동&nbsp;/&nbsp;삭제<th>
              </tr>
            </thead>
            <c:forEach items="${recentView}" var="recent" >
	            <tbody>
	              <tr>
	              	<td>
	              		<input type="checkbox" name="chBox" id="chBox" class="chBox" data-cartNum="${recent.product_no}"/>
	              		<script>
							 $(".chBox").click(function(){
							  $("#allCheck").prop("checked", false);
							 });
						</script>
	              	</td>
	              	<td>
	                    <div>
	                      <img class="pImg" src="/upload${recent.product_thumb_img}" alt="" />
	                    </div>
	                </td>
	                <td>
	                    <div class="media-body">
	                      <p style="padding: 20px;">${recent.product_name}</p>
	                    </div>
	                </td>
	                <td>
	                  <h5>${recent.product_point}p</h5>
	                </td>
	                <td>
	                 <h5>${recent.product_price}원</h5>
	                </td>
	                <td>
	                	<input type="button" value="이동" class="recent_btn" onclick="location.href='/memDetailProduct?product_no=${recent.product_no}'"><br>
	                	<input type="button" value="삭제" class="recent_btn" onclick="deleteCookie(${recent.product_no});"> 
	                </td>
	              </tr>
		        </tbody>
            </c:forEach>
          </table>
      	<button type="button" class="selectDelete_btn" onclick="selectDelete();" style="font-family: 'NANUM';font-size: 15px;">선택삭제</button>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="#" style="font-family: 'NANUM';font-size: 15px;">쇼핑 계속하기</a> 
          </div>
        </div>
      </div>
     </div> 
  </section>
  </div>

  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>