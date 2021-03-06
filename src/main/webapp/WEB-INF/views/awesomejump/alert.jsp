<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <s:authentication var="member" property="principal"/>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	//서버 주소 : let sock = new SockJS("https://sixsenseproject.shop/echo");
	//로컬 주소 : let sock = new SockJS("http://localhost:9090/echo");
	
	let sock = new SockJS("http://localhost:9090/echo");
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
		//alert(data);
		var result = data.indexOf("msg:");
		var resultM = data.indexOf(":",result+4);
		
		//alert(data.substring(resultM+1));
		
		if(data.substring(result,result+4) == "msg:"){
			//서버메세지인 경우
			
			if(data.substring(0,result) == "${member.mem_nickname}"){
				//본인 메세지
				
				$("#chatMessage").append("<div id='myS'><span style='font-size:14px;'>" + data.substring(0,result) + "</span><br><span id='myH'>"+ data.substring(resultM+1) + "</span></div>");
				//$("#chatMessage").append("<h5 id='myH'>"+ data.substring(resultM+1) + "</h5>");
				$('#message').val('')
			}else{
				//mem 메시지
				
				$("#chatMessage").append("<div id='memS'><span style='font-size:14px;'>" + data.substring(0,result) + "</span><br><span id='memH'>" +data.substring(resultM+1) + "</span></div>");
				//$('#message').val('')
			}
		}else{
			$("#chatMessage").append("<span id='server'>" +data + "</span><br>");
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
	 function test() {
	        alert("Enter Key 입력 감지 \n함수 실행.");
	    }
</script>
</head>
<body>
1234
</body>
</html>