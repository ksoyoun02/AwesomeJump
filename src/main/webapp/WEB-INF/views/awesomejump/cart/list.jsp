<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>AwesomeJump - cart</title>
  
  <link rel="icon" href="/resources/awesomejump/img/favicon.png">
  <link rel="stylesheet" href="/resources/awesomejump/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/animate.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/nice-select.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/all.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/flaticon.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/themify-icons.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/magnific-popup.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/slick.css">
  <link rel="stylesheet" href="/resources/awesomejump/css/price_rangs.css">
  <!-- style CSS -->
  <link rel="stylesheet" href="/resources/awesomejump/css/style.css">
  <!-- <link rel="stylesheet" href="/resources/awesomejump/css/cart.css"> -->
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
  <script defer src="/resources/awesomejump/js/jquery.number.min.js"></script>
  <script defer src="/resources/awesomejump/js/jquery.validate.min.js"></script>
  <script defer src="/resources/awesomejump/js/mail-script.js"></script>
  <script defer src="/resources/awesomejump/js/stellar.js"></script>
  <script defer src="/resources/awesomejump/js/price_rangs.js"></script>
  <!-- custom js -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script defer src="/resources/awesomejump/js/custom.js"></script>
  <!-- ?????? ????????? ?????? ????????? ?????? -->


</head>

<body>
 
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>

  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>????????????</h2>
              <p>
                Home <span>-</span>????????????
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!--================Cart Area =================-->
  <form action="/checkout" name="order" id="order">
		          
  <c:choose>
	   <c:when test="${empty listCart}">
	   	<div style="text-align: center;">
		   <img alt="?????????" src="/resources/admin/img/emptyCart.png" width="250">
		  <p>??????????????? ???????????????.</p>
		  <button type="button" class="btn btn-info" onclick="location.href='/category'">???????????????</button>	   	
	   	</div>		
	  </c:when>
  <c:otherwise>
  
	 <section class="checkout_area padding_top">
	 		
		    <div class="container">
		        <div class="row data">
		          <div class="col-lg-8">
		    		
		          	<a  type="button" onclick="location.href='/awesomejump/cart/deleteAll?mem_no=${member.mem_no}'">????????????</a>	
		          	
		          	
		          	<div class="cart_box" style="float: center;">
					    <h3>??????</h3>
	          				<c:forEach items="${listCart}" var="cart" varStatus="st">

								<div class="border">
									<input type="checkbox" name="cart_no" id="cart_no${st.count}" value="${cart.cart_no}" checked>
		          					<a style="float: right;" type="button" onclick="location.href='/awesomejump/cart/delete?cart_no=${cart.cart_no}'">
		          						<b>X</b>
		          					</a>
		          								
					                  <div class="media">
					                    <div class="d-flex">
					                    
               									<!-- ???????????? -->
												<img src="/upload${cart.product_image_path}" alt="" style="width: 150px; border-radius: 50px;"/>
					                 
					                    </div>
					                    <div class="media-body" style="padding: 10px" >
					                    	<%-- <p id="cart__product__no${status.count}">${cart.product_no}</p> --%>
					                      <p id="cart__product__name${st.count}">?????? : ${cart.product_name}</p>
					                      <p id="cart__product__texture${st.count}">?????? : ${cart.product_texture}</p>	
					                      <div id="shoping__cart__price${st.count}" data-cart="${cart.product_price}" align="right">
					                      	<fmt:formatNumber value="${cart.product_price}" type="currency"/>
					                      </div>
					                      				                      
					                    </div>
					                  </div>
						         	
					                  <div class="border">
									<!-- <form action="/awesomejump/cart/update" name="updateCart" method="post" > -->
									
						                  <select class="option_select${st.count}" id="product_option_size${st.count}">
						                 	 <c:forEach items="${cart.option}" var="option" varStatus="status">
						            			<option id="optionNo" value="${option.product_option_no}" <c:if test="${cart.product_option_no == option.product_option_no}">selected</c:if> >
						            			${option.product_option_size} | ${option.product_option_color}		
							                 	</option>
						                  	  </c:forEach> 
				            			</select>   
				            			  <!-- "???????????? ?????? ??????" -->
						                <div class="updown">
						                	<input type="hidden" name="product_image_path" id="product_image_path${st.count}" value="${cart.product_image_path}">
						                	<input type="hidden" name="product_option_size" id="option${st.count}" value="${cart.product_option_size}">
						                	<input type="hidden" name="product_option_color" id="option${st.count}" value="${cart.product_option_color}">
						                	<input type="hidden" name="product_texture" id="product_texture${st.count}" value="${cart.product_texture}">
						                	<input type="hidden" name="product_price" id="product_price${st.count}" value="${cart.product_price}">
						                	<input type="hidden" name="product_name" id="product_name${st.count}" value="${cart.product_name}">
						                	<input type="hidden" name="product_option_no" id="product_option_no${st.count}" value="${cart.product_option_no}">
						                	<input type="hidden" name="product_no" id="product_no${st.count}" value="${cart.product_no}">
						                	<input type="hidden" name="product_point" id="product_point${st.count}" value="${cart.product_point}">
						                	<input type="hidden" name="mem_no" id="mem_no${st.count}" value="${member.mem_no}">
						                    <input type="text" name="cart_amount" id="cart_amount${st.count}" class="form-control" value="${cart.cart_amount}">
						                </div>
						            	  <div class="sum" align="right" >
						            	  		<fmt:formatNumber value="${cart.cart_amount * cart.product_price}" type="currency"/>
						            	  </div>
						            	  <button type="button" id="updateOption"  class="btn btn-info" onclick="reCart('${member.mem_no}'
						            	  																				,'${cart.product_no}'
						            	  																				,'${st.count}')" style="cursor:pointer">????????????</button>
						            	  
									 <!-- </form>  -->
					                  </div>
					                  
					          	</div>
					     
					        
					    </c:forEach>
		            </div>      
		          </div>
				          <div class="col-lg-4">
				            <div class="order_box">
				              <h2>?????? ??????</h2>
				              <ul class="list">
				                <li><a href="#">???????????? : <span><fmt:formatNumber value="${totalPrice}" pattern="#,###,###"/></span>
				                </a></li>
				                <li><a href="#">????????? : <span>+0</span>
				                </a></li> 
				              </ul>
				              <ul class="list list_2">
				                <li><a href="#">Total : <span><fmt:formatNumber value="${totalPrice}" pattern="#,###,###"/></span>
				                </a></li>
				              </ul>
				 
				              <div class="payment_item">
				              
				              <a class="btn_3" onclick="goOrder()" style="cursor:pointer" >????????????</a>
				              
				            </div>
				              <a style="float: right;">??????????????? : <span><fmt:formatNumber value="${totalPoint}" /></span></a>
				          </div>
				        </div>
		   	   </div>
			</div>
  		</section>
	</c:otherwise>
