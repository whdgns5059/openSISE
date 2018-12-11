<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<script type="text/javascript">
		function getCookie(cookieName){
			//cookieString = > document.cookie
			var cookies = document.cookie.split("; ");
			
			var cookieValue = "";
			for(var i=0; i< cookies.length; i++){
				var str  = cookies[i];
				if(str.startsWith(cookieName + "=")){
					cookieValue = str.substring((cookieName + "=").length);
				}
			}
			
			return cookieValue;
		}
	</script>
	
	<script type="text/javascript">
	 function showPopup() { 
		 window.open("/login/pass", "popButten", "width=400, height=300, left=100, top=50"); }
	

	</script>
<style type="text/css">
.contents {
    margin: 0 auto;
    width: 390px;
}
.logo{
    margin-top: 165px;
    width: 390px;
}	
.button{
    margin: 0 auto;
    margin-top: 100px;
    width: 300px;
    height: 190px;
}	

#Sign_in{
    margin: 0 auto;
    margin-top: 16px;
    width: 220px;
    display: block;
}

#passButton{
	margin: 10px;
	width: 80%;
}

</style>
</head>

<body>
	<!-- 가운데정렬 div -->
	<div class="contents">
	
		<form action="/login/openLogin" method="post">
		<div class="logo">
			<img src="/img/openSise_login.png"  alt="오픈시세 로그인" title="오픈시세 로그인 " />
			
			<div class="button">
				<label for="inputEmail" class="sr-only">Email</label> 
					<input type="text" id="userId" name="mem_email" class="form-control" value=""	placeholder="아이디 입력하세요" required autofocus> 
				<label for="inputPassword" class="sr-only">Password</label> 
					<input type="password" id="inputPassword" name="mem_pass" class="form-control" value="brownpass" required>
			
				<label> <input type="button" id="optionModifyBtn" class="form-control" value="비밀번호 찾기" onclick="showPopup();">
				</label><br/>
			<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="Sign in" />
			</div>
			</div>
		</form>
		
	</div>
</body>
</html>
