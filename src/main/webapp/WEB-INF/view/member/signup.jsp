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
		
		$(document).ready(function(){
			$("#duplication").on("click",function(){
				// 사용자가 입력한 email을 memEmail 변수에 저장
				var memberNm = $("#userNm").val();
				// 파라미터로 보낼 form 태그 안 input(hidden)에 value 값 저장
				$("#memNm").val(memberNm);
				//form 실행
				$("#fm").submit();
				
			});
			
			/*$("#duplication").on("click",function(){
	            var memberNm = $("#userNm").val();
	            $.ajax({
	               contentType : "application/json; charset=utf-8",
	               url:"/login/duplication",
	               type: "GET",
	               //파라미터 보낼 값
	               data : "memNm="+memberNm,
	               //요청이 성공했을 때(controller에서 돌아왔을 때)
	               // dt: controller 에서 보내는 값 (ex: model.addAttribute(key,value))
	               // dt -> {mem_nm : 늘보, mem_email:brown}
	               success: function(dt){
	                  var html="";
	                  /* html += "<c:if test='${msg == 0}'>";
	                  html += "<span id='y'>:: 사용가능한 닉네임 입니다.</span>";
	                  html += "</c:if>";
	                  html += "<c:if test='${msg >= 1}'>";
	                  html += "<span id='n'>:: 중복된 닉네임 입니다.</span>";
	                  html += "</c:if>"; 
	                  
	                  
	                  
	                  if(dt.msg ==0){
	                	  html += "<span id='y'>:: 사용가능한 닉네임 입니다.</span>";
	                  }else{
	                	  html += "<span id='n'>:: 중복된 닉네임 입니다.</span>";	  
	                  }
	                  $("#duplicate").html("");
	                  $("#duplicate").html(html);
	               }
	            });
	         });
			
		*/
		});
			
	       
	</script>

<style type="text/css">

ul{list-style-type:none;}
.logo{
	margin: 50px 0 50px 350px;
	padding: 20px 100px 20px 250px;
	width: 300px;
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

#duplicate{
	margin-top: 0;
}

#y{
	color: green;
}
#n{
	color: red;
}

#duplication{
	margin: 0 0 14px 0;
}

#duplicate{
	padding: 0 0 0 15px;
}
.logoInputCenter{margin:0 auto;width:1000px;}
.logoInputDiv{float:left;margin:20px 0 0 600px ;}
.logoInputBtn{float:left; padding: 20px 0 0 0px;}
.submitBtnDiv{clear:left;width:80px;  padding: 30px 0 30px 720px;}
</style>
</head>

<body class="text-center">
	<!-- 전체 contents div -->
	<div class="row" style="height:850px !important">
	
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
								<input type="text" id="userNm" name="mem_nm" value="${param.memNm}"  class="form-control"	placeholder="닉네임을 입력하세요" required autofocus>						
						 	
						 	<div id="duplicate" >
								<c:if test="${msg == 0}">
									<span id="y">   사용가능한 닉네임 입니다.</span>	
								</c:if>
								<c:if test="${msg >= 1}">
									<span id="n">* 중복된 닉네임 입니다.</span>	
								</c:if>
							</div>
						 	</label>
						</li>
						<li>
						
							<label for="inputEmail" id="necessary">
								<span>*</span>
								<input type="text" id="userId" name="mem_email"  class="form-control" placeholder="이메일을 입력하세요" required autofocus>
								
							</label> 
						</li>
						<li>
							<label for="inputEmail" id="necessary">
								<span>*</span>
								<input type="password" id="inputPassword" name="mem_pass" class="form-control" placeholder="비밀번호를 입력하세요" required>
							</label>
						</li>
						<li>
							<input type="radio"  id="male" name="mem_gndr" value="M">남자&emsp;&emsp;&emsp;
							<input type="radio"  id="female" name="mem_gndr" value="F">여자	
						</li>
						<li>
							<select id="jobLiset" name="mem_job" class="form-control">
								<option value="">직장정보를 선택해 주세요</option>
								<c:forEach items="${JobList}" var="mem">
								<option value="${mem.job_no}">${mem.job_nm}</option>
								</c:forEach>
							</select>
						</li>
						
						<li>
							<select id="ageList" name="mem_age" class="form-control">
								<c:forEach items="age" var="memAge">
								<option value="">연령대를 선택해 주세요</option>
								<option value="10대">10대</option>
								<option value="20대">20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대">50대</option>
								<option value="60대">60대 이상</option>
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
						<li><input type="submit" id="duplication" class="form-control" value="중복확인"/></li>
						<li><input type="button" class="form-control" value="인증"/></li>
					</ul>				
				</div>
				<div class="submitBtnDiv">
					<input type="submit" id="Sign_in" class="btn btn-outline-primary" value="회원가입" />
				</div>
			</div>
		</form>
		</div>
		<form action="/login/duplication" id="fm" method="post">
			<input type="hidden" id="memNm" name="memNm">
		</form>
		
		
</body>
</html>
