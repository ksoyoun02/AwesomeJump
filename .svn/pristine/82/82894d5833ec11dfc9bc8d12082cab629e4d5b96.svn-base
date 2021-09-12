// Naver Login
var naver_id_login = new naver_id_login("CAdAeq_W_hK2H895SPXh", "https://sixsenseproject.shop/naver_callback");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 2,40);
naver_id_login.setDomain("https://sixsenseproject.shop");
naver_id_login.setState(state);
//naver_id_login.setPopup();
naver_id_login.init_naver_id_login();

// Kakao Login
window.Kakao.init("b4dea7c9a2b1d6a43189e97efe991cd8");
console.log(Kakao.isInitialized());
	
function kakaoLogin() {
	window.Kakao.Auth.login({
		scope:'profile_nickname, profile_image, account_email, gender, birthday, age_range',
		// 추가 동의 받을 동의 항목 id 목록
		success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
					
				 	console.log(kakao_account.email);
					console.log(kakao_account.profile['nickname']);
					console.log(kakao_account.gender);
					console.log(kakao_account.birthday);
					console.log(kakao_account.age_range); 
					console.log(authObj.access_token);
					
					var email = kakao_account.email;
					var gender = kakao_account.gender;
					var age_range = kakao_account.age_range;
					var birthday = kakao_account.birthday;
					var nickName = kakao_account.profile['nickname'];
					var token = authObj.access_token;
					//location.href="/loginAdd?email="+email+"&nickName="+nickName;

					token = token.substring(0,30);
					
					var newForm = document.createElement('form');
					newForm.setAttribute('method','post');
					newForm.setAttribute('action','/loginAdd');
					
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
					input2.setAttribute("value",nickName);
					input3.setAttribute("type","hidden");
					input3.setAttribute("name","_csrf");
					input3.setAttribute("value",CSRFtoken);
					input4.setAttribute("type","hidden");
					input4.setAttribute("name","social");
					input4.setAttribute("value","kakao");
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
					
				},
				fail: function(error){
					alert(JSON.stringify(error));
				}
			});
		}
	})
}
function checkI(){
	document.getElementById("hiddenCheck").value = 1;
	//alert(document.getElementById("hiddenCheck").value);
}
// 구글 로그인
 function onSignIn(googleUser) {
     // Useful data for your client-side scripts:
     
     var profile = googleUser.getBasicProfile();
     console.log("ID: " + profile.getId()); // Don't send this directly to your server!
     console.log('Full Name: ' + profile.getName());
     console.log('Given Name: ' + profile.getGivenName());
     console.log('Family Name: ' + profile.getFamilyName());
     console.log("Image URL: " + profile.getImageUrl());
     console.log("Email: " + profile.getEmail());

     // The ID token you need to pass to your backend:
     var token = googleUser.getAuthResponse().id_token;
     //console.log("ID Token: " + id_token);
 	
     token = token.substring(0,30);
   //document.google_login.email.value = profile.getEmail();
      var email = profile.getEmail();
      var nickName = profile.getName();
      
      var CSRFheader = $("meta[name='_csrf_header']").attr('content');
	  var CSRFtoken = $("meta[name='_csrf']").attr('content');
	  
      //$("#googleBtn").click(function() {
	if(document.getElementById("hiddenCheck").value == 1){
		$.ajax({
			url : '/googleLogin',
			type : 'POST',
			data : "email=" + email +"&nickName=" + nickName +"&social=google&token=" + token,
			dataType : "json",
			beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader,CSRFtoken),
			success: function(json) {
				if (json.login_result == "/loginAdd"){
					
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
					input2.setAttribute("value",nickName);
					input3.setAttribute("type","hidden");
					input3.setAttribute("name","_csrf");
					input3.setAttribute("value",CSRFtoken);
					input4.setAttribute("type","hidden");
					input4.setAttribute("name","social");
					input4.setAttribute("value","google");
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
					
				  }else{
				location.href = json.login_result;
			  }
			}
		});
	//});
    	}
   }


// 일반 로그인
$("#username, #password").blur(function() {
	$("#login-result").text("");
});

function loginCheck() {
	
	$("#login-result").text("");
	if ($.trim($("#username").val()) == "") {
		$("#login-result").text("아이디를 입력해주세요").shake();
		return false;
	}
	if ($.trim($("#password").val()) == "") {
		$("#login-result").text("비밀번호를 입력해주세요").shake();
		return false;
	}
	
	var loginUsername = $("#username").val();
	var loginPassword = $("#password").val();
	var customCheck = $("#remember-me").prop("checked");
	
	$.ajax({
		url: "/login",
		type: "POST",
		data: {
			username: loginUsername,
			password: loginPassword,
			'remember-me' : customCheck
		},
		dataType: "json",
		beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
		success: (data) => {
			if (data.loginResult == 0) {
				$("#login-result").text("아이디 혹은 비밀번호가 일치하지 않습니다").shake();	
				$("#password").val("");
			
			} else if (data.loginResult == -1) {
				$("#login-result").text("이메일 인증이 되지 않은 계정입니다.").shake();	
			
			} else if (data.loginResult == -2) {
				$("#login-result").text("비활성화된 계정입니다.").shake();	
			}
			
			if (data.loginResult == 1) {
				 $(document).ajaxStop(function(){
    			     window.location.assign(data.targetUrl);
				 });
			}				
		}
	});
}

/*$(document).ready(function(){
	$(".abcRioButton").append("<img src='/resources/google.png'>");
});*/
$("#login-submit").click( () => loginCheck() );
$("#username, #password").on('keypress', (e) => {
    	if(e.which == 13) { loginCheck(); }
});