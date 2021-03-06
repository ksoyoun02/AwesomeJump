<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>AwesomeJump</title>
  
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <script defer src="/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script defer src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script defer src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script defer src="/resources/admin/vendor/chart.js/Chart.min.js"></script>
  <!-- Custom scripts -->
  <script defer src="/resources/admin/js/sb-admin-2.min.js"></script>
  <script defer src="/resources/admin/js/demo/chart-area-demo.js"></script>
  <script defer src="/resources/admin/js/demo/chart-pie-demo.js"></script>
  
  <style type="text/css">
  	#title {
  		font-size: 50px;
  	}
  	
  	a:hover {
  		color: red;
  	}
  </style>
  

</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <jsp:include page="/WEB-INF/templates/admin/topbar.jsp"/>
  	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin" style="display: none;">
	    <div class="sidebar-brand-icon rotate-n-15" style="margin-top: 20px; size: 30px;">
	      <i class="fas fa-laugh-wink"></i>
	    </div>
	    <div class="sidebar-brand-text mx-3"  style="margin-top: 20px; font-size: 30px;">
	      AwesomeJump
	    </div>
  	</a>
  <div id="wrapper">
  
   <%--  <jsp:include page="/WEB-INF/templates/admin/sidebar.jsp"/> --%>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column" style="background-color: white;">
		  <h1 align="center" style="margin: 100px 100px 100px 100px; color: gray;">???????????????. ????????????</h1>
		  <div align="center">
			  <div class="first"  style="float: left; width: 33%; color: blue;">
			   	<div style="border: 3px solid blue; width: 220px; height: 180px; border-radius: 20px;"><i class="fas fa-users fa-10x"></i></div>
			   	<div style="margin-top: 20px; color: black; font-size: 30px;"><a class="nav-link" href="/admin/members">????????????</a></div>
			  </div>
			  <div style="float: left; width: 33%; color: blue;">
		    	<div style="border: 3px solid blue; width: 220px; height: 180px; border-radius: 20px;"><i class="fas fa-book-open fa-10x"></i></div>
		    	<div style="margin-top: 20px; color: black; font-size: 30px;"><a class="nav-link" href="/admin/listProduct">????????????</a></div>
			  </div>
			  <div style="float: left; width: 33%; color: blue; margin-bottom: 100px;">
		    	<div style="border: 3px solid blue; width: 220px; height: 180px; border-radius: 20px;"><i class="fas fa-barcode fa-10x"></i></div>
		    	<div style="margin-top: 20px; color: black; font-size: 30px;"><a class="nav-link" href="/admin/insertProduct">????????????</a></div>
			  </div>
		    <jsp:include page="/WEB-INF/templates/admin/footer.jsp"/>
	    </div>
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