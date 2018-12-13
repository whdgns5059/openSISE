<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>

</head>


<body>
<div class="admin-title">
	<h1>찜 목록 <img src="../img/heart.png" width="45px" height="45px" /></h1>
		<div class="hr2">
			<table border="1">
				<tr>
					<th>매물번호</th>
					<th>매물명</th>
					<th>매물정보</th>
					<th>찜 <img src="../img/heart.png" width="18px" height="18px" />
					</th>
				</tr>
				
			
			</table>
		
		
		</div>
</div>
	<form action="/board/myInfoUpdate" method="post">
			<div class="form-group">
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<!--  <input type="hidden" name="userId" value="${userVo.userId}">-->
						<button type="submit" class="btn btn-default">저장</button>
					</div>
				</div>
				<div class="col-sm-10"></div>
			</div>
		</form>
</body>
</html>