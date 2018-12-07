<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<style type="text/css">
/* ────────── COMMON ──────────*/
*{margin:0px;padding:0px;box-sizing:border-box;}
html, body{height:100%;}
#wrap {
	width:100%;height:100%;display:flex;justify-content:center;align-items:center;
	background-image:url("images/opensiseLogo.png");background-size:100% 100%;background-repeat:no-repeat;
}
ul{list-style-type:none;}

/* ────────── SECTION ────────── */
.section{width:500px;}
.section > .opensiseLogo{text-align:center;}
.section > .section_signUp {
	margin-top:20px;border-radius:10px;
	width:500px;box-shadow:0px 0px 10px #000;
}
.section > .section_signUp > form > ul {
	display:block;
}
.section > .section_signUp > form > ul > li:first-child{position:relative;}
.section > .section_signUp > form > ul > li:nth-child(2){position:relative;}
.section > .section_signUp > form > ul > li:nth-child(3){position:relative;}
.section > .section_signUp > form > ul > li:first-child > span{position:absolute;color:#f00;right:105px;top:5px;}
.section > .section_signUp > form > ul > li:nth-child(2)> span{position:absolute;color:#f00;right:105px;top:55px;}
.section > .section_signUp > form > ul > li:nth-child(3) > span{position:absolute;color:#f00;right:5px;top:105px;}
.section > .section_signUp > form > ul > li > .nameInput {
	border:none;background-color:rgba(255,255,255,0.8);width:399px;;height:50px;font-size:16px;outline:none;font-weight:bold;
	text-indent:10px;display:block;float:left;border-radius:10px 0px 0px 0px;border-bottom:1px solid #e4e4e4;transition: all 0.5s;
}
.section > .section_signUp > form > ul > li > .nameBtn {
	float:left;width:100.5px;height:50px;border:none;background-color:rgba(255,255,255,0.8);border:1px solid #e4e4e4;outline:none;cursor:pointer;font-size:16px;
	letter-spacing:-0.5px;border-radius:0px 10px 0px 0px;transition:all 0.5s;font-weight:bold;
}
.section > .section_signUp > form > ul > li > .nameBtn:hover {
	background-color:rgba(255,240,0,0.8);
}
.section > .section_signUp > form > ul > li > .emailInput {
	border:none;background-color:rgba(255,255,255,0.8);width:399px;;height:50px;font-size:16px;outline:none;
	text-indent:10px;display:block;clear:left;float:left;border-bottom:1px solid #fff;transition:all 0.5s;font-weight:bold;
}
.section > .section_signUp > form > ul > li > .emailBtn {
	float:left;;width:100.5px;height:50px;border:none;background-color:rgba(255,255,255,0.8);border:1px solid #e4e4e4;outline:none;cursor:pointer;font-size:16px;
	letter-spacing:-0.5px;transition:all 0.5s;font-weight:bold;
}
.section > .section_signUp > form > ul > li > .emailBtn:hover {
	background-color:rgba(255,240,0,0.8);
}
.section > .section_signUp > form > ul > li > .passwordInput {
	border:none;background-color:rgba(255,255,255,0.8);width:100%;height:50px;font-size:16px;outline:none;font-weight:bold;
	text-indent:10px;display:block;clear:left;float:left;border-bottom:1px solid #e4e4e4;margin-top:-2px;transition:all 0.5s;
}
.mw{width:100%;height:50px;display:flex;justify-content:center;align-items:center;background-color:rgba(255,255,255,0.8);transition:all 0.5s;font-weight:bold;}
.mw:hover{background-color:rgba(255,240,0,0.8);}
.mw > .w_radio, .mw > .m_radio{display:block;vertical-align:middle;margin-top:4px;width:20px;height:20px;}
input[type="checkbox"]:checked:after {
	width:20px;height:20px;border-radius:20px;top:-1px;left:-1px;position:relative;content:'';display:inline-block;
	visibility:visible;box-shadow:0px 0px 20px rgba(255,240,0,1);
}
.mw > .m_span, .mw > .w_span{margin-left:10px;vertical-align:middle;}
.mw > .w_radio{margin-left:20px;}
.jobs {
	width:100%;height:50px;outline:none;font-size:16px;text-indent:10px;background-color:rgba(255,255,255,0.8);transition:all 0.5s;cursor:pointer;
	font-weight:bold;border:1px solid #e4e4e4;
}
.jobs:hover{background-color:rgba(255,240,0,0.8);}
.signUpBtn {
	width:100%;height:50px;border:none;background-color:rgba(255,255,255,0.8);border:1px solid #e4e4e4;outline:none;cursor:pointer;
	font-size:16px;border-radius:0px 0px 10px 10px;transition:all 0.5s;font-weight:bold;
}
.signUpBtn:hover{background-color:rgba(255,240,0,0.8);}
.mainBtn{color:#000;font-size:16px;float:right;margin-top:16px;letter-spacing:-1px;}
</style>

<div id="wrap">
	<div class="section">
		<div class="opensiseLogo">
			<img src="images/logos.png">
		</div>
		<div class="section_signUp">
			<form action="" method="post">
				<ul>
					<li>
						<input type="text" class="nameInput" placeholder="닉네임을 입력해주세요" required autofocus>
						<input type="button" value="중복확인" class="nameBtn">
						<span>*</span>
					</li>
					<li>
						<input type="email" class="emailInput" placeholder="이메일을 입력해주세요" required>
						<input type="button" value="중복확인" class="emailBtn">
						<span>*</span>
					</li>
					<li>
						<input type="password" class="passwordInput" placeholder="비밀번호를 입력해주세요" required>
						<span>*</span>
					</li>
				</ul>
				<div class="mw">
					<input type="checkbox" class="m_radio" />
					<span class="m_span">남자</span>
					<input type="checkbox" class="w_radio" />
					<span class="w_span">여자</span>
				</div>
				<select class="jobs">
					<option>직장정보</option>
					<option>테스트1</option>
					<option>테스트2</option>
				</select>
				<input type="submit" value="회원가입" class="signUpBtn">
			</form>
		</div>
		<a href="#" class="mainBtn">메인화면으로 가기</a>
	</div>
</div>

























