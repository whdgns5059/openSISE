<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
</head>
<style>
	
	.totalWrap {width: 560px;}	
	.chatDiv {height:700px;}

</style>
<body>

		
	
<div class="totalWrap">
	<div>
		<input type="hidden" id="chat_mem_no" value="${chatVo.chat_mem_no }" />
		<input type="hidden" id="chat_mem_name" value="${chatVo.chat_mem_name }" />
		<input type="hidden" id="chat_create_time" value="${chatVo.chat_create_time }" />
	</div>
	<div class="chatDiv">
		<ul id="chatList"></ul>
	</div>
	<div class="inputDiv">
		<form>
			<input type="text" id="nm" name="mem_name" value="${memberVo.mem_nm}" readonly="readonly"/>
			<input type="text" id="msg" name="msg" />
			<input type="button" id="send" value="전송"/>
		</form>
	</div>	

</div>


</body>

<script type="text/javascript"> 

	$('#send').click(function(){
		sendMessage();
		$('#msg').val('');
	});

	$('#msg').keydown(function(key){
		if (key.keyCode == 13) {
			sendMessage();
			$('#msg').val('');
		}	
	});
	
	//웹소켓을 해당 url과 연결
	var sock = new WebSocket('ws://localhost:8081/chatHandler');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	//메시지 전송
	function sendMessage(){
		sock.send($('mem_name').val() + ' : ' + $('#msg').val());
	}
	
	//서버로부터 메시지 받기
	function onMessage(msg){
		var data = msg.data;
		$('#chatList').append('<li>' + data + '</li>');
	}
	
	//서버와 연결이 끊킴
	function onClose(evt){
		$('chatList').append('<li>연결 종료</li>');
	}
	


</script>

</html>