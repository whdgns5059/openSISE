
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

<head>
</head>

<body>
	<div class="container-fluid">
		<div class="row" align="center" style="margin: 50px;">
			<%-- left --%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form action="/mypage/passChange" method="post">
				<div class="blog-header">
					<h3>비밀번호 변경</h3>
					<hr>
				</div>
				<div class="form-group">
					 <label><input type="hidden" class="form-control" id="mem_email" name="mem_email" value="${memberVo.mem_email}" /> </label></br>
					<label><input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="현재 비밀번호 입력" /> </label> 
				</div>
				<div class="form-group">
					<label><input type="password" class="form-control" id="mem_new_pass" name="mem_new_pass" placeholder="새 비밀번호 입력" /> 
					<input type="password" class="form-control" id="memPass" name="memPass" placeholder="새 비밀번호 확인" /> </label>
				</div>
				</br>
				
				<div class="col-sm-offset-2 col-sm-10">
	     			<button type="submit" class="btn btn-default">변경</button>
				</div>
				
				</form>
			</div>
		</div>
	</div>
</body>
</html>
