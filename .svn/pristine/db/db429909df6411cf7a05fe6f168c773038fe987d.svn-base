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
  
  <title>AwesomeJump - Detail</title>
  
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript" src="resources/awesomejump/js/proQna.js"></script>

<!-- 별점 -->
<style type="text/css">
.star-rating {
	width:304px; 
}
	
.star-rating,.star-rating span {
	display:inline-block; 
	height:55px; 
	overflow:hidden; 
	color: red;
	background:url(resources/star.png)no-repeat;
}

.star-rating span {
	background-position:left bottom; 
	line-height:0; 
	vertical-align:top; 
	color: red;
}
</style>

<!-- HOVER SCALE -->
<style type="text/css">
.detail-btn {
	/* HOVER 등 효과 올 때 변화가 0.3초에 걸쳐 서서히 */
	transition: 0.3s;
}

.detail-btn:HOVER {
	/* transform: scale(가로, 세로); */
	transition: 0.1s;
	transform: scale(1.02,1.02);
}

.detail-btn:ACTIVE {
	transition: 0.3s;
	transform: scale(0.95,0.95);
}
</style>
<!-- Global Variables -->
<script>
/** 메뉴 사라지고 나타나는 시간 [milliseconds] */
window.showDuration = 100;
</script>
<script type="text/javascript">
/* Qna */
$(document).ready(function() {
	
	console.log(proQnaService);
	var proValue = '<c:out value="${mainProduct.product_no}"/>';
	var memValue = '<c:out value="${member.mem_no}"/>';
	var memNameValue = '<c:out value="${member.mem_nickname}"/>';
	var qnaUL = $(".chat");
	
	showList(1);
	  
	function showList(page) {
		proQnaService.getList({product_no:proValue, page: page||1}, (list) => {
			var str="";
					  
			if(list == null || list.length == 0) {
				qnaUL.html('');
				return;
			}
					  
			for(var i = 0, len = list.length || 0; i < len; i++) {
				str +="<li class='left clearfix' data-pro_qna_no='"+list[i].pro_qna_no+"'>";
				str += "<div><div class='header'><strong class='primary-font'>"+list[i].pro_qna_name+"</strong>";
				str +="<small class='pull-right text-muted'>"+proQnaService.displayTime(list[i].pro_qna_date)+"</small></div>";
				str +="<p>"+list[i].pro_qna_content+"</p></div></li>";
			}
			qnaUL.html(str);
		});
	}
	  
	var modal = $(".modal");
	var modalInputMemNo = modal.find("input[name='mem_no']");
	var modalInputCategory = modal.find("input[name='pro_qna_category']");
	var modalInputTitle = modal.find("input[name='pro_qna_title']");
	var modalInputContent = modal.find("input[name='pro_qna_content']");
	var modalInputName = modal.find("input[name='pro_qna_name']");
	var modalInputDate = modal.find("input[name='pro_qna_date']");
	var modalInputPw = modal.find("input[name='pro_qna_pw']");
	
	var modalReplyBtn = $("#modalReplyBtn");
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addQnaBtn").click(function(e) {
		modal.find("input").val("");
		modalInputDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
		
		modalRegisterBtn.on("click" , function(e) {
			var addqna = {
				mem_no: modalInputMemNo.val()
				, pro_qna_category: modalInputCategory.val()
				, pro_qna_title: modalInputTitle.val()
				, pro_qna_content: modalInputContent.val()
				, pro_qna_name: modalInputName.val()
				, product_no: proValue
			};
			
			proQnaService.add(addqna, (result) => {
				
				modal.find("input").val("");
				modal.modal("hide");
				  
				showList(1);
			});
		});
	});
	
	$(".chat").on("click", "li", function(e) {
		var pro_qna_no = $(this).data("pro_qna_no");
		console.log(pro_qna_no);
		proQnaService.get(pro_qna_no, function(qna) {
			modalInputMemNo.val(qna.mem_no).attr("readonly", "readonly");
			modalInputCategory.val(qna.pro_qna_category).attr("readonly", "readonly");
			modalInputTitle.val(qna.pro_qna_title);
			modalInputContent.val(qna.pro_qna_content);
			modalInputName.val(qna.pro_qna_name).attr("readonly", "readonly");
			modalInputDate.val(proQnaService.displayTime(qna.pro_qna_date)).attr("readonly", "readonly");
			modal.data("pro_qna_no", qna.pro_qna_no);
			
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalReplyBtn.show();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	
	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) 
		  var recipient = button.data('whatever') 
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient)
		})
		  
	modalModBtn.click(function(e) {
		var qna = {pro_qna_no:modal.data("pro_qna_no"), pro_qna_title: modalInputTitle.val(), pro_qna_content: modalInputContent.val()};
		
		proQnaService.update(qna, function(result) {
			modal.modal("hide");
			showList(1);
		});
	});
	
	modalRemoveBtn.click(function (e) {
		var pro_qna_no = modal.data("pro_qna_no");
		
		proQnaService.remove(pro_qna_no, function(result) {
			modal.modal("hide");
			showList(1);
		});
	});

	
	 /*  Qna 추가 테스트
	 proQnaService.add(
	  	{mem_no:11, pro_qna_category:"test", pro_qna_title:"JS Test", pro_qna_content:"test", pro_qna_name : "tester", product_no:proValue}
	  	,
	  	function(result) {
	  		alert("RESULT : " + result); 
	  	}
	  ); */
	  
	  /* 목록 테스트
	  proQnaService.getList({product_no:proValue, page:1}, function(list){
		 for(var i = 0, len = list.length || 0; i < len; i++) {
			 console.log(list[i]);
		 } 
	  }); */
	  
	  //7번 qna 삭제 테스트
	  /* proQnaService.remove(7, function (count) {
		  console.log(count);
		  if (count === "success") {
			  alert("Removed");
		  }
	  }, function(err) {
		  alert("Error...");
	  }); */
	  
	  //6번 qna 수정 테스트
	  /* proQnaService.update({
		 pro_qna_no : 6,
		 product_no : proValue,
		 pro_qna_title : "수정 테스트",
		 pro_qna_content : "수정테스트"
	  }, function (result) {
		  alert("수정완료");
	  }); */
	  
	  //읽기
	  /* proQnaService.get(6, function(data) {
		  console.log(data);
	  }); */
  });
  
  </script>
  
  
  <script type="text/javascript">
 $(document).ready(function (){
	  
	  var date = new Date();
	  date.setDate(date.getDate() + 7);
	  
	  var i = '${mainProduct.product_no}';
	  var Cookie = "";
	  Cookie += "recent" + i + "=" + i + ";";
	  Cookie += "Expires=" + date.toUTCString();
	  
	  document.cookie = Cookie;
  
 });
  </script> 

  <script type="text/javascript">
	$(document).ready(function (){
		$('#amount_plus_btn').click(function () {
			var count = Number($('#amount').val())-0;
			
			if(count < $('#product_stock').val() ){
				// setter는 값을 정하는 것.
				$('#amount').val( count + 1 );
				var totalPrice = Number($('#amount').val()) * Number($('#product_price').val());
				$('#price').val(totalPrice.toLocaleString());
			}
			
			function comma(str) {
		    	str = String(str);
	    		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			}
		})

		$('#amount_minus_btn').click(function () {
			var count = Number($('#amount').val())-0;
			
			if(count >= 2){
				// setter는 값을 정하는 것.
				$('#amount').val( count - 1);
					var totalPrice = Number($('#amount').val()) * Number($('#product_price').val());
				$('#price').val(totalPrice.toLocaleString());
			}
		})
	});
		

  </script>
  
  <!-- 페이지 이동(카테고리 선택 시) -->
