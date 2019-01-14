<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="../css/swiper.min.css">
<!-- 약관동의  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
// 회원동의 아코디언 
   $(function() {
      $("#accordion").accordion({
         heightStyle : "fill"
      });

      $("#accordion-resizer").resizable({
         minHeight : 140,
         minWidth : 200,
         resize : function() {
            $("#accordion").accordion("refresh");
         }
      });
   });
</script>




<!-- Demo styles -->
<style>
.bgColor {
   background-color:#e0dada !important
}

.bgColorChange {
   background-color:orange !important
}

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
    margin: 0 auto;
    padding-bottom: 100px;
    padding-top: 100px;
    /* padding: 20px 100px 20px 250px; */
    width: 300px;
}
.swiper-button-next, .swiper-button-prev {
    position: absolute;
    top: 58%;
    width: 792px;
    height: 33px;
    margin-top: 159px;
    z-index: 10;
    cursor: pointer;
    background-size: 12px 50px;
    background-position: center;
    background-repeat: no-repeat;
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

#accordion {
    display: block;
    height: 398px;
    overflow: scroll !important;
    width: 480px;
}

.contentWrapper {
    height: 980px;
    width: 100%;
    margin: 0 auto;
    overflow-y: hidden;
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

			<div class="swiper-wrapper" style="touch-action:none;">
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
									class="form-control" value="중복확인" /></li>
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
									<option value="">연령대를 선택해 주세요</option>
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
								<button type="button" class="multiselect dropdown-toggle form-control inst" data-toggle="dropdown" title="None selected">관심사를 선택해 주세요</button>
									<ul class="multiselect-container dropdown-menu">
										<li>
											<a href="javascript:void(0);">
								 		 	  <c:forEach items="${intrstList}" var="mem">
								 		 	  	<label class="checkbox">
								 		 			  	<input class="chkName" type="checkbox" value="${mem.intrst_no }">${mem.intrst_nm}
									 		 	 </label>
									 		 	 </br>
								 		 	  </c:forEach> 
											</a>
										</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>  
				
				<div class="swiper-slide"> 
					 <div id="accordion-resizer" class="ui-widget-content">
         <div id="accordion">
            <h3 class="bgColor" id="firstH3">OpenSise 이용약관 동의(필수)</h3>
            <div>
               <p>여러분을 환영합니다. 오픈시세 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은
			                  다양한 오픈시세 서비스의 이용과 관련하여 오픈시세 서비스를 제공하는 오픈시세 주식회사(이하 ‘오픈시세’)와 이를
			                  이용하는 오픈시세 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 오픈시세 서비스 이용에
			                  도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 오픈시세 서비스를 이용하시거나 오픈시세 서비스 회원으로 가입하실
			                  경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기
			                  바랍니다. 다양한 오픈시세 서비스를 즐겨보세요.오픈시세 www.naver.com을 비롯한 오픈시세 도메인의 웹사이트 및
			                  응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의
			                  생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종
			                  단말기를 통해 각양각색의 오픈시세 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스상의
			                  안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다. 네이버는 기본적으로
			                  여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스
			                  제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용
			                  시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의
			                  안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다. 네이버 서비스에는 기본적으로 본 약관이 적용됩니다만
			                  네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예,
			                  네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE,
			                  SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당
			                  서비스초기 화면에서 확인해 주시기 바랍니다. 회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수
			                  있습니다.여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원
			                  가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에
			                  로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은
			                  자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정
			                  운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요. 네이버는 단체에 속한 여러 구성원들이 공동의
			                  계정으로 네이버서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및
			                  아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다.
			                  단체회원은관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을
			                  운용합니다. 따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할
			                  수 있고,버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제
			                  포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의
			                  단체회원계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다. 단체회원 계정 사용에서의 관리자, 멤버
			                  등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서
			                  확인해주시기 바랍니다. 여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.네이버는 여러분이 게재한 게시물이 네이버 서비스를
			                  통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는
			                  자신이보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로
			                  구성된 각종 콘텐츠 자체 또는 파일을 말합니다. 네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을
			                  약속드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다. 한편, 네이버
			                  서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시,
			                  배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이
			                  없는 라이선스)이 필요합니다. 게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한
			                  권리를 보유하고 있어야 합니다. 네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는
			                  바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한
			                  연구,웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할
			                  것입니다. 만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고
			                  동의를 받도록 하겠습니다. 또한 여러분이 제공한 소중한 콘텐츠는 오픈시세 서비스를 개선하고 새로운 네이버 서비스를
			                  제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는
			                  지속적인 연구개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다. 오픈시세
			                  여러분이 자신이 제공한 콘텐츠에 대한 오픈시세 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록
			                  다양한 수단을제공하기 위해 노력하고 있습니다. 여러분은 오픈시세 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이
			                  제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개,
			                  검색결과 제외등의 조치를 요청할 수 있습니다. 다만, 일부 오픈시세 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수
			                  있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.
			                  여러분의개인정보를 소중히 보호합니다.</p>
                  <input type="checkbox" name="U_checkAgreement1" id="U_checkAgreement1" value="" /> 약관동의
            </div>
            
            
            <h3 class="bgColor" id="firstH4">개인정보 수집 및 이용에 대한 안내(필수)</h3>
            <div>
               <p>정보통신망법 규정에 따라 오픈시세에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및
			                  이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 1. 수집하는
			                  개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수
			                  있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할
			                  경우, 오픈시세는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 회원가입 시점에 오픈시세가 이용자로부터
			                  수집하는 개인정보는 아래와 같습니다. - 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증
			                  휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인
			                  정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고
			                  선택항목으로 이메일 주소를 수집합니다. - 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소,
			                  가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를
			                  선택항목으로 수집합니다. 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. 오픈시세 내의 개별
			                  서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수
			                  있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목,
			                  개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다. 서비스 이용 과정에서 IP
			                  주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 구체적으로 1) 서비스 이용
			                  과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자
			                  기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다. 네이버
			                  위치기반서비스 이용 시 수집·저장되는 위치정보의 이용 등에 대한 자세한 사항은 ‘네이버 위치정보 이용약관’에서 규정하고
			                  있습니다. 2. 수집한 개인정보의 이용 네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스
			                  개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. - 회원 가입 의사의
			                  확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등
			                  회원관리를 위하여 개인정보를 이용합니다. - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석,
			                  서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형
			                  서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. - 법령 및 네이버
			                  이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에
			                  대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리
			                  등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다. - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금
			                  결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다. - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등
			                  마케팅 및 프로모션 목적으로 개인정보를 이용합니다. - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계,
			                  서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다. - 보안, 프라이버시, 안전
			                  측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다. 3. 개인정보의 파기
			                  회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보 보관기간에
			                  대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를
			                  안전하게 보관합니다. 전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간
			                  정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본
			                  정보를 다른 목적으로는 절대 이용하지 않습니다. - 전자상거래 등에서 소비자 보호에 관한 법률 계약 또는 청약철회 등에
			                  관한 기록: 5년 보관 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 소비자의 불만 또는 분쟁처리에 관한 기록:
                  3년 보관 - 전자금융거래법 전자금융에 관한 기록: 5년 보관 - 통신비밀보호법 로그인 기록: 3개월</p>
                  <input type="checkbox" name="U_checkAgreement3" id="U_checkAgreement3" value="" /> 약관동의
            </div>

            <h3 class="bgColor" id="firstH5">위치정보 이용약관 동의(선택)</h3>
            <div>
               <p>위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 오픈시세 위치기반 서비스를
			                  이용할 수 있습니다. 제 1 조 (목적) 이 약관은 오픈시세 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는
			                  위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로
			                  합니다. 제 2 조 (약관 외 준칙) 이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률,
			                  정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및
			                  개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다. 제 3 조 (서비스 내용 및 요금) ①회사는 직접 위치정보를
			                  수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다. 1.Geo
			                  Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.
			                  2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를
			                  제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다. 3.위치정보를 활용한
			                  친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다. 4.연락처 교환하기: 위치정보를
			                  활용하여 친구와 연락처를 교환할 수 있습니다. 5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용
			                  과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다. 6. 이용자 보호 및 부정
			                  이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을
			                  차단합니다. 7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는
			                  개인위치정보주체가 지정한 제3자에게 공유합니다. 8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의
			                  경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의
			                  서비스를 제공합니다. ②제1항 위치기반서비스의 이용요금은 무료입니다. 제 4 조 (개인위치정보주체의 권리)
			                  ①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는
			                  자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다. ②개인위치정보주체는 개인위치정보의
			                  수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. ③개인위치정보주체는 언제든지 개인위치정보의
			                  수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적
			                  수단을 갖추고 있습니다. ④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에
			                  오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
			                  1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료 2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및
			                  이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용 ⑤회사는 개인위치정보주체가 동의의
			                  전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다.
			                  단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
			                  ⑥개인위치정보주체는 제1항 내지 제4항 의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수
			                  있습니다. 제 5 조 (법정대리인의 권리) ①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자
			                  하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다. ②법정대리인은 만14세 미만 아동의
			                  개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수
			                  있습니다. 제 6 조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간) 회사는 위치정보의 보호 및 이용 등에
			                  관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에
			                  자동으로 기록하며, 6개월 이상 보관합니다. 상호: 오픈시세 주식회사 주소: 대전광역시 중구 중앙로 76 영민빌딩 2층
                  203호 전화번호: 010-6351-4419 이메일 주소: openSise@naver.com 부칙 제1조 시행일
                  2015년 6월 2일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2015년 11월 26일부터
                  	적용됩니다.</p>
                  	  <input type="checkbox" name="U_checkAgreement4" id="U_checkAgreement4" value="" /> 약관동의
            </div>
         </div>
      </div>

				</div>
				
				<div class="swiper-slide"> 
				</div>
			</div>

			<!-- Add Arrows -->
			<div class="swiper-button-next swiper-next-img-none" id="next" style="font-family: 'Do Hyeon', sans-serif; font-size: 17pt;">필수사항 입력완료</div>
		</div>
	</form>
	
    <div>
     <p>,,</p>
    </div>

	<form action="/login/duplication" id="fm" method="post">
		<input type="hidden" id="memNm" name="memNm">
	</form>
  
	<form action="/login/duplication2" id="fmm" method="post">
		<input type="hidden" id="memEmail" name="memEmail"> <input
			type="hidden" id="memNm2" name="memNm">
	</form>
	  
	<!-- Swiper JS -->
