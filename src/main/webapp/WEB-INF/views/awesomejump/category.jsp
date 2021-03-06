<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
  <meta name="author" content="">
  <s:csrfMetaTags/>
  
  <title>AwesomeJump - category</title>
  
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
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
  <script defer src="/resources/awesomejump/js/stellar.js"></script>
  <script defer src="/resources/awesomejump/js/price_rangs.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
   
	  <script type="text/javascript">
	  $(document).ready(function(){
		  
		 // ?????????: <select name="sort_option"> ...
		 (function() {
			 let old_sort_option = $('input[name="old_sort_option"]').val();
			 if ( old_sort_option != undefined
					 && old_sort_option != '' ) {
				 // ?????? ??????
				 $('select[name="sort_option"] option[value=' + old_sort_option + ']').attr('selected', 'selected');
				 // ???????????? ?????????(span.current) ??????
				 $('span.current').html(
						 $('select[name="sort_option"] option[value=' + old_sort_option + ']').html()
				 );
			 }
		 })();
		  
	     $('#mainProduct').on('click', function(){
	        $.ajax({
	        
	            type : 'GET', // ?????? (get, post, put ??????)
	            url : '/category', // ????????? ??????url
	            async : false, // ???????????? ?????? (default : true)
	            headers : { // Http header
	              "Content-Type" : "application/json",
	              "X-HTTP-Method-Override" : "POST"
	            },
	            dataType : 'JSON', // ????????? ?????? (html, xml, json, text ??????)
	            data : JSON.stringify({ // ?????? ????????? (Object , String, Array)
	              "mainProduct" : mainProduct
	            }),
	            success : function(result) { // ?????? ?????? ????????????
	                console.log(result);
	            },
	            error : function(request, status, error) { // ?????? ?????? ????????????
	                console.log(error)
	            }
	        }) 
	        alert(mainProduct.product_name)
	     
	    })
	});
	  
	  </script>
  
  <!-- ????????? ????????????. -->
  <script type="text/javascript">
  $(document).ready(function() {
      
      let product_no_str = '';  
      let uploadResult = $("#uploadTumbResult");
      $('.selected_product_no').each(function(){
         product_no_str += $(this).val() + ',';
      });
      console.log(product_no_str);
      $.getJSON('/getAllMemImageList', {'product_no_str':product_no_str}, function(arr){
         console.log(arr[0].product_no);
         console.log(arr[0].pro_image_no);
         
         let crtProductNo = -1;
         for (let i = 1; i < arr.length; i++) {
             if (arr[i].product_no != crtProductNo) {
                crtProductNo = arr[i].product_no;
                
                $('#thumb_card_' + arr[i].product_no).attr('data-path', arr[i].pro_image_path);
                $('#thumb_card_' + arr[i].product_no).attr('data-uuid', arr[i].pro_image_uuid);
                $('#thumb_card_' + arr[i].product_no).attr('data-filename', arr[i].pro_image_name);
	            let fileCallPath = encodeURIComponent(arr[i].pro_image_path.replace(/\\/g, '/') + "/" + arr[i].pro_image_uuid + "_" + arr[i].pro_image_name);
	            $('#thumb_' + arr[i].product_no).attr('src', '/display?fileName=' + fileCallPath);
             }
         }
      });
  });

  </script>
  
   <!-- ???????????? ?????? -->
  <script type="text/javascript">
  $(document).ready(function(){

  $(".interestInsertMember").click(function(){
	  var param = {
			    product_no: Number($(this).val())
			}
	  var CSRFheader = $("meta[name='_csrf_header']").attr('content');
      var CSRFtoken = $("meta[name='_csrf']").attr('content');
	
	      if(CSRFtoken && CSRFheader) {
	          $(document).ajaxSend(function(event, xhr, options) {
	              xhr.setRequestHeader(CSRFheader, CSRFtoken);
	          });
	      }
	      
      $.ajax({
		type: 'post',
		contentType: 'application/json',
		beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
		url: '/interestInsertMember',
		data: JSON.stringify(param),
		dataType: 'json',
		success: function(data){
			
			if(data) {
				
			    alert('?????? ????????? ???????????????.');
			    $('#interest_btn_' + param.product_no).html('<span style="color: red;">???</span>');
			    console.log(this);
			} else {
			    alert('?????? ????????? ?????????????????????.');
			    $('#interest_btn_' + param.product_no).html('???');
			}
		},
		error: function(data) {
			var result = confirm("???????????? ???????????????. ????????????????????? ??????????????????????");
	        
	        if(result)
	        {
	        	location.href="/admin/login";
	        }
		}
	})
})  
 });
  </script>