<script type="text/javascript">
function moveCate() {
	let sort_option = $('select[name="sort_option"] option:selected').val()??1;
	location.href = '/category?sort_option=' + sort_option;
}
function moveMainCateTo(cateCode) {
	let sort_option = $('select[name="sort_option"] option:selected').val()??1;
	location.href = '/category?category_main=' + cateCode + '&sort_option=' + sort_option;
}
function moveMidCateTo(cateCode) {
	let sort_option = $('select[name="sort_option"] option:selected').val()??1;
	location.href = '/category?category_mid=' + cateCode + '&sort_option=' + sort_option;
}
function moveSubCateTo(cateCode) {
	let sort_option = $('select[name="sort_option"] option:selected').val()??1;
	location.href = '/category?category_sub=' + cateCode + '&sort_option=' + sort_option;
}
function searchSubmit(obj) { // onsubmit
	obj.append('<input type="hidden" name="sort_option" value="'
			+ ($('select[name="sort_option"] option:selected').val()??1)
			+ '">');
}
function moveSortedPage() { // onchange
	let new_sort_option = $('select[name="sort_option"] option:selected').val()
	let old_sort_option = $('input[name="old_sort_option"]').val()??1;
	if (old_sort_option == new_sort_option) {
		// 페이지 이동할 필요 없으니
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
  
<!-- 상품 상세 이미지 가져오기. -->
<script type="text/javascript">
$(document).ready(function() {
	
	let product_no = $('#product_no').val(); 
	let uploadResult = $("#uploadResult");
	
	$.getJSON('/getMemImageList', {product_no : product_no}, function(arr) {
		if(arr.length === 0) {
			let str = "";
			str += "<div id='result_card'>";
			str += "<img alt='이미지없음' src='/resources/admin/img/noImage.png'>";
			str += "</div>";
			
			uploadResult.html(str);
			
			console.log('상품 번호', product_no, '이미지 없음');
			return;
		}
		
		let str = '';
		let obj = arr;
		
		for(let i = 0; i < obj.length; i++){
			let fileCallPath = encodeURIComponent(obj[i].pro_image_path.replace(/\\/g, '/') + "/" + obj[i].pro_image_uuid + "_" + obj[i].pro_image_name);
			str += "<div id='result_card'";
			str += "data-path='" + obj[i].pro_image_path + "' data-uuid='" + obj[i].pro_image_uuid + "' data-filename='" + obj[i].pro_image_name + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath + "'>";
			str += "</div>";
		}
		
		uploadResult.html(str);
		console.debug('상품 번호', product_no, '이미지 있음');
		
	});// $.getJSON(url = '/getMemImageList', ... )
	
	
});
 
</script>
  
  <!-- 관심상품 담기 -->
  <script type="text/javascript">
  $(document).ready(function(){
	
	$(".interestInsertMember").click(function(){
		var param = {
			product_no: Number($(this).val())
		}
		
		const CSRFheader = $("meta[name='_csrf_header']").attr('content');
		const CSRFtoken = $("meta[name='_csrf']").attr('content');
		
		if (CSRFtoken && CSRFheader) {
//			$(document).ajaxSend(function (event, xhr, options) {
//				xhr.setRequestHeader(CSRFheader, CSRFtoken);
//			});
			$(document).ajaxSend( (event, xhr, options) => xhr.setRequestHeader(CSRFheader, CSRFtoken));
		}
		
		let ajaxObj = {
				type: 'post'
				, contentType: 'application/json'
				, beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken)
				, url: '/interestInsertMember'
				, data: JSON.stringify(param)
				, dataType: 'json'
				, success: function (isInserted) {
					if(isInserted) {
					    alert('관심 상품이 담겼습니다.');
					    $('#interest_btn_' + param.product_no).html('<span style="color: red;">♥</span>');
					    console.log(this);
					} else {
					    alert('관심 상품이 해제되었습니다.');
					    $('#interest_btn_' + param.product_no).html('♡');
					}
				}
				, error: function (data) {
					var willMove = confirm("로그인이 필요합니다. 로그인화면으로 이동하겠습니까?");
					
					if (willMove) {
						location.href="/admin/login";
					}
				}
		}// ajaxObj
		
    	$.ajax(ajaxObj)
    	
	})// $(".interestInsertMember").click
});// ready
</script>
  
<!-- 장바구니에 상품담기  -->
<script type="text/javascript">
$(document).ready(function(){
	$("#insertProduct").click(function() {
		
		var param = {
				product_option_no: $('#ProductOptionSearch>option:selected').val(),
				cart_amount: $('#amount').val(),
				product_no: $('#product_no').val(),
				mem_no: $('#mem_no').val()
		}
		
		const CSRFheader = $("meta[name='_csrf_header']").attr('content');
		const CSRFtoken = $("meta[name='_csrf']").attr('content');
		
		if(CSRFtoken && CSRFheader) {
			$(document).ajaxSend( (event, xhr, options) => xhr.setRequestHeader(CSRFheader, CSRFtoken) );
		}
		
		let ajaxObj = {
				type: 'post'
				, contentType: 'application/json'
				, beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken)
				, url: '/cartAdd'
				, data: JSON.stringify(param)
				// , contentType : "application/x-www-form-urlencoded; charset=UTF-8"
				, dataType: 'text'
				, success: function(data) {
					/*
						final String OPTION_INVALID		= "OPTION_INVALID";
						final String CART_INSERTED 		= "CART_INSERTED";
						final String CART_UPDATED 		= "CART_UPDATED";
						final String UNEXPECTED_RESULT 	= "UNEXPECTED_RESULT";
					*/
					console.log(data);
					if(data == 'OPTION_INVALID') {
						alert('유효한 옵션이 아닙니다!');
					} else if(data == 'CART_UPDATED') {
						// (수량 UPDATE)
						alert('장바구니가 업데이트되었습니다!');
					} else if(data == 'UNEXPECTED_RESULT') {
						alert('예기치 못한 오류!');
					} else if(data == 'CART_INSERTED') {
						let willMoveToCart = confirm('담긴 상품이 도망갔는지 확인하러 가볼까요?');
						if (willMoveToCart) {
							location.href="awesomejump/cart/list";
						}
					}
				}
				, error: function(data) {
					var result = confirm("로그인이 필요합니다. 로그인화면으로 이동하겠습니까?");
					if(result) {
						location.href="/admin/login";
					}
				}
		}// ajaxObj
		
		$.ajax(ajaxObj)
	});// $('#insertProduct').click
});// ready
</script>
  
  <!-- 썸네일 가져오기. -->
 <script type="text/javascript">
  $(document).ready(function() {
		
		let product_no = $('#product_no').val(); 
		let uploadResult = $("#uploadTumbResult");
		
		$.getJSON("/getMemImageList", {product_no : product_no}, function(arr){
			if(arr.length === 0) {
				let str = "";
				str += "<div id='result_card'>";
				str += "<img alt='이미지없음' src='/resources/admin/img/noImage.png'>";
				str += "</div>";
				
				uploadResult.html(str);
				
				console.log('상품 번호', product_no, '이미지 없음');
				return;
			}
			
			let str = "";
			let obj = arr;
			
			let fileCallPath = encodeURIComponent(obj[0].pro_image_path.replace(/\\/g, '/') + "/" + obj[0].pro_image_uuid + "_" + obj[0].pro_image_name);
			str += "<div id='result_card'";
			str += "data-path='" + obj[0].pro_image_path + "' data-uuid='" + obj[0].pro_image_uuid + "' data-filename='" + obj[0].pro_image_name + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath + "'>";
			str += "</div>";
			
			uploadResult.html(str);
		});
	});
  
  </script>  
  
  <!-- 구매하기 -->
  <script type="text/javascript">
  	$(document).ready(function() {
	 		$("#write").click(() => {
				self.location = "/awesomejump/reviewRegister";
			});
	 		
	 		$('#goToBuy').click(() => {
	 			// ES6: let, const
	 			const option = $('#ProductOptionSearch option:selected').val();
	 			// '' : 옵션을 선택해 주세요가 선택되어 있음.			-> false 취급
	 			// '25': 옵션 넘버 25번인 옵션이 선택됨.				-> true 취급
	 			// '26': 옵션 넘버 26번인 옵션이 선택됨.				-> true 취급
	 			// ...
	 			const amount = Number($('#amount').val());
	 			const stock = Number($('#product_stock').val());
	 			
	 			// !(논리형 아닌 변수) :
	 			//    ! 뜻: isempty(...)
	 			//    즉, !option은 option이 비어있는지 확인하는 것.
	 			//	  (느낌표 있으니 비어 있으면 true, 아니면 false)
	 			if (!option) {	// '', [], NaN, null, undefined, ... false 취급
	 				alert('옵션을 선택해 주세요.');
	 				return;
	 			}
	 			if (amount > stock || amount < 0) {	// 이미 증/감 버튼에서 체크했지만. (프론트에서는) 최종적으로 확인.
	 				alert('상품 수량이 잘못 입력되었습니다.');
	 				return;
	 			}
	 			
	 			$('#buying_form').append('<input type="hidden" name="option_no" value="'
	 					+ option + '">');
	 			$('#buying_form').append('<input type="hidden" name="amount" value="'
	 					+ amount + '">');
	 			
	 			$('#buying_form').submit();	// 폼 전송(프론트 -> 백)
	 			// ∴ 백단에서는 반드시 검토("프론트에서 온 정보를 믿지 마라.")
	 		});
  	});
  </script>
  
