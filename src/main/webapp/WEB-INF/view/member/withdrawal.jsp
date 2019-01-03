
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<head>
<script type="text/javascript">
$(document).ready(function(){
	$("#modified_N").on("click",function(){
		$.modal("close");
	});
});
</script>
<style type="text/css">
.modal a.close-modal {
    position: absolute;
    top: 3.5px;
    right: 2.5px;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
    background-size: contain;
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<%-- left --%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="form-group" style="margin-top: 100px;">
					<div align="center">
						<img src="../img/Warning.png" width=90px" height="80px" />
						<h1 >회원 탈퇴</h1></br></br> 
						<p align="center">오픈시세 홈페이지를 탈퇴하시면 </br> 
						오픈시세 회원약관 및 개인정보 제공,활용에 관한 약관동의가 취소됩니다.</p></br> 
					</div>
					<hr>
					<!-- Modal HTML embedded directly into document -->
			<div id="ex1" class="modal" style="padding: 30px 25px 50px 25px;">
				<div align="center">
					<h2>회원탈퇴</h2></br>
					<p>유의 사항 확인후 탈퇴 신청을 해주세요</p>
				</div>
				
				<div style="background-color:#E6E6E6;  border-radius: 5px; font-size: 14px; ">
					<li>회원 탈퇴시 오픈시세로 가입된 모든 서비스를 사용할수 없습니다</li>			  
					<li>오픈시세로 서비스를 가입/사용 하면서 축적된 정보 및 기록은 모두 </br>&emsp;&ensp;삭제되며,복구가 불가능합니다</li>		
						<!-- <option value="${mem.job_no}">${mem.job_nm}</option> -->
				</div></br></br>
				
				<p align="center">오픈시세 탈퇴 이유를 선택해주세요</p>
				<div style="border: 1px solid #E6E6E6; border-radius: 5px;">
					<input type="checkbox">개인정보 누출 우려</input>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="checkbox">제재조치로 이용 제한됨</input></br>
					<input type="checkbox">이용할만한 기능/서비스 부족</input>&emsp;&emsp;&ensp;
					<input type="checkbox">사생활 기록 삭제 목적</input></br>
					<input type="checkbox">시스템 품질에대한 불만(잦은오류/오작동 등)</input></br>
					<input type="checkbox"/>
					<input type="text" placeholder="직접입력" style="border-radius: 5px;"></input>
				</div></br>
				
				<input type="checkbox"> 위 내용을 모두 확인하였으며, 해지시 모든 정보가 복구 </br>&ensp; 불가능함에 동의합니다</input></br></br>
				
			  <div id="ex1" align="center">
			  	<a href="#" rel="modal:close">탈퇴취소</a>&emsp;
			  	<a href="#ex2" rel="modal:open">다음</a>
			  </div>
			</div>
			
			
			
			
			<div id="ex2" class="modal" style="padding: 30px 25px 50px 25px;">
			<form action="/mypage/Withdrawal" method="post">
				<div align="center">
					<h2>회원탈퇴</h2></br>
					<p>회원정보 확인후 탈퇴가 완료 됩니다.</p>
				</div>
				
				
				<div>
					<label for="inputEmail" class="sr-only">Email</label> 
						<input type="email" id="userId" name="mem_email" class="form-control" value="${memberVo.mem_email }" placeholder="이메일을 입력하세요" required autofocus> 
					<label for="inputPassword" class="sr-only">Password</label> 
						<input type="password" id="inputPassword" name="mem_pass" class="form-control" placeholder="비밀번호를 입력하세요" required>
				</div>
				</br>
				
			  	<div  align="center">
					<input type="button" id="modified_N"  value="탈퇴취소" />
					<input type="submit" id="modified_Y"  value="탈퇴완료" />
				</div>
			  
			  	</form>
			</div>
			<!-- Link to open the modal -->
			<p align="center"><a href="#ex1" rel="modal:open">탈퇴하기</a></p>
			
				</div>
			</div>
		</div>
	</div>
</body>
</html>
