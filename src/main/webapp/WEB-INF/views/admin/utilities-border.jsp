<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>SB Admin 2 - Border Utilities</title>
  
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  
  <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts -->
  <script src="/resources/admin/js/sb-admin-2.min.js"></script>
</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
<jsp:include page="/WEB-INF/templates/admin/sidebar.jsp"/>
    

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">

        <jsp:include page="/WEB-INF/templates/admin/topbar.jsp"/>

        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-1 text-gray-800">Border Utilities</h1>
          <p class="mb-4">
            Bootstrap's default utility classes can be found on the official <a href="https://getbootstrap.com/docs">Bootstrap
              Documentation</a> page. The custom utilities below were created to extend this theme past the default utility
            classes built into Bootstrap's framework.
          </p>
          <!-- Content Row -->
          <div class="row">

            <!-- Border Left Utilities -->
            <div class="col-lg-6">

              <div class="card mb-4 py-3 border-left-primary">
                <div class="card-body">.border-left-primary</div>
              </div>

              <div class="card mb-4 py-3 border-left-secondary">
                <div class="card-body">.border-left-secondary</div>
              </div>

              <div class="card mb-4 py-3 border-left-success">
                <div class="card-body">.border-left-success</div>
              </div>

              <div class="card mb-4 py-3 border-left-info">
                <div class="card-body">.border-left-info</div>
              </div>

              <div class="card mb-4 py-3 border-left-warning">
                <div class="card-body">.border-left-warning</div>
              </div>

              <div class="card mb-4 py-3 border-left-danger">
                <div class="card-body">.border-left-danger</div>
              </div>

              <div class="card mb-4 py-3 border-left-dark">
                <div class="card-body">.border-left-dark</div>
              </div>

            </div>

            <!-- Border Bottom Utilities -->
            <div class="col-lg-6">

              <div class="card mb-4 py-3 border-bottom-primary">
                <div class="card-body">.border-bottom-primary</div>
              </div>

              <div class="card mb-4 py-3 border-bottom-secondary">
                <div class="card-body">.border-bottom-secondary</div>
              </div>

              <div class="card mb-4 py-3 border-bottom-success">
                <div class="card-body">.border-bottom-success</div>
              </div>

              <div class="card mb-4 py-3 border-bottom-info">
                <div class="card-body">.border-bottom-info</div>
              </div>

              <div class="card mb-4 py-3 border-bottom-warning">
                <div class="card-body">.border-bottom-warning</div>
              </div>

              <div class="card mb-4 py-3 border-bottom-danger">
                <div class="card-body">.border-bottom-danger</div>
              </div>

              <div class="card mb-4 py-3 border-bottom-dark">
                <div class="card-body">.border-bottom-dark</div>
              </div>
            </div>
          </div>
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