<!-- TOP NAV 버튼 $('#moveBtn' + ...) 클릭, 스크롤 -->
<script type="text/javascript">
let topNavController = {
		initEventListener: () => {
			topNavController._initClickEventListener();
			topNavController._initScrollEventListener();
		}
		, canScrollAffect: true
		, _initClickEventListener: () => {
			const milis = 1200;
			
			var onclick = function (event, jQueryButton, jQueryTarget) {
				console.log('jQueryButton: ', jQueryButton);
		    	topNavController._modifyStyle(jQueryButton);
				topNavController._scrollify(jQueryTarget.offset().top, milis);
			};
			
		    $("#moveBtn1").click( (event) => onclick(event, $("#moveBtn1"), $('#tag1')) );
		    $("#moveBtn2").click( (event) => onclick(event, $("#moveBtn2"), $('#tag2')) );
		    $("#moveBtn3").click( (event) => onclick(event, $("#moveBtn3"), $('#tag3')) );
		    $("#moveBtn4").click( (event) => onclick(event, $("#moveBtn4"), $('#tag4')) );
		}
		, _initScrollEventListener: () => {
			$(window).scroll( () => {
				const affectedMarginTop = 10;
				const scrollTopRevised = $(document).scrollTop() + affectedMarginTop;
				
				// !important! 반드시 위에서 실행할 것
				if(!topNavController.canScrollAffect) {
					return;
				}
				
				if (scrollTopRevised < $('section.cat_product_area').offset().top) {
					$("#moveBtnGroup").slideUp(window.showDuration);
					return;
				}

				$("#moveBtnGroup").slideDown(window.showDuration);
				
				let selectedJQueryBtn = null;
				
				if (scrollTopRevised < $('#tag1').offset().top) {
					selectedJQueryBtn = null;
				} else if (scrollTopRevised < $('#tag2').offset().top) {
					selectedJQueryBtn = $('#moveBtn1');
				} else if (scrollTopRevised < $('#tag3').offset().top) {
					selectedJQueryBtn = $('#moveBtn2');
				} else if (scrollTopRevised < $('#tag4').offset().top) {
					selectedJQueryBtn = $('#moveBtn3');
				} else {
					selectedJQueryBtn = $('#moveBtn4');
				}
				
				topNavController._modifyStyle(selectedJQueryBtn);
			});
		}
		, _scrollify: (offsetTop, milis) => {
			topNavController.canScrollAffect = false;
			$('html, body').animate({scrollTop: offsetTop}, milis);
			setTimeout( () => {
				if (!topNavController.canScrollAffect) {
					topNavController.canScrollAffect = true;
				}
			}, milis);
		}
		, _modifyStyle: (jQueryButton) => {
			$('#moveBtnGroup a').removeClass('selectedTopNavBtn');
			jQueryButton && jQueryButton.addClass('selectedTopNavBtn');
			$('.underBar').hide(0);
			jQueryButton && jQueryButton.children('.underbar').show(window.showDuration);
		} 
}; // topNavController

