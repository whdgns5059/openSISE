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

		});
	       
	</script>
</head>

<body >
<div class="admin-title">
	<!-- 전체 contents div -->
	<h1>나의 정보</h1>
	<div class="hr2">
	<div class="row" style="height: 850px !important">
		<form action="/mypage/updateFinish" method="post">
			<div class="logoInputCenter">
				<div class="logoInputDiv">
					<ul>
					
						<li>
							<label for="inputEmail" id="necessary">
								<span>* 닉네임</span>
								<input type="text" id="mem_nm" name="mem_nm" value="${param.memNm}"  class="form-control"	placeholder="${memberVo.mem_nm }" required autofocus>						
						 	</label>
						 	
						 	<div id="duplicate" >
								<c:if test="${msg == 0}">
									<span id="y">:: 사용가능한 닉네임 입니다.</span>	
								</c:if>
								<c:if test="${msg >= 1}">
									<span id="n">:: 중복된 닉네임 입니다.</span>	
								</c:if>
							</div>
						</li>
						<li>
							<label for="inputEmail" id="necessary">
								<span>* 이메일</span>
								<input type="text" id="mem_email" name="mem_email"  class="form-control" placeholder="${memberVo.mem_email}" required autofocus>
								
							</label> 
						</li>
						<li>
						<span>성별 선택</span>
							<input type="radio" name="mem_gndr" value="M" <c:if test="${memberVo.mem_gndr eq 'M'}">checked</c:if>>남 
							<input type="radio" name="mem_gndr" value="F" <c:if test="${memberVo.mem_gndr eq 'F'}">checked</c:if>>여
						</li>
						<li>
						<span>직업정보 선택</span>
							<select id="jobLiset" name="mem_job" class="form-control">
								<option value="">${memberVo.job_nm}</option>
								<c:forEach items="${JobList}" var="mem">
								<option value="${mem.job_no}">${mem.job_nm}</option>
								</c:forEach>
							</select>
						</li>
						
						<li>
						<span>연령대 선택</span>
							<select id="ageList" name="mem_age" class="form-control">
								<c:forEach items="age" var="memAge">
								<option value="">${memberVo.mem_age}</option>
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
						<li><input type="submit" id="myPageDuplication" class="form-control" value="중복확인"/></li>
						<li><input type="button" class="form-control" value="인증"/></li>
					</ul>				
				</div>
				<div class="submitBtnDiv">
					<input type="submit" id="modified_Y" class="btn btn-outline-primary" value="수정완료" />
				</div>
			</div>
		</form>
		</div>
		<form action="/mypage/myPageDuplication" id="fm" method="post">
			<input type="hidden" id="memNm" name="memNm">
		</form>
		</div>
</div>		
</body>
</html>
