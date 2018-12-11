<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- left contents -->
	
<style type="text/css">
ul { list-style : none; }	
.memberLeft {
    width: 12%;
    padding-left: 18px;
    padding-right: 20px;
    float: left;
    border-right: 1px solid #e2e2e2;
}
.left-menu li{
	font-size: 15px;
	color: #757575;
}
.left-menu li a{
	padding-left: 20px;
	font-size: 14px;
	color: #757575;
}
.mngr-logout{
    margin-top: 200px;
    margin-bottom: 30px;
    text-align: center;
    font-size: 12px;
}
.mngr-logout a{
	color: #e8a93f;
}

	
</style>

<div class="memberLeft">
	<br/>	
	<ul class="left-menu">
		<li><a href="/mypage/myInfo">나의 정보</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><a href="/manage/dataEtc/dataEtc">찜 목록</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><a href="/manage/ban/ban">최근 본 매물</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><a href="/statis/pageCount/pageCount">보안설정</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><a href="/statis/pageCount/pageCount">회원탈퇴</a></li>
	</ul>
</div>