$(document).ready(function(){
	
	// Initialize Event Listener
	topNavController.initEventListener();
	
	// (scroll 위치에 따라 top nav 가리고 시작하기)
	if ($(document).scrollTop() < $('section.cat_product_area').offset().top - 10) {
		$("#moveBtnGroup").hide();
	}
	
});// end of ready()

</script>

<!-- 리뷰 이미지 가져오기. -->
<script type="text/javascript">
var getReviewImageList = function() {
	let review_no_str = '';  
	let uploadResult = $("#uploadTumbResult");
	
	$('.loaded_review_no').each(function () {
		console.debug($(this).val());
		review_no_str += $(this).val() + ',';
	});
    
    console.debug(review_no_str);
    
    $.getJSON('/getProductAllReviewImageList', {'review_no_str':review_no_str}, function(arr){
        if (!arr) {
        	// 리뷰가 하나도 없는 경우.
        	return;
        }
		
		let crtReviewImageNo = -1;
		for (let i = 1; i < arr.length; i++) {
			if (arr[i].review_image_no != crtReviewImageNo) {
				crtReviewImageNo = arr[i].review_image_no;
				
				$('#uploadReviewResult_' + arr[i].review_no).attr('data-path', arr[i].review_image_path);
				$('#uploadReviewResult_' + arr[i].review_no).attr('data-filename', arr[i].review_image_name);
				let fileCallPath = encodeURIComponent(
						'/'
						+ arr[i].review_image_path.replace(/\\/g, '/')
						+ '/'
						/* + (UUID) + "_" */
						+ arr[i].review_image_name);
				
				console.debug('[리뷰 이미지] debug : ', fileCallPath);
				
				// FIXME 사이즈 안 함.
				$('#uploadReviewResult_' + arr[i].review_no).append('<img src="/display?fileName=' + fileCallPath + '">');
			}
		}
      });
}

