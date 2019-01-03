<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		$(document).ready(function(){
			$("#modified_N").on("click",function(){
				$.modal("close");
			});
		});
		
	</script>
	
	
<style type="text/css">
.logo{
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

.btns1{
	width: 63px;
    border: 1px solid #ffe1af;
    border-width: 1px;
    border-bottom: 4px solid #e8a93f;
    color: #e8a93f;
    text-transform: uppercase;
    margin: 0 0 0 61px;
    background-color: white;
}

.btns2{
	width: 63px;
    border: 1px solid #ffe1af;
    border-width: 1px;
    border-bottom: 4px solid #e8a93f;
    color: #e8a93f;
    text-transform: uppercase;
    margin: 0 60px;
    background-color: white;
}

.modal a.close-modal {
    position: absolute;
    top: -3.5px;
    right: 1.5px;
    display: block;
    width: 21px;
    height: 30px;
    text-indent: -9999px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
    background-image: 

</style>
</head>

<body>
	<!-- 가운데정렬 div -->
	<div class="contents" align="center" style="margin: 100px;">
	
		<form action="/login/openLogin" method="post">
		<div class="logo">
			<img src="/img/openSise_login.png"  alt="오픈시세 로그인" title="오픈시세 로그인 " />
			
			<div class="button">
				<label for="inputEmail" class="sr-only">Email</label> 
					<input type="email" id="userId" name="mem_email" class="form-control" value=""	placeholder="아이디 입력하세요" required autofocus> 
				<label for="inputPassword" class="sr-only">Password</label> 
					<input type="password" id="inputPassword" name="mem_pass" class="form-control" value=""  placeholder="비밀번호를 입력하세요"  required>
			
			
			<!-- Link to open the modal -->
			<p style="font-size: 10pt; margin-top: 5px; "><a href="#ex1" rel="modal:open">비밀번호 찾기</a></p>
				<br/>
			<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="Sign in" />
			</div>
			</div>
		</form>
		
		<!-- Modal HTML embedded directly into document -->
			<div id="ex1" class="modal">
			<form action="/login/mailSender" id="fm" method="post">
			<!-- <input type="hidden" id="memNm" name="memNm"> -->
				<h3 align="center" >비밀번호 찾기</h3></br>
			  	<p align="center" >인증 받으실 이메일을 작성해 주세요</p>
			  	<input type="email" class="form-control" id="memEmail" name="memEmail" placeholder="이메일을 입력하세요" required></input>
			  	</br>
			  	
				  <div  align="center" style="font-family: 'Do Hyeon', sans-serif; ">
					<!-- <a href="#close-modal" id="modified_N" rel="modal:close" class="btns">닫기</a> -->
					<input type="button" id="modified_N" class="btns1" value="닫기" />
					<input type="submit" id="modified_Y" class="btns2" value="인증" />
				  </div>
				  </form>
			</div>
		
	</div>
</body>
</html>
