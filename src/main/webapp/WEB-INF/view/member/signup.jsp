<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
ul{list-style-type:none;}
.logo{
	margin: 100px 0 50px 250px;
	padding: 20px 400px 50px 500px;
	width: 1303px;
}	
.button{
	margin : 80px 0 20px 50px;
	padding: 10px 0 20px 0;
	width:300px ;
	height:300px ;
}	

.buttons{
	padding: 5px 0 5px 0;
}

#Sign_in{
margin : 50px 0 20px 0;
	width:220px ;
}

#necessary{
	color: red;
}

#necessary span {
	float: left;
	height: 35px;
	line-height: 35px;
	margin-right: 10px;
}

#necessary input[type=text] {
	float: left;
	width: 90%;
}

#necessary input[type=password] {
	float: left;
	width: 90%;
}
.logoInputCenter{margin:0 auto;width:500px;}
.logoInputDiv{float:left;}
.logoInputBtn{float:left;margin-left:-20px;}
.submitBtnDiv{clear:left;width:500px;margin:0 auto;}
</style>
</head>

<body class="text-center">
	<!-- 전체 contents div -->
	<div class="row" style="height: 850px !important">
	
		<form action="/login/signUpSelection" method="post">
		<div class="logo">
			<img src="/img/openSise_signin.png"  alt="오픈시세 회원가입" title="오픈시세 회원가입" />
		</div>
			<div class="logoInputCenter">
				<div class="logoInputDiv">
					<ul>
						<li>
							<label for="inputEmail" id="necessary">
								<span>*</span>
								<input type="text" id="userNm" name="mem_nm" value="" class="form-control"	placeholder="닉네임을 입력하세요" required autofocus>						
						 	</label>
						</li>
						<li>
						
							<label for="inputEmail" id="necessary">
								<span>*</span>
								<input type="text" id="userId" name="mem_email" value="" class="form-control" placeholder="이메일을 입력하세요" required autofocus>
							</label> 
						</li>
						<li>
							<label for="inputEmail" id="necessary">
								<span>*</span>
								<input type="password" id="inputPassword" name="mem_pass" value="" class="form-control" placeholder="비밀번호를 입력하세요" required>
							</label>
						</li>
						<li>
							<strong>성별</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio"  id="male" name="mem_gndr" value="M">남자
							<input type="radio"  id="female" name="mem_gndr" value="F">여자	
						</li>
						<li>
							<strong>직장정보</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select id="jobLiset" name="mem_job">
								<c:forEach items="${JobList}" var="mem">
								<option value="${mem.job_no}">${mem.job_nm}</option>
								</c:forEach>
							</select>
						</li>
						<li>
							<p id="necessary">* 필수입력사항</p>
						</li>
				 	</ul>
				</div>
				
				<div class="logoInputBtn">
					<ul>
						<li><input type="button" class="form-control" value="중복확인"/></li>
						<li><input type="button" class="form-control" value="중복확인"/></li>
					</ul>				
				</div>
				<div class="submitBtnDiv">
					<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="회원가입" />
				</div>
			</div>
		</div>
		</form>
		
	</div>
</body>
</html>
