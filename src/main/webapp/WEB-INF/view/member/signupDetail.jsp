<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!doctype html>
<html lang="en">
<head>
<style type="text/css">
.logo{
	margin: 100px 0 50px 250px;
	padding: 20px 400px 50px 500px;
	width: 1303px;
}	

.button{
	margin: 100px 0 50px 250px;
	padding: 20px 400px 50px 500px;
	width: 1303px;
	height:300px ;
}

#chk1{
	font-size: 160%;
}

</style>
</head>

<body class="text-center">
	<!-- 전체 contents div -->
	<div class="row" style="height: 850px !important">
	
		<form action="/login/signupDetail" method="post">
			<h3 class="logo">관심사 정보 입력</h3>
			
			<div class="button">
				<div class="buttons">
					<label for="inputEmail" id="chk1">
						<c:forEach items="${intrstList}" var="mem">
							<input type="checkbox" id="chk1" name="intrst_nm" value="${mem.intrst_no }"	 required autofocus>${mem.intrst_nm }
						</c:forEach>
				 	</label>
				 </div>
					<br/>
			<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="등록" />
			</div>
		</form>
		
	</div>
</body>
</html>
