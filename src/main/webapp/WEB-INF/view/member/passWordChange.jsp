
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
				<div class="blog-header">
					<h3>비밀번호 변경</h3>
					<hr>
				</div>
				<div class="form-group">
					<label><input type="text" class="form-control" id="name" name="name" placeholder="현재 비밀번호 입력" /> </label> 
				</div>
				<div class="form-group">
					<label><input type="text" class="form-control" id="name" name="name" placeholder="새 비밀번호 입력" /> 
					<input type="text" class="form-control" id="name" name="name" placeholder="새 비밀번호 확인" /> </label>
				</div>
				</br>
				
				
				
			</div>
		</div>
	</div>
	<form action="/board/myInfoUpdate" method="post">
	<div class="form-group"  align="center">
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				 <!-- <input type="hidden" name="userId" value="${userVo.userId}"> -->
     			<button type="submit" class="btn btn-default">변경</button>
			</div>
		</div>
		<div class="col-sm-10"></div>
	</div>
</form>
</body>
</html>