$(document).ready(function() {
	// 반드시 리뷰 로드 후에 따로 실행(로드된 리뷰 목록에 의존하여 사진 호출)
	// (지금은 리뷰를 임시로 JSTL로 넣고 있어서 바로 사용 가능하지만)
	getReviewImageList();
});
</script>

<style>
/* FIMXE  TOP NAV 버튼이 선택되었을 때 스타일 */
.selectedTopNavBtn {
	border-width: 10px;
	height: 30px;
	box-shadow: inset 0 -1px 0 skyblue; 
	line-height: 21px;

}

</style>

  <style type="text/css">

	h1 {
		font-family: "NANUM";
		font-weight: bold;
		font-size: 60px;
	}
	h2{ 
		font-family: "NANUM";
		font-weight: bold;
		font-size: 60px;
	}
	
	h3{ /* 대분류 */
		font-family: "NANUM";
		font-weight: bold;
		font-size: 30px;
	}
	 
	h4{ /* 중분류 */
		font-family: "NANUM";
		font-weight: bold;
		font-size: 15px;
	}
	
  .card-body {
  	padding: 0 !important;
  	
  }

    p {
  font-family: 'NANUM';
  font-size: 15px;
  }
</style>

 <style media="screen">
      /*
        버튼은 화면 스크롤이 아무리 내려가도 절대위치로 항상 같은 위치에 있도록 하기 위해
        스타일을 지정해 준다.
      */
      .move_btn_container {
      	position: fixed;
      	display: flex;
      	flex-direction: row;
      	justify-content: space-between;
      	height: 50px;
      	width: 850px;
      	padding: 10px 50px 20px 50px;
      	background-color: white;
      	border: 1px solid skyblue;
      	left: 0px;
      	top: 10px;
      	margin: auto;
      	transform: translate(50%, 0%);
      	transition: 2s;
      	z-index: 2;
      }
      
      .move_btn_container div {
      	width: 100px;
      	height: 5px;
      	color: skyblue;
      	font-size: 20px;
      /* 	border:1px solid blue; */
      	z-index: 100;
      /* 	background-color: white; */
      }
    </style>


