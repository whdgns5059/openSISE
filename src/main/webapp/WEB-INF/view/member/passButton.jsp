<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<style type="text/css">
.logo{
	padding 10px 10px 10px 10px;
	margin: 100px 0 10px 50px;
	width: 400px;
	height: 300px;
}	
.button{
	margin : 100px 0 20px 50px;
	width:300px ;
	height:300px ;
}	

#Sign_in{
margin : 50px 0 20px 0;
	width:220px ;
}

#passButton{
	margin: 10px;
	width: 80%;
}

</style>
</head>

<body class="text-center">
	<!-- 전체 contents div -->
	<div class="row" style="height: 850px !important">
	
		<form action="/login/passChk" method="post">
		<div class="logo">
			<img src="/img/lock.png" width="50px" height="50px" alt="비밀번호 찾기"> 비밀번호 찾기 
			<p> 가입한 이메일 정보 입력후 인증 메일 받기를 클릭하세요.</p>
			
			<div class="button">
				<label for="inputEmail" class="sr-only"></label> 
					<input type="text" id="mememail" name="mem_email" class="form-control" value="" placeholder="이메일을 입력하세요" required autofocus> 
			
			<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="인증메일 받기"" />
			</div>
			</div>
		</form>
		
	</div>
</body>
</html>