<!-- ????????? ??????(???????????? ?????? ???) -->
<script type="text/javascript">
function moveCate() {
	let sort_option = $('select[name="sort_option"] option:selected').val();
	location.href = '/category?sort_option=' + sort_option;
}
function moveMainCateTo(cateCode) {
	let sort_option = $('select[name="sort_option"] option:selected').val();
	location.href = '/category?category_main=' + cateCode + '&sort_option=' + sort_option;
}
function moveMidCateTo(cateCode) {
	let sort_option = $('select[name="sort_option"] option:selected').val();
	location.href = '/category?category_mid=' + cateCode + '&sort_option=' + sort_option;
}
function moveSubCateTo(cateCode) {
	let sort_option = $('select[name="sort_option"] option:selected').val();
	location.href = '/category?category_sub=' + cateCode + '&sort_option=' + sort_option;
}
function searchSubmit(obj) { // onsubmit
	obj.append('<input type="hidden" name="sort_option" value="'
			+ $('select[name="sort_option"] option:selected').val()
			+ '">');
}
function moveSortedPage() { // onchange
	let new_sort_option = $('select[name="sort_option"] option:selected').val()
	let old_sort_option = $('input[name="old_sort_option"]').val();
	if (old_sort_option == new_sort_option) {
		// ????????? ????????? ?????? ?????????
		return;
	}
	let old_category_main = $('input[name="old_category_main"]').val();
	let old_category_mid = $('input[name="old_category_mid"]').val();
	let old_category_sub = $('input[name="old_category_sub"]').val();
	let old_keyword = $('input[name="old_keyword"]').val();
	location.href = '/category?'
			+ 'category_main=' + old_category_main
			+ '&category_mid=' + old_category_mid
			+ '&category_sub=' + old_category_sub
			+ '&keyword=' + old_keyword
			+ '&sort_option=' + new_sort_option;
}
</script>

<style type="text/css">

	h1{
		font-family: "NANUM";
		font-weight: bold;
		font-size: 60px;
	}
	h2{ 
		font-family: "NANUM";
		font-weight: bold;
		font-size: 60px;
	}
	
	h3{ /* ????????? */
		font-family: "NANUM";
		font-weight: bold;
		font-size: 30px;
	}
	 
	h4{ /* ????????? */
		font-family: "NANUM";
		font-weight: bold;
		font-size: 15px;
	}
	h5{ /* ????????? */
		font-family: "NANUM";
		font-weight: bold;
		font-size: 13px;
	}
