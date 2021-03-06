<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<s:authorize access="hasRole('ROLE_USER')">
  <s:authentication var="member" property="principal"/>
</s:authorize>
<style>
@font-face {
	src : url("/resources/awesomejump/fonts/NanumBarunpenR.ttf");
	font-family: "NANUM";
}	
</style>
<header class="main_menu home_menu">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-12 pr-0">
        <nav class="navbar navbar-expand-lg navbar-light">
          <a class="navbar-brand" href="/" style="width: 200px; margin-top: 40px;"> <img src="/resources/logo.png" alt="logo" width="125px"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="menu_icon" style="line-height: 36px;">
              <i class="fas fa-bars"></i>
            </span>
          </button>
          <div class="collapse navbar-collapse main-menu-item mt-2" id="navbarSupportedContent">
            <ul class="navbar-nav">
            
            <s:authorize access="isAnonymous()">
              <li class="nav-item d-block d-sm-none">
                <a class="d-inline nav-link" href="/login">로그인</a>
              </li>
              <li class="nav-item d-block d-sm-none border-bottom">
                <a class="d-inline nav-link" href="/register">회원가입</a>
              </li>
            </s:authorize>
              
              <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
              <li class="nav-item"><a class="nav-link" href="/category">shop</a></li>
               <li class="nav-item"><a class="nav-link" href="/couponList">coupon</a></li>
              <li class="nav-item"><a class="nav-link" href="/awesomejump/qna/list">Q&A</a></li>
            </ul>
          </div>
          <div class="hearer_icon d-flex align-items-center" style="position: relative; top: 2px;">
            <!-- 검색 아이콘 비활성화 -->
            <%-- 
            <a class="d-none d-sm-block align-self-center" id="search_1" href="/javascript:void(0)"><i class="ti-search"></i></a> 
             --%>
            <s:authorize access="isAnonymous()">
              <span class="d-none d-sm-block">
                <a class="ml-4 font-weight-bold" href="/login">로그인</a>
                <span class="mx-2 font-weight-lighter">｜</span>
                <a class="font-weight-bold" href="/register">회원가입</a>
              </span>
              <span class="d-block d-sm-none">
                <a href="/login">
                  <i class="fas fa-user mr-3" style="font-size: 22px;"></i>
                </a>
              </span>
            </s:authorize>
            
            <s:authorize access="hasRole('ROLE_USER')">
              <div class="btn-group align-items-center mr-3">
                <span class="d-none d-sm-block">
                  <a href="/interest">
                    <i class="fas fa-heart fa-lg text-danger"></i>
                  </a>
                  <a href="/awesomejump/cart/list">
                    <i class="fas fa-cart-plus fa-lg text-muted mx-3"></i>
                  </a>
                </span>
                <c:choose>
                  <c:when test="${member.mem_profile_img eq 'profile.jpg'}">
                    <img class="rounded-circle dropdown-toggle" style="cursor: pointer"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
                    src="/resources/awesomejump/img/profile.jpg" width="32px" height="32px"/>
                  </c:when>
                  <c:otherwise>
                   <img class="rounded-circle dropdown-toggle"  style="cursor: pointer"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                   src="/upload${member.mem_profile_img}" width="32px" height="32px"/>
                  </c:otherwise>
                </c:choose>
                <div class="dropdown-menu dropdown-menu-right mt-3" style="top: 36px;">
                  <a class="dropdown-item" href="/members">내 정보</a>
                  <a class="dropdown-item" href="/logout">로그아웃</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="/awesomejump/cart/list">장바구니</a>
                  <a class="dropdown-item" href="/interest">관심상품</a>
                </div>
              </div>
            </s:authorize>
          </div>
        </nav>
      </div>
    </div>
  </div>
  <!-- 검색 기능 비활성화 -->
  <%-- 
  <div class="search_input" id="search_input_box">
    <div class="container ">
      <form class="d-flex justify-content-between search-inner">
        <input type="text" class="form-control" id="search_input" placeholder="Search Here">
        <button type="submit" class="btn"></button>
        <span class="ti-close" id="close_search" title="Close Search"></span>
      </form>
    </div>
  </div>
  --%>
</header>