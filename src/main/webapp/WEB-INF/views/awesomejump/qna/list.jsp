<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Awesomejump - 1:1 문의</title>

<link rel="icon" href="/resources/awesomejump/img/favicon.png">
<link rel="stylesheet" href="/resources/awesomejump/css/nice-select.css">
<link rel="stylesheet" href="/resources/awesomejump/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/animate.css">
<link rel="stylesheet" href="/resources/awesomejump/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/awesomejump/css/all.css">
<link rel="stylesheet" href="/resources/awesomejump/css/flaticon.css">
<link rel="stylesheet" href="/resources/awesomejump/css/themify-icons.css">
<link rel="stylesheet" href="/resources/awesomejump/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/awesomejump/css/slick.css">
<link rel="stylesheet" href="/resources/awesomejump/css/style.css">
  
  <script src="https://kit.fontawesome.com/41471e1ffa.js" crossorigin="anonymous"></script>
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
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- custom js -->
  <script defer src="/resources/awesomejump/js/custom.js"></script>
<style type="text/css">
	tr, td {
		text-align: center;
		vertical-align: middle;
	}
</style>  
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			
			e.preventDefault();
			searchForm.submit();
		});
		
		var result = '<c:out value="${result}" />';
		
		checkModal(result);
		
		function checkModal(result) {
			if (result === '') {
				return;
			}
			
			if(parseInt(result) > 0) {
				$(".modal-body").html("문의가 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#write").on("click", function(){
			self.location = "/awesomejump/qna/register";
		});
		
	});
	