</style>
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
              <h2>?????? ??????</h2>
              <p>
                <!-- Home <span>-</span> Shop Category -->
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!--================Category Product Area =================-->
  <section class="cat_product_area section_padding">
  
  <!-- ?????? -->
  <div class="col-lg-12" align="center"  style="width: 100%; position: fixed; right: 0px; top: 100px;">
              <div class="product_top_bar d-flex justify-content-between align-items-center">
                <div class="single_product_menu" >
             
                </div>
                <div class="single_product_menu d-flex">
               <form action="/category?keyword=${product_name}" id="keywordSearch" method="get" onsubmit="searchSubmit(this);">
                  <div class="input-group">
                    <input type="text" name="keyword" class="form-control" placeholder="search" aria-describedby="inputGroupPrepend">
                    <div class="input-group-prepend">
                      <button class="input-group-text" id="inputGroupPrepend"><i class="ti-search"></i></button>
                    </div>
                  </div>
               </form>
                </div>
                
              </div>
            </div>
            
    <div class="container">
      <div class="row">
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title" style="cursor:pointer">
								<h2>
									<a onclick="moveCate()"
										style="width: 300px; height: 10px; color: DSD;"> Category
									</a>
									<br>
								</h2>
							</div>
							
							<div>
							
							<div class="widgets_inner" style="height: 10px; cursor:pointer;">
								<c:forEach items="${category}" var="category">
									<h3 class="mb-0">
										<strong><c:if test="${category.level == '1'}">
											<a onclick="moveMainCateTo(${category.cateCode})">
												${category.cateName} </a>
										</c:if></strong>
									</h3>
									
										<h4 class="mb-0">
											<a onclick="moveMidCateTo(${category.cateCode})"> <c:if
													test="${category.level == '2'}"> ${category.cateName} </c:if>
											</a>
										</h4>
									
									<div id="collapseOne" class="collapse show"
										aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div id="collapseOne" class="collapse show"
											aria-labelledby="headingTwo"
											data-parent="#accordionExample">
											<div class="accordion" id="accordionExample">
												<h5 class="mb-0">
													<a onclick="moveSubCateTo(${category.cateCode})"> <c:if
															test="${category.level == '3'}">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${category.cateName} </c:if>
													</a>
												</h5>
											</div>
										</div>
									</div>
									<hr>
								</c:forEach>
							</div>
							</div>
						</aside>

						<!-- ??????  -->
						<div class="col-lg-9">

							<div class="row align-items-center latest_product_inner">
								<div class="col-lg-4 col-sm-6"></div>
								<div class="col-lg-12">
										<!-- <div class="pageination">
											<nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center">
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Previous"> <i class="ti-angle-double-left"></i>
	
													</a></li>
													<li class="page-item"><a class="page-link" href="#">1</a></li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item"><a class="page-link" href="#">4</a></li>
													<li class="page-item"><a class="page-link" href="#">5</a></li>
													<li class="page-item"><a class="page-link" href="#">6</a></li>
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Next"> <i class="ti-angle-double-right"></i>
													</a></li>
												</ul>
											</nav>
										</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row" >
					<div>
					
						<p style="font-size: 20px;"><strong> 
							<c:if test="${categoryBrunch ne null}">
							   <c:forEach items="${categoryBrunch}" var="crumb" varStatus="status">
								   <c:if test="${status.index != 0}">
								      &nbsp; &gt; 
							      </c:if>
							      <c:choose>
								      <c:when test="${status.index == 0}">
								      	<a href="/category?category_main=${crumb.cateCode}">${crumb.cateName}</a>
								      </c:when>
								      <c:when test="${status.index == 1}">
								      	<a href="/category?category_mid=${crumb.cateCode}">${crumb.cateName}</a>
								      </c:when>
								      <c:when test="${status.index == 2}">
								      	<a href="/category?category_sub=${crumb.cateCode}">${crumb.cateName}</a>
								      </c:when>
							      </c:choose>
							   </c:forEach>
							</c:if>
						</strong> </p>	
						<p style="font-family: 'NANUM';">?????? ??? ?????? : ${selectAllCntPro } ???</p>
						<!-- TODO ?????? ??? ???, ?????? ?????????, ?????? ??? -->
						<div style="float: right;">
							<select name="sort_option" onchange="moveSortedPage();">
							    <option value="1">?????? ???</option>
							    <option value="2">?????? ??? ???</option>
							    <option value="3">?????? ?????????</option>
							    <option value="4" >?????? ?????????</option>
							    <option value="5">?????? ???</option>
							</select>
						</div>
						
						<div>
						
							<div class="row" style="width: 900px; height: 150px; display: flex; flex-direction: row; margin-right: 10px; z-index: 1; position:relative; ">
								<c:forEach items="${product}" var="product" varStatus="idx">
									<a href="/memDetailProduct?product_no=${product.product_no}" style="width: 250px;">

										<div class="single_product_item" style="width: 300px; postiion : relative;">
											<div class="single_product_text" >
												<!-- ???????????? -->
												<div class="form_section" >
													<div class="single_product_item">
														<div id="thumb_card_${product.product_no}" >
															<br> 
															<img id="thumb_${product.product_no}"
																 src="/resources/admin/img/noImage.png"
																 style="width: 250px; border-radius: 20px;" >
														</div>
													</div>
												</div>
												${product.product_name} <br> <fmt:formatNumber value="${product.product_price}" pattern="#,###"/> ???<br>
												?????? ${product.review_cnt} ???  ( ${product.review_grade} )<br> 

												<input type="hidden" class="selected_product_no" value="${product.product_no}">
												<input type="hidden" value="${product.product_no}" id="product_no">
											</div>
										</div>
									</a>
									<div>
										<button class="interestInsertMember" value="${product.product_no}" id="interest_btn_${product.product_no}" style="background-color:transparent; margin-top: 50px; z-index: 1; border-radius: 50px;">
										<c:choose>
											<c:when test="${product.product_interest_yn eq 'n'}">???</c:when>
											<c:when test="${product.product_interest_yn eq 'y'}"><span style="color: red;">
											???
											</span> 
											</c:when>
										</c:choose>
										</button>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<a style="display:scroll;position:fixed;bottom:50px;right:50px; " href="#" title=?????? ??????">??? ??? ??????</a> 

				
				</section>
  <!--================End Category Product Area =================-->

  <!-- product_list part end-->
	<input type="hidden" name="old_category_main" value="${old_category_main}">
	<input type="hidden" name="old_category_mid" value="${old_category_mid}">
	<input type="hidden" name="old_category_sub" value="${old_category_sub}">
	<input type="hidden" name="old_keyword" value="${old_keyword}">
	<input type="hidden" name="old_sort_option" value="${old_sort_option}">
	
	

</body>
</html>