</c:choose>
	<s:csrfInput/>
	</form>
	<!--?????? ??? ?????? ?????????  -->
	<form action="/awesomejump/cart/update" name="ef" >
		 <input type="hidden" name="product_option_no"> 
		<input type="hidden" name="product_no" >
		<input type="hidden" name="mem_no" >
		<input type="hidden" name="cart_amount">
		<s:csrfInput/>
	</form>

<script type="text/javascript">


	/*?????? ??? ?????? ?????? */
	function reCart(mem,product,count){
		//alert("/"+mem+"/"+product+"/"+count);
		
		var option_no = $("#product_option_size"+count).val();
			 $('input[name=product_option_no]').attr('value',option_no);
		

		ef.product_no.value=product;
		ef.mem_no.value=mem;
		
		var qty=$('#cart_amount'+count).val(); //????????? ???????????? ??? ??? ??????
		ef.cart_amount.value=qty;

		var num=$('#product_option_no'+count).val();
		//alert(num);
		
		ef.product_option_no.value=num;
		
		ef.method='post';
		ef.submit(); 
	}
	
	/*?????? ??? ???????????? ??????  */
	function goOrder(){
		alert("?????????????????? ???????????????.");
		//??????????????? ?????? ????????? ?????? ??????
		 var chk=$('input[name="cart_no"]');
		if(chk.length==0){
			return;
		}
		//?????? ????????? ????????? ???????????? ?????? ?????? ????????? ????????? ????????? ??????(?????????/????????????)
		var cnt =0;
		$.each(chk,function(i,ch){
			if($(ch).is(":checked")){
				cnt++;
				$('#cart_amount'+(i+1)).prop('disabled',false);
			}else{
				$('#cart_amount'+(i+1)).prop('disabled',true);
			}
		});
		
		if(cnt==0){
			alert('????????? ????????? ???????????????');
			$('input[name="cart_amount"]').prop('disabled',false);
			return;
		} 
		order.method='post';
		order.submit();
	}
	
	

</script>


 


 
  <!--================End Cart Area =================-->

  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

</body>
</html>