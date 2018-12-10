<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.logo-tag{
    width: 10%;
    line-height: 67px;
    margin-right: 0;
    margin-left: 46px;
}

.navbar {
	margin-bottom: 0px !important;
	width: 100%;
	height: 90px !important;
	border: 0px;
	background-color: #f3af3d;
}

.navline {
	width: 100%;
	height: 3px;
	background: #3a589e;
}
.top-menu li a{
	display: block;
	color: #ffffff;
}

.top-menu li a:hover {
	color: #d3741b;
	text-decoration: none;
}
</style>
<script>
 	$(document).ready(function(){
 		
 		if($("#building").val() == "multi"){
 			var multi = document.getElementById("multi");
 			multi.style.color = "white";
 		}else if ($("#building").val() == "apt"){
 			var apt = document.getElementById("apt");
 			apt.style.color = "white";
 		}else if ($("#building").val() == "office"){
 			var office= document.getElementById("office");
 			office.style.color = "white";
 		}else{
 			var store = document.getElementById("store");
 			store.style.color = "white";
 		}
 		
 		
 	});
 	
	function switchPage(bc) {
		var building = bc.id;
		var searchName = document.getElementById('loc').value;
		//document.getElementById("loc").value = "";

		$("#building").val(building);
		$("#searchName").val(searchName);

		$("#fmi").submit();

	}
</script>

<!-- navbar시작 -->
<nav class="navbar navbar-expand-lg navbar-dark">
	<form action="/main/main" id="fmi">
		<input type="hidden" id="building" name="building" value="${building}"> 
		<input type="hidden" id="searchName" name="searchName">
	</form>
	<!-- openSISE아이콘 -->
	<a class="navbar-brand logo-tag" href="/index/openPage"> <img
		alt="오픈시세" title="오픈시세!" src="/logo/openSise_logo_white.png"
		width="100px;">
	</a>

	<!-- nav items -->
	<div class="collapse navbar-collapse bc-select-div">
		<ul class="navbar-nav mr-auto bc-select">
			<!-- 선택되어 있는 BC에게 active 클래스를 추가합니다 -->
			<li class="nav-item" id="multi" onclick="switchPage(this)">단/다세대 주택</li>
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

<!-- 데코 라인 -->
<div class="navline"></div>
<!-- navbar끝 -->

