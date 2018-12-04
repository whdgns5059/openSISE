<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.tab-yellow .nav-link, .tab-yellow .nav-link.disabled, .tab-yellow .nav-link.disabled:hover, 
.tab-yellow .nav-link.disabled:focus{
	border-color: #f4b344;
}
.tab-yellow {
	border-color: #f4b344;
}
.tab-yellow .nav-link:hover, .tab-yellow .nav-link:focus {
	background: #f4b344;
}
.tab-green .nav-link, .tab-green .nav-link.disabled, .tab-green .nav-link.disabled:hover, 
.tab-green .nav-link.disabled:focus{
	border-color: #aad035;
}
.tab-green {
	border-color: #aad035;
}
.tab-green .nav-link:hover, .tab-green .nav-link:focus {
	background: #aad035;
}
</style>

<div class="admin-title">
	<h2>회원통계</h2>
	<div class="hr2"></div>
	<div>
		<div class="square yellow"></div><h5>가입한 회원 수 그래프</h5>
		<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#daily-in">일별-daily</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#monthly-in">월별-monthly</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#age-in">연령별-age</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#gender-in">성별-gender</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade show active" id="daily-in">
				<p>일별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="monthly-in">
				<p>월별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="age-in">
				<p>연령별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="gender-in">
				<p>성별 회원 가입 통계 그래프 입니다.</p>
			</div>
		</div>
	</div>
	<br/>
	<div>
		<div class="square green"></div><h5>탈퇴한 회원 수 그래프</h5>
		<ul class="nav nav-tabs tab-green">
			<li class="nav-item"><a class="nav-link tab-green show" data-toggle="tab" href="#daily-out">일별-daily</a></li>
			<li class="nav-item"><a class="nav-link tab-green" data-toggle="tab" href="#monthly-out">월별-monthly</a></li>
			<li class="nav-item"><a class="nav-link tab-green" data-toggle="tab" href="#age-out">연령별-age</a></li>
			<li class="nav-item"><a class="nav-link tab-green" data-toggle="tab" href="#gender-out">성별-gender</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade show active" id="daily-out">
				<p>일별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="monthly-out">
				<p>월별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="age-out">
				<p>연령별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="gender-out">
				<p>성별 회원 가입 통계 그래프 입니다.</p>
			</div>
		</div>
	</div>


</div>