</head>

<body>
  
  <jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
	<div class="move_btn_container" id="moveBtnGroup" style="text-align: center; ">
		<a id="moveBtn1" href="#tag1">
			<p>상품설명</p>
			<div class="underBar"></div>
		</a>
		
		<a id="moveBtn2" href="#tag2">
			<p>리뷰</p>
			<div class="underBar"></div>
		</a>
		
		<a id="moveBtn3" href="#tag3">
			<p>문의</p>
			<div class="underBar"></div>
		</a>
		
		<a id="moveBtn4" href="#tag4">
			<p>추천 상품</p>
			<div class="underBar"></div>
		</a>
	</div>

<s:authentication property="principal" var="member"/>
  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>상품 상세 목록</h2>
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
							
							<div class="widgets_inner" style="cursor:pointer;">
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
								

						<!-- 검색  -->
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
     
      <div>
					<p style="height: 20px;">
						<!-- 빵부스러기  -->
						<c:forEach items="${categoryBrunch}" var="categoryBrunch">
						<c:if test="${categoryBrunch.level == '1'}">
							${categoryBrunch.cateName}
						</c:if>
						</c:forEach>
					</p>	

                <div class="single_product_text">
               
                <!-- 썸네일들 -->
					<div class="form_section">
					<div>
						<div class="form_section_title">
						</div>
						
						<div class="form_section_content" style="display: flex;direction: row; ">
							<div id="uploadTumbResult" style="width: 380px; margin-right: 30px;"><br></div>
							
					<div style="margin-left: 10px;">
					 <div  style="display: flex;direction: row;">
					 
					 <h4 style="font-size: 30px;">${mainProduct.product_name}   
					 <button class="interestInsertMember" value="${mainProduct.product_no}" id="interest_btn_${mainProduct.product_no}" style="background-color:transparent; margin-top: 50px; z-index: 1; border-radius: 50px;">
							<c:choose>
								<c:when test="${mainProduct.product_interest_yn eq 'n'}">♡</c:when>
								<c:when test="${mainProduct.product_interest_yn eq 'y'}"><span style="color: red;">
								♥
								</span> 
								</c:when>
							</c:choose>
					</button> 
						</h4>
						
						</div>
					   <br>
	               
	                <div class="star-rating"  >
						<span style="width:${mainProduct.review_grade * 20.0}%" ></span> 
					</div>
	               <div>재고 : ${mainProduct.product_stock}
	               </div>
	               <div><strong>가격 : <fmt:formatNumber value="${mainProduct.product_price}" pattern="#,###"/> 원</strong></div>
					
	                <div>   
	                    <button type="button"  id="amount_minus_btn" class="detail-btn"
	                    		style="border-radius: 50px; border:1px solid blue; background-color: white;">-</button>
                    	<input type="text" name="amount" value="1" readonly="readonly" style="text-align:center;" id="amount" />
	                    <button type ="button"  id="amount_plus_btn" class="detail-btn"
	                    		style="border-radius: 50px; border:1px solid blue; background-color: white;">+</button>
                	</div>
	                
	               <div>
						총 액 : <input type="text" name="sum" size="11" readonly id="price" value="${mainProduct.product_price}" pattern="#,###" > 원 <br><br>
             <select id="ProductOptionSearch" name="OptionSerach">
             	<option value="">옵션을 선택해 주세요</option>
				  <c:forEach var="selectProductOption" items="${selectProductOption}" >
				    <option value="${selectProductOption.product_option_no}">${selectProductOption.product_option_color} ${selectProductOption.product_option_size}</option>
				  </c:forEach>
			</select>
			<br><br>
                </div>
              <div>
              <br>
             <div>
	              <button id="insertProduct" class="detail-btn"
	              		style="width:100px;height:50px; border:1px solid blue; border-radius: 10px; background-color: white;" > 상품담기 </button>
	              &nbsp;&nbsp;&nbsp;
	              <button id="goToBuy" class="detail-btn"
	              		style="width:100px;height:50px; border:1px solid blue; border-radius: 10px; background-color: white;"> 구매하기 </button>
	              <form id="buying_form" action="/buying" method="post"
	              		style="display: none;">
	              	<input type="hidden" name="product_no" value="${mainProduct.product_no}">
	              	<s:csrfInput/>
	              </form>
             </div>
              
              </div>
              </div>
              </div>
						</div>
					
					
				<b><hr/></b>
						
					 <a id="tag1" > <!-- 상세상품 상단으로 가지는 id  -->
					<!-- 상품 이미지들 -->
					<div class="form_section">
						<div class="form_section_title">

						</div>
						
						<div class="form_section_content">
							<div id="uploadResult"><br></div>
							
						</div>
					</div>
						</a> <!-- 상세상품 상단으로 가지는 id <a>의 끝 -->
					<div>

              <div id="tag2" style="margin-top: 20px;">
              <p style="font-weight: bold; font-size: 20pt;">리뷰 (${reviewCount}) 건</p>
              	<%-- FIXME (1페이지만 가져오도록 하였음.) 시연용으로 잠깐 보여줄 때만 사용할 것.
              	--%>
              	<div class="review-container" style="display: flex; flex-direction: column;">
	              	<c:forEach var="review" items="${reviewList}">
		              	
		              	<!-- 리뷰이미지들 -->
	              		<div class="review-card"
	              				style="display: flex; flex-direction: column; margin: 10px;
	              						width: 500px;
	              						box-shadow: 0 14px 28px rgba(0,0,0,0.15), 0 10px 10px rgba(0,0,0,0.12);">
	              			<div class="review-name-tag" style="display: flex; flex-direction: row; padding: 10px; justify-content: space-between;">
	              				<div class="review-writer" style="font-weight: bold;">${review.review_name}</div>
	              				<div class="review-grade" style="width: 80px; padding-left: 10px; color: #0975ff; text-shadow:1px 2px 5px rgba(0,0,0,0.3);">
	              					<c:forEach begin="0" end="${review.review_grade}" >★</c:forEach>
	              				</div>
	              			</div>
							<div id="uploadReviewResult_${review.review_no}" class="form_section_content"
	 								style="width: 100px; margin-right: 30px; display: flex; flex-direction: row; padding: 10px;">
							</div>
              				<div class="review-content" style="padding: 10px;">
	              				<!-- XSS 방지 -->
	              				<c:out value="${review.review_content}" />
              				</div>
							<input type="hidden" class="loaded_review_no" value="${review.review_no}">
	              		</div>
	              	</c:forEach>
              	</div>
              </div>
              <br><br>
              
              <i id="tag3">
	              <div class="row">
	              	<div class="col-lg-12">
		              <div class="panel panel-default">
			              <div class="panel-heading">
			              	<i class="fa fa-comments fa-fw"></i> 문의
			              		<button id="addQnaBtn" > 문의 등록</button>
			              </div>
			              <div class="panel-body">
			              	<ul class="chat">
			              		<li class="left clearfix" data-pro_qna_no="6">
			              			<div>
			              				<div class="header">
			              					<strong class="primary-font">user00</strong>
			              					<small class="pull-right text-muted">2021-01-01 13:13</small>
			              				</div>
			              				<p>Good job!</p>
			              			</div>
			              		</li>
			              	</ul>
			              </div>
		              </div>
	              	</div>
	              </div> 
              </i>
    </div>
     
     <!-- 문의 모달창 -->
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     	<div class="modal-dialog">
     		<div class="modal-content">
     			<div class="modal-header">
     				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
     				<h4 class="modal-title" id="myModalLabel">문의 등록</h4>
     			</div>
     			<div class="modal-body">
     				<div class="form-group">
     					<label>작성자 번호</label>
     					<input class="form-control" name="mem_no" value="11">
     				</div>
     				<div class="form-group">
     					<label>카테고리</label>
     					<input class="form-control" name="pro_qna_category" value="상품문의">
     				</div>
     				<div class="form-group">
     					<label>문의 제목</label>
     					<input class="form-control" name="pro_qna_title" value="NEW QNA!!!">
     				</div>
     				<div class="form-group">
     					<label>문의 내용</label>
     					<input class="form-control" name="pro_qna_content" value="NEW QNA CONTENT!!!">
     				</div>
     				<div class="form-group">
     					<label>작성자</label>
     					<input class="form-control" name="pro_qna_name" value="test!!!">
     				</div>
     				<div class="form-group">
     					<label>작성일</label>
     					<input class="form-control" name="pro_qna_date" value="">
     				</div>
     			</div>
     			<div class="modal-footer">
     				<s:authorize access="hasRole('ROLE_ADMIN')">
     					<button id="modalReplyBtn" type="button" onclick="location.href='/admin/reply'">답글</button>
     				</s:authorize>
     				<button id="modalModBtn" type="button">수정</button>
     				<button id="modalRemoveBtn" type="button">삭제</button>
     				<button id="modalCloseBtn" type="button" data-dismiss="modal">닫기</button>
     				<button id="modalRegisterBtn" type="button" data-dismiss="modal">등록</button>
     			</div>
     		</div>
     	</div>
     </div>
    
    <!-- 답글 모달 -->