/* 	function inputPassword() {
		pass = prompt('패스워드를 입력하세요. ','');
		 if (pass=="1234") {
			location.href="/awesomejump/qna/read?qna_no="+$("#qna_no").val();
		} else {
			alert("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
		} 
		
	  	$('#qnaPassword').blur(function () {
			var qnaPassword = $('#qnaPassword').val();
			$.ajax({
				url : 'awesomejump/qna/qnaPwCheck?qna_pw=' + qna_pw,
				type : 'get',
				success : function (data) {
					if (data == 1) {
						
					}
				}
				
			});
		});  
	  	
	} */

	
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/templates/awesomejump/header.jsp"/>
<s:authentication property="principal" var="member"/>
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>Q&A</h2>
              <p>
                Home <span>-</span> 1:1 문의
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <br><br>
  
  <div class="row" style="text-align: center;">
	  <table class="table qna" style="text-align: center; border: 1px solid #dddddd; margin: 50px;">
		<thead>
			<tr>
				<th width="150">글번호</th>
				<th width="150">카테고리</th>
				<th width="700">제목</th>
				<th width="150">작성자</th>
				<th width="150">작성일</th>
			</tr>
		</thead>
		<tbody>
	   		<c:choose>
	    		<c:when test="${empty list}">
	    			<tr height="10">
						<th colspan="5">
							<p align="center">
								<b><span style="font-size: 20px;">등록된 글이 없습니다.</span></b>
							</p>
						</th>
					</tr>
	    		</c:when>
	    		
	    		
	   	 		<c:when test="${!empty list}">
	    			<c:forEach items="${list}" var="qDto">
	    			
	    			<!-- 검색 했을 때 -->
	    				<%-- <c:if test="${!empty pageMaker.page.keyword && qDto.qna_yn eq 'n' && qDto.qna_relevel == 0 }">
	 	    				<c:if test="${qDto.qna_relevel == 1}">
			    				<div class="qnaReply">
				    				<tr class="qnaBody">
				     					<td>${qDto.qna_no}</td>
				     					<td>${qDto.qna_category}</td>
						     			<td style="text-align: left;">
						     				<c:choose>
							     				<c:when test="${qDto.qna_relevel == 0 || qDto.qna_reply_yn eq 'n'}">
							     					<a href="/awesomejump/qna/read?qna_no=${qDto.qna_no}">${qDto.qna_title}</a>
							     				</c:when>
						     				</c:choose>
						     				<c:choose>
						     					<c:when test="${qDto.qna_relevel == 1}">
						     						<div class="qna">
						     							<div class="qnaHeader">
						     								<!-- button type="button" class="showAll">답변모두여닫기</button -->
						     							</div>
							     						<ul class="qnaBody">
							     							<li class="article">
									     						<p class="q" style="color: red;">
										     						<a href=""><img width="25" height="25" src="/resources/awesomejump/img/reply.png">&nbsp;&nbsp;&nbsp;답변완료</a>
										     					</p>
										     					<p class="a">${qDto.qna_content}</p>
										     				</li>
							     						</ul>
					     							</div>
							     				</c:when>
						     				</c:choose>
						     			</td>
						     			<td>${qDto.qna_name}</td>
						     			<td><fmt:formatDate value="${qDto.qna_date}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						     		</tr>
					     		</div>
		    				</c:if>
		    				<c:if test="${qDto.qna_relevel == 0}">
			    				<tr>
			     					<td>${qDto.qna_no}</td>
			     					<td>${qDto.qna_category}</td>
					     			<td style="text-align: left;">
					     				<c:choose>
						     				<c:when test="${qDto.qna_relevel == 0 || qDto.qna_reply_yn eq 'n'}">
						     					<c:if test="${qDto.qna_yn eq 'n' }">
							     					<a href="/awesomejump/qna/read?qna_no=${qDto.qna_no}">${qDto.qna_title}</a>
						     					</c:if>
						     					<c:if test="${qDto.qna_yn eq 'y' }">
							     					<a id="qnaPassword" href="javascript:inputPassword();"><img height="15" width="15" src="/resources/awesomejump/img/secret.png">&nbsp;비공개 글입니다.</a>
						     					</c:if>
						     				</c:when>
					     					<c:when test="${qDto.qna_relevel == 1}">
					     						<div class="qna">
					     							<div class="qnaHeader">
					     								<!-- button type="button" class="showAll">답변모두여닫기</button -->
					     							</div>
						     						<ul class="qnaBody">
						     							<li class="article">
								     						<p class="q" >
									     						<a href="">답변완료</a>
									     					</p>
									     					<p class="a">${qDto.qna_content}</p>
						     						</ul>
					     						</div>
						     				</c:when>
					     				</c:choose>
					     			</td> 
					     			<td>${qDto.qna_name}</td>
					     			<td><fmt:formatDate value="${qDto.qna_date}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					     		</tr>
		    				</c:if>
	    				</c:if> --%>
	    				
	    				<!-- 검색 안 했을 때 -->
	    					<!-- 답변 달렸을 때 -->
	    					<c:if test="${qDto.qna_relevel == 1}">
			    				<div class="qnaReply">
				    				<tr class="qnaBody">
				     					<td style="top: 50%">${qDto.qna_no}</td>
				     					<td style="top: 50%">${qDto.qna_category}</td>
						     			<td style="text-align: left; padding-top: 0px;">
						     				<c:choose>
							     				<c:when test="${qDto.qna_relevel == 0 || qDto.qna_reply_yn eq 'n'}">
							     					<a href="/awesomejump/qna/read?qna_no=${qDto.qna_no}">${qDto.qna_title}</a>
							     				</c:when>
						     				</c:choose>
						     				<c:choose>
						     					<c:when test="${qDto.qna_relevel == 1}">
						     						<div class="qna">
						     							<div class="qnaHeader">
						     								<!-- button type="button" class="showAll">답변모두여닫기</button -->
						     							</div>
							     						<ul class="qnaBody" style="top: 50%">
							     							<li class="article">
									     						<p class="q" style="color: red;" >
										     						<a href="" style="font-size: 14px;"><img width="20" height="20" src="/resources/awesomejump/img/reply.png">&nbsp;&nbsp;&nbsp;답변완료</a> 
										     					</p>
										     					<p class="a" style="font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qDto.qna_content}</p>
										     				</li>
							     						</ul>
					     							</div>
							     				</c:when>
						     				</c:choose>
						     			</td>
						     			<td>${qDto.qna_name}</td>
						     			<td><fmt:formatDate value="${qDto.qna_date}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						     		</tr>
					     		</div>
		    				</c:if>
		    				
		    				
		    				
		    				
		    				<c:if test="${qDto.qna_relevel == 0}">
			    				<tr>
			     					<td style="top: 50%">${qDto.qna_no}</td>
			     					<td style="top: 50%">${qDto.qna_category}</td>
					     			<td style="text-align: left;">
					     				<c:choose>
						     				<c:when test="${qDto.qna_relevel == 0 || qDto.qna_reply_yn eq 'n'}">
						     					<c:if test="${qDto.qna_yn eq 'n' }">
							     					<a href="/awesomejump/qna/read?qna_no=${qDto.qna_no}">${qDto.qna_title}</a>
						     					</c:if>
						     					<c:if test="${qDto.qna_yn eq 'y' }">
							     					<a id="qnaPassword" href="/awesomejump/qna/passwordCheck?qna_no=${qDto.qna_no}" ><img height="15" width="15" src="/resources/awesomejump/img/secret.png">&nbsp;비공개 글입니다.</a>