<script src="../js/swiper.min.js"></script>
  
 
<script type="text/javascript">
	// 중복확인 이벤트
	$(document).ready(function() {
		var swiper = new Swiper('.swiper-container', {
			navigation : {
				nextEl : '.swiper-button-next',
			},
			allowTouchMove : false
		});
		swiper.on('slideNextTransitionStart', function () {
			if($("#userNm").val() == "" || $("#userId").val() == "" || $("#inputPassword").val() == ""){
				alert("필수입력사항입니다. 전체 입력해 주세요.");
				swiper.destroy();
			}else {
 				if (document.getElementById('next').innerText == '필수사항 입력완료') {
					$("#next").html("선택사항 입력완료");
				} else if(document.getElementById('next').innerText == '선택사항 입력완료'){
					$("#next").html("회원가입");
					$("#next").css("margin-top", "390px");
				}else {
					 if($("#U_checkAgreement1").is(":checked") == false){
				         alert("OpenSise 이용약관에 동의해주세요");
				         swiper.destroy();
				      }else if($("#U_checkAgreement2").is(":checked") == false){
				         alert("개인정보 수집및 이용에대한 안내에 동의해주세요");
				         swiper.destroy();
				      }else {
				    	  alert("회원가입이 완료되었습니다.로그인해주세요");
				         $("#frm").submit();
				      }
					//$("#frm").submit();
				}
			}
		});
		
		$("#duplication").on("click", function() {
			if($("#userNm").val() == ""){
				alert("닉네임을 입력해 주세요.");
			}else {
			// 사용자가 입력한 email을 memEmail 변수에 저장
			var memberNm = $("#userNm").val();
			// 파라미터로 보낼 form 태그 안 input(hidden)에 value 값 저장
			$("#memNm").val(memberNm);
			//form 실행
			$("#fm").submit();
			}
		});
	});

	// 이메일 인증  
	$(document).ready(function() {
		$("#duplication2").on("click", function(event) {
			if($("#userId").val() == "" && $("#userNm").val() == "" || $("#userId").val() != "" && $("#userNm").val() == ""){
				alert("닉네임을 입력해 주세요.");
				event.preventDefault();
			}else if($("#userId").val() == "" && $("#userNm").val() != ""){
				alert("이메일을 입력해 주세요.");
				event.preventDefault();
			}else {
			// 사용자가 입력한 email을 memEmail 변수에 저장
			var memberEmail = $("#userId").val();
			// 파라미터로 보낼 form 태그 안 input(hidden)에 value 값 저장
			$("#memEmail").val(memberEmail);
			var memberNm = $("#userNm").val();
			$("#memNm2").val(memberNm);
			//form 실행
			$("#fmm").submit();
			}
		});
		
		// 비밀번호 찾기 alert
		var msgNo = '${msgNo}';
		var msgOk = '${msgOk}';
		if(msgNo != ""){
			alert(msgNo);
		}
		if(msgOk != ""){
			alert(msgOk);
		}
		

	});
			// 1동의버튼 클릭시 색상처리
		/*    $("#U_checkAgreement1").on("click",function(){
		       $("#firstH3").removeClass("bgColor");
		       $("#firstH3").addClass("bgColorChange");
		    });
		  // 2동의버튼 클릭시 색상처리
		    $("#U_checkAgreement2").on("click",function(){
		       $("#firstH4").removeClass("bgColor");
		       $("#firstH4").addClass("bgColorChange");
		    });
		 // 3동의버튼 클릭시 색상처리
		    $("#U_checkAgreement3").on("click",function(){
		       $("#firstH5").removeClass("bgColor");
		       $("#firstH5").addClass("bgColorChange");
		    }); */

		$(".chkName").on("change", function(){
			console.log(this.value)
			if($(".inst").html() == "관심사를 선택해 주세요"){
				$(".inst").html($(this).parent().text());
			}else{
				$(".inst").append("," + $(this).parent().text());
			}
		});

</script>
</body>
</html>