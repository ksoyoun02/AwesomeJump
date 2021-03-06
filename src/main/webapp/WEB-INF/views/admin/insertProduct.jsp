<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <s:csrfMetaTags/>
  
  <title>상품 등록</title>
  
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  <%-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script> --%>
  <script type="text/javascript" src="/resources/admin/vendor/jquery/jquery.min.js"></script>
  
  <script defer src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script defer src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts -->
  <script defer src="/resources/admin/js/sb-admin-2.min.js"></script>

	
	<style type="text/css">
		.select_img img { margin: 20px 0;}
	</style>
	<style type="text/css">
		#result_card img{
			max-width: 100%;
		    height: auto;
		    display: block;
		    padding: 5px;
		    margin-top: 10px;
		    margin: auto;	
		}
		#result_card {
			position: relative;
		}
		.imgDeleteBtn{
		    position: absolute;
		    top: 0;
		    right: 5%;
		    background-color: #ef7d7d;
		    color: wheat;
		    font-weight: 900;
		    width: 30px;
		    height: 30px;
		    border-radius: 50%;
		    line-height: 26px;
		    text-align: center;
		    border: none;
		    display: block;
		    cursor: pointer;	
		}

	</style>
	
	<script type="text/javascript">
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	console.log(jsonData.length);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	$(document).ready(function() {
	// 컨트롤러에서 데이터 받기
	
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
	  cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
	  cate1Arr.push(cate1Obj);
	 }
	}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var category = "";
	
	for(var i = 0; i < cate1Arr.length; i++) {
	      category += "<option value='" + cate1Arr[i].cateCode + "'>"
	      + cate1Arr[i].cateName + "</option>";
	}
	$("#category1").append(category);
		
	});
	
	$(document).on("change", "select.category1", function() {
	
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		 if(jsonData[i].level == "2") {
			cate2Obj = new Object();  //초기화
		  cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
		  cate2Arr.push(cate2Obj);
		}
	}
	
	var cate2Select = $("select.category2");
	
	cate2Select.children().remove();
	
	$("option:selected", this).each(function() {
		
		var selectVal = $(this).val();
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		for(var i = 0; i < cate2Arr.length; i++){
			if(selectVal == cate2Arr[i].cateCodeRef){
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			      + cate2Arr[i].cateName + "</option>");
			}
		}
	});
	});
	
	$(document).on("change", "select.category2", function() {
	
	var cate3Arr = new Array();
	var cate3Obj = new Object();
	// 3차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		 if(jsonData[i].level == "3") {
			cate3Obj = new Object();  //초기화
		  cate3Obj.cateCode = jsonData[i].cateCode;
			cate3Obj.cateName = jsonData[i].cateName;
			cate3Obj.cateCodeRef = jsonData[i].cateCodeRef;
		  cate3Arr.push(cate3Obj);
		}
	}
	
	var cate3Select = $("select.category3");
	
			cate3Select.children().remove();
		
		$("option:selected", this).each(function() {
			
	var selectVal = $(this).val();
			cate3Select.append("<option value='" + selectVal + "'>전체</option>");
	
	for(var i = 0; i < cate3Arr.length; i++){
		if(selectVal == cate3Arr[i].cateCodeRef){
			cate3Select.append("<option value='" + cate3Arr[i].cateCode + "'>"
		      + cate3Arr[i].cateName + "</option>");
			}	
		}
		
	});
	});
	
	$(document).ready(function() {
		// 상품 크기 추가 메서드
		$('#btnAdd').click (function() {
			
			$('.addInput').append(
					'<input type="text" name="product_option_size" id="product_option_size" placeholder="상품 크기">\
					<button type="button" class="btnRemove">x</button><br>'
			);
		
		$('.btnRemove').on('click', function() {
																	// 여기서 (this) 는 '.btnRemove'를 가리킨다.
			$(this).prev().remove();		// .prev()로 input tag를 가리키고 remove()한다.
			$(this).next().remove();		// <br> 삭제
			$(this).remove();						// 버튼 삭제
		});
	});
		
	// 색상 추가 메서드
	$('#colorAdd').click(function() {
		$('.colorAddInput').append(
				'<input type="text" name="product_option_color" id="product_option_color" placeholder="기타 색상">\
				<button type="button" class="colorRemoveBtn">x</button><br>'
		);
	
	$('.colorRemoveBtn').on('click', function() {
																// 여기서 (this) 는 '.btnRemove'를 가리킨다.
		$(this).prev().remove();		// .prev()로 input tag를 가리키고 remove()한다.
		$(this).next().remove();		// <br> 삭제
		$(this).remove();						// 버튼 삭제
		});
	});
	});
	
	function check() {
		
		if($('#product_name').val() == ""){
			alert("상품명을 입력해주세요.");
			$('#product_name').val("").focus();
			return false;
		} else if($('#product_price').val() == ""){
			alert("상품 가격을 입력해주세요.");
			$('#product_price').val("").focus();
			return false;
		} else if($('#product_content').val() == ""){
			alert("상품 설명을 입력해주세요.");
			$('#product_content').val("").focus();
			return false;
		} else if($('#product_stock').val() == 0){
			alert("상품 재고를 1개 이상 입력해주세요.");
			$('#product_stock').val("").focus();
			return false;
		} else if($('#product_texture').val() == ""){
			alert("상품 재질을 입력해주세요.");
			$('#product_texture').val("").focus();
			return false;
		} else if($('input:checkbox[name="product_option_color"]').is(":checked")==false){
			alert("상품 색상을 1개 이상 선택해주세요.");
			return false;
		} else if($('#product_option_size').val() == ""){
			alert("상품 크기를 입력해주세요.");
			$('#product_option_size').val("").focus();
			return false;
		} else if($('#product_point').val() == ""){
			alert("상품 포인트를 입력해주세요.");
			$('#product_point').val("").focus();
			return false;
		}else if($('#product_price').val() < 0){
			alert("상품 가격은 1원 이상 입력바랍니다.");
			return false;
		} else if($('#product_stock').val() < 0){
			alert("상품 재고는 1개 이상 입력바랍니다.");
			return false;
		} else if($('#product_point').val() < 0){
			alert("상품 포인트는 1 포인트 이상 입력바랍니다.");
			return false;
		} else if($('#product_thumb_img').val() == 0){
			alert("상품 이미지를 등록해주세요.");
			return false;
		} else if($('#category1').val() == 0){
			alert("대분류를 선택해주세요.");
			return false;
		} else if($('#category2').val() == 0){
			alert("중분류를 선택해주세요.");
			return false;
		} 
	
		return true;
		
	}
	
		$(document).ready(function() {
			$("#product_name").blur(function() {
				var name = $("#product_name").val();
				var reName = $.trim(name);
				$("#product_name").val(reName);
			});
			$("#product_price").blur(function() {
				var name = $("#product_price").val();
				var reName = $.trim(name);
				$("#product_price").val(reName);
			});
			$("#product_stock").blur(function() {
				var name = $("#product_stock").val();
				var reName = $.trim(name);
				$("#product_stock").val(reName);
			});
			$("#product_texture").blur(function() {
				var name = $("#product_texture").val();
				var reName = $.trim(name);
				$("#product_texture").val(reName);
			});
			$("#product_option_size").blur(function() {
				var name = $("#product_option_size").val();
				var reName = $.trim(name);
				$("#product_option_size").val(reName);
			});
			$("#product_point").blur(function() {
				var name = $("#product_point").val();
				var reName = $.trim(name);
				$("#product_point").val(reName);
			});
		});
	</script>
	
	
	
	</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <%-- <jsp:include page="/WEB-INF/templates/admin/sidebar.jsp"/> --%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">

        <jsp:include page="/WEB-INF/templates/admin/topbar.jsp"/>

        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800" align="center">상품등록</h1>
      <form action="/admin/insertProduct" method="post" role="from" autocomplete="off" id="insertProductForm" onsubmit="return check();">
  			<s:csrfInput/>
  			<div align="center">
	  			<table>
		  			<tr>
		  				<th><label>상품명</label></th>
		  				<td><input type="text" id="product_name" name="product_name"/></td>
		  			</tr>
		  			<tr>
		  				<th><label>상품가격</label></th>
		  				<td><input type="number" id="product_price" name="product_price" value="0"/>원</td>
		  			</tr>
		  			<tr>
		  				<th><label>상품설명</label></th>
		  				<td><textarea rows="5" cols="50" id="product_content" name="product_content"></textarea></td>
		  			</tr>
		  			<tr>
		  				<th><label>상품재고</label></th>
		  				<td><input type="number" id="product_stock" name="product_stock" value="0"/>개</td>
		  			</tr>
		  			<tr>
		  				<th><label>상품재질</label></th>
		  				<td><input type="text" id="product_texture" name="product_texture"/></td>
		  			</tr>
		  			<tr>
		  				<th><label>상품색상</label></th>
		  				<td>
		  					<input type="checkbox" name="product_option_color" value="빨강색"/>빨강색
								<input type="checkbox" name="product_option_color" value="노랑색"/>노랑색
								<input type="checkbox" name="product_option_color" value="분홍색"/>분홍색
								<input type="checkbox" name="product_option_color" value="오렌지색"/>오렌지색
								<input type="checkbox" name="product_option_color" value="초록색"/>초록색
								<input type="checkbox" name="product_option_color" value="파랑색"/>파랑색
								<input type="checkbox" name="product_option_color" value="갈색"/>갈색
								<input type="checkbox" name="product_option_color" value="흰색"/>흰색
								<input type="checkbox" name="product_option_color" value="보라색"/>보라색
								<input type="checkbox" name="product_option_color" value="회색"/>회색
								<input type="checkbox" name="product_option_color" value="검정"/>검정<br>
								<input type="text" name="product_option_color" placeholder="기타 색상"><button type="button" id="colorAdd" class="btn btn-primary">+</button>
								<div class="colorAddInput">
								
								</div>
							</td>
		  			</tr>
		  			<tr>
		  				<th><label>상품크기</label></th>
		  				<td>
		  				<input type="text" id="product_option_size" name="product_option_size" placeholder="상품 크기"/><button type="button" id="btnAdd" class="btn btn-primary">+</button>
		  				<div class="addInput">
		  				
		  				</div>
		  				</td>
		  			</tr>
		  			<tr>
		  				<th><label>포인트</label></th>
		  				<td><input type="number" id="product_point" name="product_point" value="0"/>P</td>
		  			</tr>
		  			<tr>
		  				<th class="filebox"><label>이미지 추가</label></th>
		  				<td>
		  					<input type="file" id="product_thumb_img" name="uploadFile"  multiple="multiple"/>
			  				<div id="uploadResult">
			  				
			  				</div></td>
		  			</tr>
		  			<tr>
		  				<th><label>1차 분류</label></th>
		  				<td>
			  				<select class="category1" id="category1" name="category_main">
					  			<option value="">전체</option>
					  		</select>
				  		</td>
		  			</tr>
		  			<tr>
		  				<th><label>2차 분류</label></th>
		  				<td>
			 					<select class="category2" id="category2" name="category_mid">
				  				<option value="">전체</option>
				  			</select>
		  				</td>
		  			</tr>
		  			<tr>
		  				<th><label>3차 분류</label></th>
		  				<td>
		  					<select class="category3" id="category3" name="category_sub">
				  				<option value="">전체</option>
				  			</select>
		  				</td>
		  			</tr>
		  			<tr>
		  				<th></th>
		  				<td></td>
		  			</tr>
		  		</table>
	  			<script type="text/javascript" src="/resources/admin/js/product_img.js"></script>
		  		<button type="submit" id="submitBtn" class="btn btn-primary">등록</button>
		  		<button type="reset" onclick="history.go(-1);" class="btn btn-danger">취소</button>
	  		</div>
	   	</form>
	   	
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->



      <jsp:include page="/WEB-INF/templates/admin/footer.jsp"/>

    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top"> 
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="/WEB-INF/templates/admin/logoutModal.jsp"/>
</body>
</html>