<!-- 							     					<a id="qnaPassword" data-toggle="modal" href="#secQnaRead" ><img height="15" width="15" src="/resources/awesomejump/img/secret.png">&nbsp;비공개 글입니다.</a> -->
						     					</c:if>
						     				</c:when>
					     					<c:when test="${qDto.qna_relevel == 1}">
					     						<div class="qna">
					     							<div class="qnaHeader">
					     								<!-- button type="button" class="showAll">답변모두여닫기</button -->
					     							</div>
						     						<ul class="qnaBody">
						     							<li class="article">
								     						<p class="q" >
									     						<a href="">답변완료</a>
									     					</p>
									     					<p class="a">${qDto.qna_content}</p>
						     						</ul>
					     						</div>
						     				</c:when>
					     				</c:choose>
					     			</td> 
					     			<td>${qDto.qna_name}</td>
					     			<td><fmt:formatDate value="${qDto.qna_date}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					     		</tr>
		    				</c:if>
	     			</c:forEach>
	    		</c:when>
	   		</c:choose>
	   </tbody>
	  </table>
	  
		<button type="button" id="write" class="btn btn-outline-secondary pull-right" style="margin-left: 50px;">글쓰기</button>
	  
  <div class="modal fade" id="secQnaRead" data-backdrop="static" data-keyboard="false" 
       tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">비밀글입니다.</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-8 offset-md-2">
              <form action="/awesomejump/qna/read?qna_no=${qna_no}" method="POST" name="readQna">
	              <div class="form-group">
	                <label for="input_qna_pw" class="col-form-label">비밀번호를 입력해 주세요</label>
	                <input type="password" class="form-control" id="input_qna_pw">
	                <div id="vm-qna_pw" class="min-height-30px"></div>
	              </div>
                <s:csrfInput/>
              </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" id="pwCheckBtn">확인</button>
        </div>
      </div>
    </div>
  </div>
  
  
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  				<h4 class="modal-title" id="myModalLabel">Awesomejump</h4>
  			</div>
  			<div class="modal-body">완료</div>
  			<div class="modal-footer">
  				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  			</div>
  		</div>
  	</div>
  </div>
  
  <div class="col-lg-12">
  	<div class="pageination">
	  	<ul class="pagination justify-content-center">
		  	<c:if test="${pageMaker.prev}">
		  		<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
		  	</c:if>
		  	
		  	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		  		<li class="paginate_button ${pageMaker.page.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
		  	</c:forEach>
		  	
		  	<c:if test="${pageMaker.next}">
		  		<li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
		  	</c:if>
		</ul>
	</div>
  </div>
  
  <div class="row" style="margin-left: 30px;">
  	<div class="col-lg-12">
  		<form action="/awesomejump/qna/list" id="searchForm" method="get">
  			<select name="sort_option">
  				<option value="" <c:out value="${pageMaker.page.type == null?'selected':'' }"/>>선택하세요</option>
  				<option value="T" <c:out value="${pageMaker.page.type eq 'T'?'selected':'' }"/>>제목</option>
  				<option value="C" <c:out value="${pageMaker.page.type eq 'C'?'selected':'' }"/>>내용</option>
  				<option value="W" <c:out value="${pageMaker.page.type eq 'W'?'selected':'' }"/>>작성자</option>
  				<option value="TC" <c:out value="${pageMaker.page.type eq 'TC'?'selected':'' }"/>>제목 or 내용</option>
  				<option value="TW" <c:out value="${pageMaker.page.type eq 'TW'?'selected':'' }"/>>제목 or 작성자</option>
  				<option value="TWC" <c:out value="${pageMaker.page.type eq 'TWC'?'selected':'' }"/>>제목 or 내용 or 작성자</option>
  			</select>
  			<input type="text" name="keyword" value="<c:out value= "${pageMaker.page.keyword }"/>" />
  			<input type="hidden" name="pageNum" value="<c:out value= "${pageMaker.page.pageNum }"/>" />
  			<input type="hidden" name="amount" value="<c:out value= "${pageMaker.page.amount }"/>" />
  			<button class="btn btn-outline-secondary">검색</button>
		  	
  		</form>
  	</div>
  </div>
  
  <form id="actionForm" action="/awesomejump/qna/list" method="get">
  	<input type="hidden" name="pageNum" value="${pageMaker.page.pageNum }">
  	<input type="hidden" name="amount" value="${pageMaker.page.amount }">
  	<input type="hidden" name="type" value="${pageMaker.page.type }">
  	<input type="hidden" name="keyword" value="${pageMaker.page.keyword }">
  </form>
  
  </div>
  
<jsp:include page="/WEB-INF/templates/awesomejump/footer.jsp" />

<script>
jQuery(function($){
    var article = $('.qna>.qnaBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    article.eq(0).find('.a').show();
    $('.qna>.qnaBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.qna>.qnaHeader>.showAll').click(function(){
        var hidden = $('.qna>.qnaBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
});
</script>
</body>
</html>