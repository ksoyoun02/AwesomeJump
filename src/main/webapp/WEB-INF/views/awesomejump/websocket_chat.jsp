<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/3dd8f68466.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <s:authentication var="member" property="principal"/>
  
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	//서버 주소 : let sock = new SockJS("https://sixsenseproject.shop/echo");
	//로컬 주소 : let sock = new SockJS("http://localhost:9090/echo");
	
	let sock = new SockJS("https://sixsenseproject.shop/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	// 메시지 전송
	function sendMessage() {
		var msg = $("#message").val();
		sock.send("msg:" + "${member.mem_nickname}"+":"+msg );
		
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		
		var result = data.indexOf("msg:");
		// 닉네임 시작
		var resultM = data.indexOf(":",result+4);
		// 닉네임 끝
		var img = data.indexOf("\member");
		// 이미지 경로 찾기
		var imgPath = "/upload/"+data.substring(img);
		
		var	D_imgPath = "/resources/awesomejump/img/profile.jpg";
		
		//alert(data.substring(resultM+1));
		
		if(data.substring(result,result+4) == "msg:"){
			//서버메세지인 경우
			
			if(img == -1){
				// 프로필 사진이 없는 경우
				
				if(data.substring(0,result) == "${member.mem_nickname}"){
					//본인 메세지
					
					$("#chatMessage").append("<div id='myS'><img src='"+D_imgPath+"' style='width:45px;height: 45px;object-fit: cover;border: none;border-radius: 40px;'><br><span style='font-size:14px;'>" + data.substring(0,result) + "</span><br><span id='myH'>"+ data.substring(resultM+1) + "</span></div>");
					//$("#chatMessage").append("<h5 id='myH'>"+ data.substring(resultM+1) + "</h5>");
					$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
					$('#message').val('')
				}else{
					//mem 메시지
					
					$("#chatMessage").append("<div id='memS'><img src='"+D_imgPath+"' style='width:45px;height: 45px;object-fit: cover;border: none;border-radius: 40px;'><br><span style='font-size:14px;'>" + data.substring(0,result) + "</span><br><span id='memH'>" +data.substring(resultM+1) + "</span></div>");
					$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
					//$('#message').val('')
				}
			}else{
				// 프로필 사진이 있는 경우
				
				if(data.substring(0,result) == "${member.mem_nickname}"){
					//본인 메세지
					
					$("#chatMessage").append("<div id='myS'><img src='"+imgPath+"' style='width:45px;height: 45px;object-fit: cover;border: none;border-radius: 40px;'><br><span style='font-size:14px;'>" + data.substring(0,result) + "</span><br><span id='myH'>"+ data.substring(resultM+1,img-1) + "</span></div>");
					//$("#chatMessage").append("<h5 id='myH'>"+ data.substring(resultM+1) + "</h5>");
					$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
					$('#message').val('')
				}else{
					//mem 메시지
					
					$("#chatMessage").append("<div id='memS'><img src='"+imgPath+"' style='width:45px;height: 45px;object-fit: cover;border: none;border-radius: 40px;'><br><span style='font-size:14px;'>" + data.substring(0,result) + "</span><br><span id='memH'>" +data.substring(resultM+1,img-1) + "</span></div>");
					$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
					//$('#message').val('')
				}
			}
		}else{
			$("#chatMessage").append("<span id='server'>" +data + "</span><br>");
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
			//$('#message').val('')
		}
		
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		//$("#messageArea").append("연결 끊김");

	}
	function onOpen() {
		sock.send('-----  '+'${member.mem_nickname}' + '님이 입장하셨습니다'+'  -----');
		//$("#messageArea").append("입장하셨습니다.<br/>");
	}
	
	function closeMessage() {
		sock.send('-----  '+'${member.mem_nickname}' + "님이 연결을 끊었습니다"+'  -----');
		//$("#endMessage").append("==================================");
		sock.close();
		window.close();
		
	}
	
</script>

<style type="text/css">
	
	@font-face {
		src : url("/resources/awesomejump/fonts/NanumBarunpenR.ttf");
		font-family: "NANUM";
	}	
	
	*{
		font-family: "NANUM";
		font-weight: bold;
	}
	body {
		background-color: #d8d8d847;
	}
	
	#server {
		text-align: center;
		color: red;
		margin: 15px;
	}
	
	.msgBtn {
		position: fixed;
	    bottom: 0;
	    width: 100%;
	    background-color: white;
	    left: 0px;
	    padding: 10px 0;
	}
	
	#message {
		width: 75%;
	    margin: 10px 10px 10px 20px;
	    border: 1px solid #c7c7c7;
	    padding: 10px;
	    border-radius: 10px;
	}
	
	#message:focus {
		outline: none;
	}
	
	#sendBtn{
		width: 30px;
		position: fixed;
    	bottom: 25px;
	}
	
	#chatMessage {
		height: 370px;
		overflow-y: auto;
		text-align: center;
	}
	#myS {
		text-align: right;
		margin: 10px 10px 20px 10px;
	}
	
	#memS {
		text-align: left;
		margin: 10px 10px 20px 10px;
	}
	
	
	#myH {
		background-color: #dff1fb;
	    padding: 0 15px;
	    margin-right: 5px;
	    border: none;
	    border-radius: 10px;
	}
	#memH {
		background-color: white;
	    padding: 0 15px;
	    margin-left: 5px;
	    border: none;
	    border-radius: 10px;
	}
	
	#close {
		border: none;
	    border-radius: 10px;
	    padding: 5px 30px;
	    background-color: #ff69b45c;
	    margin-bottom: 10px;
	}
</style>
</head>
<body>
	<div style="text-align: right;">
		<input type="button" id="close" value="종료하기" onclick="closeMessage();" />
	</div>
	<div class="box">
		<div id="chatMessage"></div>
		<div id="endMessage"></div>
	</div>
	<div class="msgBtn">
		<div>
			<input type="text" id="message" onkeyup="if(window.event.keyCode==13){sendMessage()}"/>
			<i class="fas fa-comment-dots fa-2x" id="sendBtn" onclick="sendMessage();"></i>
			
		</div>
	</div>
	
</body>
</html>