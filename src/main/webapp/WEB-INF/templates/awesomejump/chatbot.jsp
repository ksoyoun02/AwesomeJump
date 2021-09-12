<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Chatbot -->
<div class="chatbotWrapper" style="display: none;">
   <div class="closeBtnWrapper">
    <i class="fas fa-times fa-lg chatbotCloseBtn" 
       style="position: absolute; right: 10px; top: 10px; color: #888; cursor: pointer;"></i>
   </div>
  <div class="imessage"></div>
  <div class="d-flex align-items-center">
    <input type="text" class="form-control" id="chatbot-request"> 
    <i class="fab fa-telegram-plane fa-2x m-auto" id="chatbot-requestBtn" 
       style="line-height: 46px; width: 40px; position: relative; left: 5px; cursor: pointer;"></i>
  </div>
</div>
<div class="bubble">
  <i class="fas fa-robot fa-2x" style="line-height: 36px; cursor: pointer;"></i>
	<a href="#none"
	onclick="window.open('/websocket_chat','new','scrollbars=yes,resizable=no,location=no,toolbar=no, width=400 height=480, left=300, top=10');return false">
	 <i class="far fa-comments fa-2x" style="line-height: 36px; cursor: pointer;"></i></a>
</div>