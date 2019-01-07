<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="../css/swiper.min.css">

<!-- Swiper JS -->
<script src="../js/swiper.min.js"></script>


<script type="text/javascript">
	// 중복확인 이벤트
	$(document).ready(function() {
		var swiper = new Swiper('.swiper-container', {
			navigation : {
				nextEl : '.swiper-button-next',
			},
		});

		$("#next").on("click", function() {
			if (document.getElementById('next').innerText == '다음') {
				$("#next").html("회원가입");
			} else {
				$("#frm").submit();
			}
		});

		$("#duplication").on("click", function() {
			// 사용자가 입력한 email을 memEmail 변수에 저장
			var memberNm = $("#userNm").val();
			// 파라미터로 보낼 form 태그 안 input(hidden)에 value 값 저장
			$("#memNm").val(memberNm);
			//form 실행
			$("#fm").submit();
		});
	});

	// 이메일 인증  
	$(document).ready(function() {
		$("#duplication2").on("click", function() {
			// 사용자가 입력한 email을 memEmail 변수에 저장
			var memberEmail = $("#userId").val();
			// 파라미터로 보낼 form 태그 안 input(hidden)에 value 값 저장
			$("#memEmail").val(memberEmail);

			var memberNm = $("#userNm").val();
			$("#memNm2").val(memberNm);

			$.ajax({
				type : "POST",
				url : "/login/duplication2",
				data : {
					memEmail : memberEmail,
					memNm : memberNm
				},
				success : function() {
					var html;
					html += "<span>메일이 발송 되었습니다.</span>";

					$("#test").html("");
					$("#test").html(html);
				}
			});
			//form 실행
			//$("#fmm").submit();

		});

	});
	

</script>

<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #fff;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-button-next, .swiper-button-prev {
	position: absolute;
	top: 50%;
	width: 744px;
	height: 25px;
	margin-top: 159px;
	z-index: 10;
	cursor: pointer;
	background-size: 12px 50px;
	background-position: center;
	background-repeat: no-repeat;
}

ol, ul, dl {
	margin-top: 0;
	margin-bottom: 745px;
}

.auth {
	float: left;
	margin-left: 10px;
}

#passCheck {
	margin-right: 100px;
}

.logo {
	margin: 50px 0 50px 350px;
	padding: 20px 100px 20px 250px;
	width: 300px;
}

#y {
	color: green;
}

#n {
	color: red;
}

.form-control {
	margin-bottom: 9px;
}
</style>
</head>
<body>
	<!-- Swiper -->
	<div class="logo" align="center">
		<img src="/img/openSise_signin.png" alt="오픈시세 회원가입" title="오픈시세 회원가입" />
	</div>
	<form action="/login/signUpSelection" id="frm" method="post">
		<div class="swiper-container">

			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="logoInputDiv">
						<ul style="list-style: none">
							<div>
								<li class="auth"><label for="inputEmail" id="necessary">
										<input type="text" id="userNm" name="mem_nm"
										value="${param.memNm}" class="form-control"
										placeholder="닉네임을 입력하세요" required autofocus>

										<div id="duplicate">
											<c:if test="${msg == 0}">
												<span id="y"> 사용가능한 닉네임 입니다.</span>
											</c:if>
											<c:if test="${msg >= 1}">
												<span id="n">* 중복된 닉네임 입니다.</span>
											</c:if>
										</div>
								</label></li>
								<li class="auth"><input type="submit" id="duplication"
									class="form-control" value="중복확인" /></li>
							</div>
							<div>
								<li class="auth"><label for="inputEmail" id="necessary">
										<input type="email" id="userId" name="mem_email"
										value="${param.memEmail}" class="form-control"
										placeholder="이메일을 입력하세요" required autofocus>
								</label></li>

								<li class="auth"><input type="submit" id="duplication2"
									class="form-control" value="메일인증" /></li>
							</div>
							<li id="passCheck"><label for="inputEmail" id="necessary">
									<input type="password" id="inputPassword" name="mem_pass"
									class="form-control" placeholder="비밀번호를 입력하세요" required>
							</label></li>
						</ul>
					</div>
				</div>

				<div class="swiper-slide">
					<ul class="signMenu" style="list-style: none">
						<li style="margin-bottom: 12px;"><input type="radio"
							id="male" name="mem_gndr" value="M">남자&emsp;&emsp;&emsp;
							<input type="radio" id="female" name="mem_gndr" value="F">여자
						</li>
						<li style="margin-bottom: 12px;"><select id="jobLiset"
							name="mem_job" class="form-control">
								<option value="0">직장정보를 선택해 주세요</option>
								<c:forEach items="${JobList}" var="mem">
									<option value="${mem.job_no}">${mem.job_nm}</option>
								</c:forEach>
						</select></li>

						<li><select id="ageList" name="mem_age" class="form-control">
								<c:forEach items="age" var="memAge">
									<option value="0">연령대를 선택해 주세요</option>
									<option value="10대">10대</option>
									<option value="20대">20대</option>
									<option value="30대">30대</option>
									<option value="40대">40대</option>
									<option value="50대">50대</option>
									<option value="60대">60대 이상</option>
								</c:forEach>
						</select></li>

						<li>
							<select class="form-control" id="comm" multiple="multiple" name="comm[]" style="display: none;">
								<c:forEach items="${intrstList}" var="mem">
									<option value="0">관심사를 선택해 주세요</option>
									<option value="abc" data-id="0">이럴꺼면</option>
									<option value="xyz" data-id="0">selectbox가 </option>
									<option value="pqr" data-id="0">왜있냐</option>
									<option value="mno" selected="selected" data-id="24">어?</option>
								</c:forEach> 
							</select>
							<div class="btn-group">
								<button type="button" class="multiselect dropdown-toggle form-control" data-toggle="dropdown" title="None selected">관심사를 선택해 주세요</button>
									<ul class="multiselect-container dropdown-menu">
										<li>
											<a href="javascript:void(0);">
								 		 	  <label class="checkbox">
								 		 	  		<c:forEach items="${intrstList}" var="mem">
								 		 			  	<input type="checkbox" value="${mem.intrst_no }">${mem.intrst_nm}</br>
								 		 			 </c:forEach> 
								 		 	  </label>
											</a>
										</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<!-- Add Arrows -->
			<div class="swiper-button-next swiper-next-img-none " id="next" style="font-family: 'Do Hyeon', sans-serif; font-size: 17pt;">다음</div>
		</div>
	</form>


	<form action="/login/duplication" id="fm" method="post">
		<input type="hidden" id="memNm" name="memNm">
	</form>

	<form id="fmm" method="post">
		<input type="hidden" id="memEmail" name="memEmail"> <input
			type="hidden" id="memNm2" name="memNm">
	</form>
</body>
</html>