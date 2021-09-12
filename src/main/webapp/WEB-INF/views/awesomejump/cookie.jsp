<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<s:csrfMetaTags/>
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	alert("gd");
});

  function cookieIdentify() {
      alert(document.cookie);
    
}
  
  function cookieRemove() {

      // 변수를 선언한다.
      var date = new Date();
      date.setDate(date.getDate() - 1);

      var willCookie = "";
      willCookie += "CookieName=Value;";
      willCookie += "Expires=" + date.toUTCString();

      // 쿠키를 집어넣는다.
      document.cookie = willCookie;

      // 출력한다.
      alert(document.cookie);
  }
  
  
  function cookieFive() {

      // 변수를 선언한다.
      var date = new Date();
      date.setDate(date.getDate() + 7);

      // 5번을 반복한다.
      for(var i = 10; i < 20; i++) {

          var Cookie = "";
          Cookie += "recent" + i + "=" + i +";";
          Cookie += "Expires=" + date.toUTCString();

          // 쿠키를 집어넣는다.
          document.cookie = Cookie;
      }

      // 출력한다.
      alert(document.cookie);
  }
  
  function recent() {

      // 변수를 선언한다.
      var date = new Date();
      date.setDate(date.getDate() + 7);

      var i = '해당상품no넣어주세요';
       var Cookie = "";
       Cookie += "recent" + i + "=" + i +";";
       Cookie += "Expires=" + date.toUTCString();

       // 쿠키를 집어넣는다.
       document.cookie = Cookie;
     
  }
  </script>
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?render=6Ld9RrUbAAAAAJVtY2nqHRtCQ2DXVRPOJ_GcAgXt"></script>
<script>
$(document).ready(function(){
    grecaptcha.ready(function() {
      grecaptcha.execute('6Ld9RrUbAAAAAJVtY2nqHRtCQ2DXVRPOJ_GcAgXt', {action: 'login'}).then(function(token) {
         console.log(token)
         
      var CSRFheader = $("meta[name='_csrf_header']").attr('content');
	  var CSRFtoken = $("meta[name='_csrf']").attr('content');
	  
         $.ajax({
            url: '/captcha',
            type : 'POST',
            dataType: 'json',
            data : {'token': token},
            beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader,CSRFtoken), 
            success : function(result){
                console.log(result);
            },
            fail: function(e){
                console.log("fail")
            }
          });// end ajax
      });
    });
});
</script>
</head>
<body>
	<!-- <form action="/captcha">
		<input type="hidden" id="reCaptcha" name="reCaptcha"/>
		<input type="submit" value="보내기">
	</form> -->
	<h2>JavaScript를 이용한 쿠키 생성한 쿠키를 경고창으로 띄워보자.</h2>
    <input type="button" onClick="cookieIdentify();" value="쿠키확인"/>
    
     <h2>JavaScript를 이용한 생성한 쿠키제거.</h2>
    <input type="button" onClick="cookieRemove();" value="쿠키제거"/>
    
    <h2>JavaScript를 이용한 생성한 5개의 쿠키 생성.</h2>
    <input type="button" onClick="cookieFive();" value="쿠키생성"/>
    
     <h2>추가</h2>
    <input type="button" onClick="ccookie();" value="쿠키찾기"/>
    
    
     <h2>상품쿠키</h2>
    <input type="button" onClick="recent();" value="상품쿠키"/>
    <div>
   <%
		Cookie[] cookie = request.getCookies();
		if(cookie != null){	
   		for(int i = 0; i < cookie.length; i++) {
   			String name = cookie[i].getName();
   			if(name.indexOf("Name")!=-1){
   				
    			String value = cookie[i].getValue();
    			String item = URLDecoder.decode(value,"UTF-8");
    			
				out.println(name);
				out.println(value + "<br/>");
				
    			}
			}
		}
	%>
    </div>
    <div>
    ${recentView1.product_name} 
    ${recentView2.product_name}
    ${recentView3.product_name}
    ${recentView4.product_name}
    ${recentView5.product_name}
    </div>
</body>
</html>