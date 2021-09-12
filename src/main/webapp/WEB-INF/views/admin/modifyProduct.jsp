<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <s:csrfMetaTags/>
  
  
  <title>상품 수정</title>
  
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
	
	/* 상품 이미지 css */
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
	
	<!-- 상품 이미지 수정 스크립트 -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			/* 기존 이미지 출력 */ 
			
			let product_no = '<c:out value="${modify.product_no}"/>';
			let uploadResult = $("#uploadResult");
			
			$.getJSON("/admin/getImageList", {product_no : product_no}, function(arr) {
				
				if(arr.length === 0) {
					
					let str = "";
					str += "<div id='result_card'>";
					str += "<img src='/resources/admin/img/noImage.png'>";
					str += "</div>";
					
					uploadResult.html(str);
					
					return;
					
				}
				
				let str = "";
				let obj = arr;
				
				for(let i = 0; i < obj.length; i++){
					
					let fileCallPath = encodeURIComponent(obj[i].pro_image_path.replace(/\\/g, '/') + "/" +  obj[i].pro_image_uuid + "_" + obj[i].pro_image_name);
					str += "<div id='result_card'";
					str += "data-path='" + obj[i].pro_image_path + "' data-uuid='" + obj[i].pro_image_uuid + "' data-filename='" + obj[i].pro_image_name + "'";
					str += ">";
					str += "<img src='/display?fileName=" + fileCallPath + "'>";
					str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
					str += "<input type='hidden' name='imageList["+ i +"].pro_image_name' value='" + obj[i].pro_image_name + "'>";
					str += "<input type='hidden' name='imageList["+ i +"].pro_image_uuid' value='" + obj[i].pro_image_uuid + "'>";
					str += "<input type='hidden' name='imageList["+ i +"].pro_image_path' value='" + obj[i].pro_image_path + "'>";
					str += "<input type='hidden' name='imageList["+ i +"].pro_image_type' value='" + obj[i].pro_image_type + "'>";
					str += "</div>";
					
					uploadResult.html(str);
				}
				
			});
			
			
				var CSRFheader = $("meta[name='_csrf_header']").attr('content');
				var CSRFtoken = $("meta[name='_csrf']").attr('content');
		
				// 이미지 업로드
				$("input[type='file']").on("change", function(){
					
					// 이미지 존재 시 삭제
					if($("#result_card").length > 0) {
						deleteFile();
					}
					
					let formData = new FormData();
					let fileInput = $('input[name="uploadFile"]');
					
					let fileList = fileInput[0].files;
					let fileObj = fileList[0];
					
					console.log("fileList : " + fileList);
					console.log("fileObj : " + fileObj);
					
					console.log("fileName : " + fileObj.name);
					console.log("fileSize : " + fileObj.size);
					console.log("fileType : " + fileObj.type);
					
					if(!fileCheck(fileObj.name, fileObj.size)){
						return false;
					} 
					
					for(let i = 0; i < fileList.length; i++){
						formData.append("uploadFile", fileList[i]);
					}
					
					$.ajax({
						url: '/admin/uploadProductImg',
						processData: false,
						contentType: false,
						data: formData,
						beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
						type: 'POST',
						dataType: 'json',
						success : function(result) {
							console.log("ajax return result value : " + result);
							showUploadImage(result);
						},
						error : function(result) {
							alert("이미지 파일만 첨부 가능합니다.");
						}
					});
					
				});
				
				/* let regex = new RegExp("/\.(bmp|gif|jpg|jpeg|png)$/"); */
				let regex = new RegExp("(.*?)\.(jpg|png)$");
				let maxSize = 10 * 1024 * 1024;
				
				function fileCheck(fileName, fileSize) {
					if(fileSize >= maxSize) {
						alert("파일 사이즈 초과");
						return false;
					}
					if(!regex.test(fileName)){
						alert("해당 종류의 파일은 업로드할 수 없습니다.");
						return false;
					}
					
					return true;
				}
				
				// 이미지 출력
				function showUploadImage(uploadResultArr) {
					
					// 전달받은 데이터 검증
					if(!uploadResultArr || uploadResultArr.length == 0) {return}
					
					let uploadResult = $("#uploadResult");
					
					let obj = uploadResultArr;
					
					console.log("showUploadImage uploadResultArr : " + obj.pro_image_name);
					
					let str = "";
					
					for(let i = 0; i < obj.length; i++){
						
					str = "";
						
  				let fileCallPath = encodeURIComponent(obj[i].pro_image_path.replace(/\\/g, '/') + "/" + obj[i].pro_image_uuid + "_" + obj[i].pro_image_name);
						
						str += "<div id='result_card'>";
						str += "<img src='/display?fileName=" + fileCallPath +"'>";
						str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
						str += "<input type='hidden' name='imageList["+ i +"].pro_image_name' value='" + obj[i].pro_image_name + "'>";
						str += "<input type='hidden' name='imageList["+ i +"].pro_image_uuid' value='" + obj[i].pro_image_uuid + "'>";
						str += "<input type='hidden' name='imageList["+ i +"].pro_image_path' value='" + obj[i].pro_image_path + "'>";
						str += "<input type='hidden' name='imageList["+ i +"].pro_image_type' value='" + obj[i].pro_image_type + "'>";
						str += "</div>";
						
					uploadResult.append(str);
					}
				}
				
				// 이미지 삭제 버튼 클릭 시
				$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
					
					deleteFile();
					
				});
			
				// 파일 삭제 메서드
				function deleteFile() {
						
					$("#result_card").remove();
					
				}
			});
  	</script>

  	<script type="text/javascript">
  		window.onload = function check() {
  			var jsonData = JSON.parse('${optionColor}');
  			var checkCount = $('input:checkbox[name="product_option_color"]').length;
  			var str = "";
  			console.log(jsonData);
  			for(var i = 0; i < jsonData.length; i++){
  				var color = jsonData[i].product_option_color;
  				/* alert(color); */
  				/* console.log("찾은 값 : " + document.getElementById(color).value); */
  				
  				if(document.getElementById(color) == null){
/*   					str += "<input type='text' name='product_option_color' value='" + color + "'/>"
						+ "<button type='button' class='colorAdd'>추가</button><br>"; */
  					str += "<input type='text' name='product_option_color' value='" + color + "' readonly='readonly'/>"
  					    + "<button type='button' class='colorRemoveBtn'>-</button><br>";
  				}
  				else {
  					document.getElementById(color).checked = true;
  				}
						//alert(document.getElementById(color).value);
  			}
		  			$('#etcColor').append(str);
  			}
  		
  		$(document).ready(function() {
  			// 상품 크기 추가 메서드
  			$('.btnAdd').click (function() {
  				
  				$('.addInput').append(
  						'<input type="text" name="product_option_size" id="product_option_size" value="">\
  						<button type="button" class="btnRemove">-</button><br>'
  				);
  			
  			$('.btnRemove').on('click', function() {
  																		// 여기서 (this) 는 '.btnRemove'를 가리킨다.
  				$(this).prev().remove();		// .prev()로 input tag를 가리키고 remove()한다.
  				$(this).next().remove();		// <br> 삭제
  				$(this).remove();						// 버튼 삭제
  			});
  		});
  			
  			
  		// 기타 색상 추가 메서드
  		$('.colorAdd').click(function() {
  			$('#etcColor').append(
  					'<input type="text" name="product_option_color" id="product_option_color" placeholder="기타 색상">\
  					<button type="button" class="colorRemoveBtn">-</button><br>'
  			);
  		
  		$('.colorRemoveBtn').on('click', function() {
  																	// 여기서 (this) 는 '.btnRemove'를 가리킨다.
  			$(this).prev().remove();		// .prev()로 input tag를 가리키고 remove()한다.
  			$(this).next().remove();		// <br> 삭제
  			$(this).remove();						// 버튼 삭제
  			
  			});
  		});
  	});
  		
  		
  	// 상품 수정 유효성 검사
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
		} else if($('#product_price').val() < 0){
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
          <h1 class="h3 mb-4 text-gray-800">상품수정</h1>
      <form action="/admin/modifyProduct" method="post" role="from" autocomplete="off" id="form" onsubmit="return check();">
  			<s:csrfInput/>
  			<table>
	  			<tr>
	  				<th><label>상품명</label></th>
	  				<td><input type="text" id="product_name" name="product_name" value="${modify.product_name }" /></td>
	  			</tr>
	  			<tr>
	  				<th><label>상품가격</label></th>
	  				<td><input type="number" id="product_price" name="product_price" value="${modify.product_price }"/>원</td>
	  			</tr>
	  			<tr>
	  				<th><label>상품설명</label></th>
	  				<td><input type="text" id="product_content" name="product_content" value="${modify.product_content }"/></td>
	  			</tr>
	  			<tr>
	  				<th><label>상품재고</label></th>
	  				<td><input type="number" id="product_stock" name="product_stock" value="${modify.product_stock }"/>개</td>
	  			</tr>
	  			<tr>
	  				<th><label>상품재질</label></th>
	  				<td><input type="text" id="product_texture" name="product_texture" value="${modify.product_texture }"/></td>
	  			</tr>
	  				<tr>
							<th>등록된 색상</th>
							<th>등록된 크기</th>
						</tr>
							<c:forEach items="${modifyOption }" var="defaultOption">
								<tr>
									<td>
											<input type="text" value="${defaultOption.product_option_color }" disabled="disabled">&nbsp;
									</td>
									<td>
											<input type="text" value="${defaultOption.product_option_size }" disabled="disabled">
									</td>
								</tr>
							</c:forEach>
	  			<tr>
	  				<th><label>상품색상</label><button type='button' class='colorAdd'>+</button><br></th>
	  				<td>
	  					<input type="checkbox" name="product_option_color" id="빨강색" value="빨강색"/>빨강색
							<input type="checkbox" name="product_option_color" id="노랑색" value="노랑색"/>노랑색
							<input type="checkbox" name="product_option_color" id="분홍색" value="분홍색"/>분홍색
							<input type="checkbox" name="product_option_color" id="오렌지색" value="오렌지색"/>오렌지색
							<input type="checkbox" name="product_option_color" id="초록색" value="초록색"/>초록색
							<input type="checkbox" name="product_option_color" id="파랑색" value="파랑색"/>파랑색
							<input type="checkbox" name="product_option_color" id="갈색" value="갈색"/>갈색
							<input type="checkbox" name="product_option_color" id="흰색" value="흰색"/>흰색
							<input type="checkbox" name="product_option_color" id="보라색" value="보라색"/>보라색
							<input type="checkbox" name="product_option_color" id="회색" value="회색"/>회색
							<input type="checkbox" name="product_option_color" id="검정" value="검정"/>검정<br>
							<div id="etcColor">
						
							</div>
	  				</td>
	  			</tr>
	  			<tr>
	  				<th><label>상품크기</label><button type="button" class="btnAdd">+</button></th>
	  				<td>
	  					<c:forEach items="${modifyOption }" var="option">
	  				<div id="productOption">
		  				<input type="text" id="product_option_size" name="product_option_size" value="${option.product_option_size }"/>
		  				<button type="button" class="btnRemove">-</button>
	  				</div>
	  			</c:forEach>
	  				<div class="addInput">
	  				</div>
	  				</td>
	  			</tr>
	  			<tr>
	  				<th><label>포인트</label></th>
	  				<td><input type="number" id="product_point" name="product_point" value="${modify.product_point }"/>P</td>
	  			</tr>
	  			<tr>
	  				<th><label>상품 이미지</label></th>
	  				<td>
	  					<input type="file" id="fileItem" name="uploadFile" style="height: 30px;" multiple="multiple"/>
	  					<div id="uploadResult">
	  					
	  					</div>
	  				</td>
	  			</tr>
	  		</table>
  			
  			<input type="hidden" name="product_no" id="product_no" value="${modify.product_no }">
  			<input type="hidden" name="category_main" id="category_main" value="${modify.category_main }">
  			<input type="hidden" name="category_mid" id="category_mid" value="${modify.category_mid }">
  			<input type="hidden" name="category_sub" id="category_sub" value="${modify.category_sub }">
		  	<br>
	  		<button type="submit" class="btn btn-primary">확인</button>
	  		<button type="reset" onclick="history.go(-1);" class="btn btn-danger">취소</button>
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