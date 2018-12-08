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
.logo{
	margin: 150px 0 100px 250px;
	padding: 20px 400px 50px 500px;
	width: 1303px;
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
	
		<form action="/login/openLogin" method="post">
		<div class="logo">
			<img src="/img/openSise_login.png"  alt="오픈시세 로그인" title="오픈시세 로그인 " />
			
			<div class="button">
				<label for="inputEmail" class="sr-only">Email address</label> 
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
