<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

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

	</script>
<style type="text/css">
.logo{
   margin: 100px 0 50px 300px;
    width: 390px;
}	
.button{
    margin: 0 auto;
    margin-top: 80px;
    width: 250px;
    height: 190px;
}	

#Sign_in{
    margin: 0 auto;
    margin-top: 50px;
    width: 220px;
    display: block;
}

#optionModifyBtn{
	margin : 10px 0 0 75px;
	width: 100px;
	height: 10px;
	font-size: 7pt;
	padding-bottom: 15px;
}

#userId{
	margin: 0 0 5px 0;
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
					<input type="password" id="inputPassword" name="mem_pass" class="form-control" value="wzvnn425" required>
			<!-- Modal HTML embedded directly into document -->
			<div id="ex1" class="modal">
			  <p>Thanks for clicking. That felt good.</p>
			  <a href="#" rel="modal:close">Close</a>
			</div>
			
			<!-- Link to open the modal -->
			<p><a href="#ex1" rel="modal:open">Open Modal</a></p>
				<br/>
			<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="Sign in" />
			</div>
			</div>
		</form>
		
	</div>
</body>
</html>
