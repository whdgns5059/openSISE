<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chatDiv {width : 560px; padding:20px;}
</style>
</head>

<body>
	
<div class="chatDiv">
	<div>
		<h3>개설된 채팅 문의</h3>
	</div>
	<table class="table">
		<c:choose>
			<c:when test="${chatList == null }">
				<tr>
					<td><h3>개설된 채팅방이 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<th>번호</th>
				<th>개설자</th>
				<th>개설시간</th>
				<c:forEach items="${chatList }" var="chatVo">
				<tr class="chatroomTr">
					<td><label>${chatVo.chat_mem_no }</label></td>
					<td><label>${chatVo.chat_mem_name }</label></td>			
					<td><label>${chatVo.chat_create_time }</label></td>				
				</tr>
				</c:forEach>	
			</c:otherwise>
		</c:choose>
	</table>
</div>
	
<form action="/chat/chatroom" method="post" id="frm">
	<input type="hidden" name="mem_no" value="${selMem.mem_no }"/>
</form>
</body>


<script type="text/javascript">
	
	$('.chatroomTr').hover(function(){
		this.style.cursor = 'pointer';
	});	
	
	$('.chatroomTr').click(function(){
		$('#frm').submit();	
	});
	
</script>
</html>