<%-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div> --%>


    </div>
    </div>
    </div>
  </section>
  <!--================End Category Product Area =================-->
<a style="display:scroll;position:fixed;bottom:50px;right:50px; " href="#" title="맨 위로">▲ 맨 위로</a> 
  <!-- 추천 상품 -->
<section class="product_list best_seller">
    <div class="container">
   
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="section_tittle text-center">
            <h2>
            <a id="tag4" >
              추천 상품 
            </a>
            </h2>
          </div>
        </div>
      </div>
      <div class="row align-items-center justify-content-between">
        <div class="col-lg-12">
        	<%-- FIXME 상품 개수 4개 미만일 때 prev | next 버튼 안 뜨는데(carousel) 문제 되면 수정. --%>
          <div class="best_product_slider owl-carousel">
      		<c:forEach items="${selectRecommendProduct}" var="product" >
              <a href="/memDetailProduct?product_no=${product.product_no}" style="width: 250px;">
				<div class="form_section" >
					<div class="single_product_item">
						<div id="recommend_card_${product.product_no}" >
							<br> 
							<!-- src="/upload\product\2021\08\02/d97b3fa9-a69c-40dd-9206-6837fab60cbb_코코 원목 6인용 식탁 세트-1.jpg" -->
							<input type="hidden" value="/upload${product.imageList[0].pro_image_path}/${product.imageList[0].pro_image_uuid}_${product.imageList[0].pro_image_name}">
							<c:choose>
							<%-- FIXME (테스트) 여기 에러가 뜨면, null은 아닌데 사이즈가 0인 리스트가 온 건 아닌지 확인 --%>
								<c:when test="${not empty product.imageList}">
								<!-- pro_image_path -->
									<img id="recommend_${product.product_no}"
										 src="/upload${product.imageList[0].pro_image_path}/${product.imageList[0].pro_image_uuid}_${product.imageList[0].pro_image_name}"
										 style="width: 250px; border-radius: 20px;" >
								</c:when>
								<c:when test="${empty product.imageList}">
									<img id="recommend_${product.product_no}"
										 src="/resources/admin/img/noImage.png"
										 style="width: 250px; border-radius: 20px;" >
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="single_product_text">
				  <h3>${product.product_name }</h3>
				  <h3> ${product.product_price} 원</h3>
				  <h3>리뷰(${product.review_cnt})</h3>
				  <h3>★ ${product.review_grade}</h3>
					
				</div>
				<input type="hidden" class="selected_product_no" value="${product.product_no}">
              </a>
           </c:forEach>
            </div>
          </div>
        </div>
      </div>
  </section> 
  <!-- product_list part end-->

  <jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp"/>

 <input type="hidden" value="${mainProduct.product_no}" id="product_no">
 <input type="hidden" value="${mainProduct.product_stock}" id="product_stock">
 <input type="hidden" value="${mainProduct.product_price}" id="product_price">
</body>
</html>