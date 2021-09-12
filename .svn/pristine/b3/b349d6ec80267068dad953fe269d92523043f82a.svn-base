<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<s:csrfMetaTags/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<!-- 1방법 -->
<!-- <script type="text/javascript">
  var naver_id_login = new naver_id_login("CAdAeq_W_hK2H895SPXh", "http://localhost:9090/airbnb/member/naver_callback");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	alert("개발자모드확인");
    console.log(naver_id_login.getProfileData('email'));
    console.log(naver_id_login.getProfileData('nickname'));
    console.log(naver_id_login.getProfileData('age'));
    window.close();
  }
</script> -->

<!-- 2방법 -->
<script type="text/javascript">

  var naver_id_login = new naver_id_login("CAdAeq_W_hK2H895SPXh", "https://sixsenseproject.shop/naver_callback");
  // 접근 토큰 값 출력
   //$('body').append('<h4>접속토큰:'+naver_id_login.oauthParams.access_token+'</h4>'); 
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    const email = naver_id_login.getProfileData('email');
    const nickname = naver_id_login.getProfileData('nickname');
    const name = naver_id_login.getProfileData('name');
    const age = naver_id_login.getProfileData('age');
    const gender = naver_id_login.getProfileData('gender');
    const birthday = naver_id_login.getProfileData('birthday');
    const mobile = naver_id_login.getProfileData('mobile');
    let token = naver_id_login.oauthParams.access_token;
    token = token.substring(0,30);
    
	//let body = $('body');
	/* body.append('로그인 성공!'); */
	//body.append('<h4>이메일:'+email+'</h4>');
	//body.append('<h4>닉네임:'+nickname+'</h4>');
	/* body.append('<h4>이름:'+name+'</h4>');
	body.append('<h4>나이:'+age+'</h4>');
	body.append('<h4>성별:'+gender+'</h4>');
	body.append('<h4>생일:'+birthday+'</h4>');
	body.append('<h4>전화번호:'+mobile+'</h4>'); */
	
	var newForm = document.createElement('form');
	newForm.setAttribute('method','post');
	newForm.setAttribute('action','/loginAdd');
	
	var CSRFtoken = $("meta[name='_csrf']").attr('content');
	
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
	var input4 = document.createElement('input');
	var input5 = document.createElement('input');
	
	input1.setAttribute("type","hidden");
	input1.setAttribute("name","email");
	input1.setAttribute("value",email);
	input2.setAttribute("type","hidden");
	input2.setAttribute("name","nickName");
	input2.setAttribute("value",nickname);
	input3.setAttribute("type","hidden");
	input3.setAttribute("name","_csrf");
	input3.setAttribute("value",CSRFtoken);
	input4.setAttribute("type","hidden");
	input4.setAttribute("name","social");
	input4.setAttribute("value","naver");
	input5.setAttribute("type","hidden");
	input5.setAttribute("name","token");
	input5.setAttribute("value",token);
	
	newForm.appendChild(input1);
	newForm.appendChild(input2);
	newForm.appendChild(input3);
	newForm.appendChild(input4);
	newForm.appendChild(input5);
	
	document.body.appendChild(newForm);
	
	newForm.submit();
  }
</script>
</body>
</html>
