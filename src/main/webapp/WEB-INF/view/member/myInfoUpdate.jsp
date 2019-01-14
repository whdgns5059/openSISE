<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!doctype html>
<html lang="en">
<head>

<script type="text/javascript">
		$(document).ready(function(){
			$("#myPageDuplication").on("click",function(){
				// 사용자가 입력한 email을 memEmail 변수에 저장
				var memberNm = $("#mem_nm").val();
				// 파라미터로 보낼 form 태그 안 input(hidden)에 value 값 저장
				$("#memNm").val(memberNm);
				//form 실행
				$("#fm").submit();
			});
			
// 			if(${nowLogin.mem_email} == null){
// 				$("#mem_nm").attr("readonly", "readonly");
// 			}
			
		});
	       
	</script>
	
<style type="text/css">
	.btn {
    width: 84px;
    border: 1px solid #ffe1af;
    border-width: 1px;
    border-bottom: 4px solid #e8a93f;
    color: #e8a93f;
    background-color: white;
    }
    
    .table {
 	 margin-top: 30px;
 	 background-color: white-space; 
 	 border: solid #f3af3d; 
 	 width:70%;
 	 border-top: 1px solid #eaedef;
 	 border-bottom: 1px solid #eaedef;
 	 border-right : 1px solid #ffffff;
 	 border-left : 1px solid #ffffff;
 	 border-collapse: collapse;
 	 
 }   
 .th{
 	background-color: #f3af3d;
 	color: #fbe9c4;
 }
 
 .th2{
 	color: #848484;
 }
 
 #mem_nm{
 border: none;
 }
 
	</style>
</head>

<body >
<div class="admin-title" align="center" style="margin-top: 10px;">
	<!-- 전체 contents div -->
	<h1>나의 정보 수정</h1>
	<form action="/mypage/updateFinish" method="post">
	<table class="table" border="1">
					<tbody align="center">
						<th class="th">닉네임</th>
						<th class="th2"><label for="memNm" class="control-label"><input type="text" id="mem_nm" 
							<c:if test="${nowLogin.mem_email == null }"> readonly = "readonly" </c:if>
							 name="mem_nm" value="${nowLogin.mem_nm }"  class="form-control"	 required autofocus>
						<input type="submit" id="myPageDuplication" class="form-control" value="중복확인"/></label></th>
					</tbody>
					
					<tbody align="center">
						<th class="th">ID</th>
						<th class="th2"><label for="memEmail" class="control-label"><input type="email" id="mem_email" readonly="readonly"  name="mem_email" value="${nowLogin.mem_email}" class="form-control"  required autofocus></label></th>
					</tbody>
					
					<tbody align="center">
						<th class="th">성별</th>
						<th class="th2">
							<input type="radio" name="mem_gndr" value="M" <c:if test="${nowLogin.mem_gndr eq 'M'}">checked</c:if>>남 
							<input type="radio" name="mem_gndr" value="F" <c:if test="${nowLogin.mem_gndr eq 'F'}">checked</c:if>>여
						</th>
					</tbody>
					
					<tbody align="center">
						<th class="th">연령대</th>
						<th class="th2">
							<label>	<select id="ageList" name="mem_age" class="form-control">
								<c:forEach items="age" var="memAge">
								<option value="">${nowLogin.mem_age}</option>
								<option value="10대">10대</option>
								<option value="20대">20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대">50대</option>
								<option value="60대">60대 이상</option>
								</c:forEach>
							</select></label>
						</th>
					</tbody>
					
					<tbody align="center">
						<th class="th">직장정보</th>
						<th class="th2">
							<label>	<select id="jobLiset" name="mem_job" class="form-control">
<%-- 							<option value="">${memberVo.job_nm}</option> --%>
								<c:forEach items="${JobList}" var="mem">
								<option value="${mem.job_no}" <c:if test="${mem.job_no == nowLogin.job_no }"> selected </c:if> >${mem.job_nm}</option>
								</c:forEach>
							</select></label>
						</th>
					</table>
						
				<div class="submitBtnDiv">
					<input type="submit" id="modified_Y" class="btn" value="수정완료" />
				</div>
		</form>
		<form action="/mypage/myPageDuplication" id="fm" method="post">
			<input type="hidden" id="memNm" name="memNm">
		</form>
		</div>
</body>
</html>
