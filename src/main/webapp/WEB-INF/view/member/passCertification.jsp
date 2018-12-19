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
	<div class="contents" align="center" style="margin-top: 100px;">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form action="/login/passFinsh" method="post">
				<div class="blog-header">
					<h2>비밀번호 변경</h2>
					<h6>신규 비밀번호를 입력해 주세요!</h6>
					<hr>
				</div>
				<div class="form-group">
					 <!-- <label><input type="email" class="form-control" id="mem_email" name="mem_email" value="${memberVo.mem_email}" /> </label></br> -->
				</div>
				<div class="form-group">
					<label><input type="password" class="form-control" id="mem_new_pass" name="mem_new_pass" placeholder="새 비밀번호 입력" /> </br>
					<input type="password" class="form-control" id="memPass" name="memPass" placeholder="비밀번호 재확인" /> </label>
				</div>
				</br>
				
				<div class="col-sm-offset-2 col-sm-10">
	     			<button type="submit" class="btn btn-default">변경</button>
				</div>
				
				</form>
			</div>
	</div>
</body>
</html>
