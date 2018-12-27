<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- left contents -->
	
<style type="text/css">
ul { list-style : none; }	
.adminLeft {
    width: 13%;
    min-width:230px;
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

<div class="adminLeft">
	<br/>	
	<ul class="left-menu">
		<li><b>회원 관리</b></li>
		<li><a href="/admin/member">회원 목록</a></li>
		<li><a href="/manage/member/interest">관심사</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><b>데이터 관리</b></li>
		<li><a href="/manage/dataTrade/dataTrade">실거래 데이터</a></li>
		<li><a href="/manage/dataEtc/dataEtc">기타 데이터</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><b>사이트 관리</b></li>
		<li><a href="/manage/notice/notice">공지사항</a></li>
		<li><a href="/manage/review/review">리뷰관리</a></li>
		<li><a href="/manage/report/report">신고관리</a></li>
		<li><a href="/manage/ban/ban">금지어 관리</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><b>통계 관리</b></li>
		<li><a href="/statis/member">회원통계</a></li>
		<li><a href="/statis/favor">인기건물</a></li>
		<li><a href="/statis/interest">관심사통계</a></li>
		<li><a href="/statis/visitor">방문자수</a></li>
		<li><a href="/statis/pageCount">페이지사용량</a></li>
	</ul>
	<hr/>
	<ul class="left-menu">
		<li><b>기타 관리</b></li>
		<li><a href="#">광고문의</a></li>
		<li><a href="#">1:1 채팅</a></li>
	</ul>
	<hr/>
	<div class="mngr-logout">
		<a href="/">관리자 로그아웃</a>
	</div>
</div>

