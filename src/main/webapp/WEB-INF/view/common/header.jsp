<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	.navbar { margin-bottom : 0px !important; border:0px;}
	.navbar-nav { height: 70px !important}
</style>

<!-- navbar시작 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
	<!-- openSISE아이콘 -->
	<a class="navbar-brand" href="/index/openPage">
<!-- 		<img src="https://via.placeholder.com/250x70"> -->
	<img alt=""
			src="/logo/openSise_logo.png" width="60px;">
	</a>

	<!-- nav items -->
	<div class="collapse navbar-collapse" id="navbarColor01" >
<!-- 		<ul class="navbar-nav mr-auto" > -->
<!-- 			<li class="nav-item active"> -->
<!-- 				<img src="https://via.placeholder.com/800x70" /> -->
<!-- 			</li> -->
<!-- 		</ul> -->
		<ul class="navbar-nav mr-auto" style="font-size: large; padding-top: 20px;">
			<li class="nav-item active"><a class="nav-link" href="#">단/다세대 주택</a></li>
			<li class="nav-item"><a class="nav-link" href="#">아파트</a></li>
			<li class="nav-item"><a class="nav-link" href="#">상가</a></li>
			<li class="nav-item"><a class="nav-link" href="#">법원경매</a></li>
		</ul>

		<!-- 오른쪽 상단 배치// 예: 로그인, 회원가입등 -->
		<div style="width: 600; height: 70px; float: right;" >
			<ul class="navbar-nav mr-auto" style="font-size: large; padding-top: 20px;">
				<li class="nav-item"><a class="nav-link" href="/mypage/myinfo">나의 정보</a></li>
				<li class="nav-item"><a class="nav-link" href="/login/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/signup/signup">회원가입</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- navbar끝 -->

