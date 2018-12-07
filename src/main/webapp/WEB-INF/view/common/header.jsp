<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.logo-tag{
	padding: 5px 40px 0 30px;
}
.navbar { 
	margin-bottom : 0px !important; 
	width: 100%;
	height: 90px !important;
	border:0px;
	background-color: #f3af3d;
}

.navline{
	width: 100%;
	height: 3px;
	background:#3a589e; 
}
.top-menu li a{
	color: #ffffff;
}
.top-menu li a:hover {
  color: #d3741b;
  text-decoration: none;
}
</style>
<script>
function switchPage(bc){
	var house = document.getElementById("house");
	var apt = document.getElementById("apt");
	var office = document.getElementById("office");
	var store = document.getElementById("store");
	house.style.color = "#ffffffc7";
	apt.style.color = "#ffffffc7";
	office.style.color = "#ffffffc7";
	store.style.color = "#ffffffc7";
	
	bc.style.color= "white";
	
	document.getElementById("loc").value = "";
	
}
	


</script>

<!-- navbar시작 -->
<nav class="navbar navbar-expand-lg navbar-dark" >
	<!-- openSISE아이콘 -->
	<a class="navbar-brand logo-tag" href="/index/openPage">
		<img alt="오픈시세" title="오픈시세!" src="/logo/openSise_logo_white.png" width="100px;">
	</a>

	<!-- nav items -->
	<div class="collapse navbar-collapse">
		<ul class="navbar-nav mr-auto bc-select">
			<!-- 선택되어 있는 BC에게 active 클래스를 추가합니다 -->
			<li class="nav-item" id="house" onclick="switchPage(this)">단/다세대 주택</li>
			<li class="nav-item" id="apt" onclick="switchPage(this)">아파트</li>
			<li class="nav-item" id="office" onclick="switchPage(this)">오피스텔</li>
			<li class="nav-item" id="store" onclick="switchPage(this)">상가</li>
			<li class="nav-item" id="auction" onclick="switchPage(this)">법원경매</li>
		</ul>
	</div>
	<!-- 오른쪽 상단 배치// 예: 로그인, 회원가입등 -->
	<div class="nav_right">
		<ul class="top-menu">
			<!-- memVo가 null인 경우 -->
			<li><a href="/login/selectLogin">로그인</a></li>
			<li><a href="/login/signup">회원가입</a></li>
			<!-- 관리자일 경우에 생기는 a tag  -->
			<li><a href="/manage/dataTrade/dataTrade">관리자</a></li>
			<!-- 로그인 한 경우에 생기는 a tag  -->
			<li><a href="/mypage/myinfo">나의 정보</a></li>
			<li><a href="/">{회원의 닉네임}</a></li>
		</ul>
	</div>

</nav>
<div class="navline"></div>
<!-- navbar끝 -->

