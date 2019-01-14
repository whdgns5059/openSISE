<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
 		
 		if($("#building").val() == "house"){
 			var multi = document.getElementById("house");
 			multi.style.color = "white";
 		}else if ($("#building").val() == "apt"){
 			var apt = document.getElementById("apt");
 			apt.style.color = "white";
 		}else if ($("#building").val() == "office"){
 			var office= document.getElementById("office");
 			office.style.color = "white";
 		}else if($("#building").val() == "store"){
 			var store = document.getElementById("store");
 			store.style.color = "white";
 		}else if($("#building").val() == "auction"){
 			var auction = document.getElementById("auction");
 			auction.style.color = "white";
 		}
 		
 		
 		var mem_no = ${nowLogin.mem_no == null ? 0 : nowLogin.mem_no};
 		
 		
  		$('.chatroom').on('click', function(e){
 	
 			e.preventDefault();	
 			
/*  			$.ajax({
 				type : 'POST',
 				url : '/chat/chatroom',
 				data : {
 					mem_no : mem_no
 				},
 				success : function(data){
					var chatPopup = window.open("", "", "width=500, height=800, location=no");
					chatPopup.document.write(data);
					
					var chk_chat = setInterval(function(){
						if(chatPopup.closed){
							
							exitChat();
							clearInterval(chk_chat);
						}
					},500);
 				}
 			});	 */
 			
 			var chatPopup = window.open("http://192.168.203.110:3000","userChat", "width=500, height=800")
 		});
 		
 		
 		$('.chatlobby').on('click', function(e){
 	
 		 	e.preventDefault();	
 			/*	
 			$.ajax({
 				type : 'POST',
 				url : '/chat/lobby',
 				data : {
 					mem_no : mem_no
 				},
 				success : function(data){
					var chatPopup = window.open("", "", "width=500, height=800, location=no");
					chatPopup.document.write(data);
 				}
 			});	 */
 			
 			var chatPopup = window.open("http://192.168.203.110:3000", "adminChat","width=500, height=800")
 		});
 		
 		function exitChat(){
 			
 			$.ajax({
 				type:'POST',
 				url:'/chat/exit',
 				data : {
 					mem_no : mem_no
 				},
 				success : function(data){
 					if(data == true)
 						alert('채팅종료');
 				}
 			});
 		}
 		
 	
 	});
 	
	function switchPage(bc) {
		var building = bc.id;
		
		/* 시세 페이지와 경매 페이지 구분하기 */
		if(building == 'auction'){
			location.href = "/auction/auction";
		}else{
			var searchName
			if($("#loc").val() == null){
				$("#searchName").val("");
			}else{
				searchName = document.getElementById('loc').value;
				$("#searchName").val(searchName);
			}
			$("#building").val(building);
			
			if($("#searchName").val() == ""){
				$("#dl_t").val("매매");
			}
	
			$("#fmi").submit();
		}
	}
	
</script>

<script type="text/javascript">
	var test = "${nowLogin.mem_nm}";
</script>

<!-- navbar시작 -->
<nav class="navbar navbar-expand-lg navbar-dark">
	<form action="/main/main" id="fmi">
		<input type="hidden" id="building" name="building" value="${building}"> 
		<input type="hidden" id="searchName" name="searchName">
		<input type="hidden" id="dl_t" name="dl_ty" value="${dlType}">
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
			<li class="nav-item" id="house" onclick="switchPage(this)">단/다세대 주택</li>
			<li class="nav-item" id="apt" onclick="switchPage(this)">아파트</li>
			<li class="nav-item" id="office" onclick="switchPage(this)">오피스텔</li>
			<li class="nav-item" id="store" onclick="switchPage(this)">상가</li>
			<li class="nav-item" id="auction" onclick="switchPage(this)">법원경매</li>
		</ul>
	</div>
	
	<!-- 오른쪽 상단 배치// 예: 로그인, 회원가입등 -->
	<div class="navC">
		<div class="nav_right">
			<ul class="top-menu">
				<!-- memVo가 null인 경우 -->
				<li>
					<c:if test="${nowLogin == null && kakaoLogin == null}">
						<a href="/login/selectLogin" style="display: inline-block;">로그인</a>&emsp;
						<a href="/login/signup" style="display: inline-block;" >회원가입</a>
					</c:if>
				</li>
				
				<!-- 관리자일 경우에 생기는 a tag -->
	 			<li>
					<c:if test="${nowLogin.mem_mngr!= null}">
						${nowLogin.mem_nm} 관리자님 안녕하세요  &emsp;
						<a href="/manage/dataTrade/dataTrade" style="display: inline-block;">관리정보</a>&emsp;
						<a href="/login/logout" style="display: inline-block;">로그아웃</a>
					</c:if>
				</li>
				
				<!-- 로그인 한 경우에 생기는 a tag  -->
				<li>
					<c:if test="${nowLogin.mem_nm!= null && nowLogin.mem_mngr == null}">
						${nowLogin.mem_nm} 님 안녕하세요  &emsp;
						<a href="/mypage/myInfo" style="display: inline-block;">나의 정보</a>&emsp;
						<a href="/chat/chatroom" class="chatroom" style="display: inline-block;">채팅 문의</a>&emsp;
						<a href="/login/logout" style="display: inline-block;">로그아웃</a>
					</c:if>
				</li>
				
				<li>
					<c:if test="${kakaoLogin != null }">
						${kakaoLogin} 님 안녕하세요  &emsp;
						<a href="/mypage/myInfo" style="display: inline-block;">나의 정보</a>&emsp;
						<a href="/chat/chatroom" class="chatroom" style="display: inline-block;">채팅 문의</a>&emsp;
						<a href="/login/logout" style="display: inline-block;">로그아웃</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- 데코 라인 -->
<div class="navline"></div>
<!-- navbar끝 -->


