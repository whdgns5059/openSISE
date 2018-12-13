
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

<head>

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<%-- left --%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="blog-header">
					<h3>회원탈퇴</h3>
					<hr>
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">현재 비밀번호 입력</label>
				<!--	<label><input type="text" class="form-control" id="name" name="name" placeholder="${userVo.pass}" /> </label> -->
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">변경 비밀번호 입력</label>
				<!--	<label><input type="text" class="form-control" id="name" name="name" placeholder="${userVo.pass}" /> </label> -->
				</div>
				<div class="form-group">
					<label for="userNm" class="col-sm-2 control-label">비밀번호 재확인</label>
				<!--	<label><input type="text" class="form-control" id="name" name="name" placeholder="${userVo.pass}" /> </label> -->
				</div>

			</div>
		</div>
	</div>
	<form action="/board/myInfoUpdate" method="post">
	<div class="form-group">
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
