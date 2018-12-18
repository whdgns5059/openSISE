<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery_3.3.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#checking").on("click",function(){
		$("#aaa").css("background-color", "orange");
		alert("ㄴㅁㅇㄻㄴㄻㄹㅇㄴ");
	});	
});

</script>
</head>
<body>
	<div id="test">
		<h3 id="aaa">가나다</h3>
		<input type="checkbox" id="checking">
	</div>
</body>
</html>