<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>openSISE</title>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 

<style type="text/css">
.navC{
	width: 100%;
	height: 50px;
}
.nav_right{
	width:500px;
	height: 50px;
	display:inline-block;
	float: right;
}
.top-menu{
    line-height: 28px;
}
td {
	width: 450px;
	white-space:nowrap; 
	overflow:hidden; 
	text-overflow:ellipsis; 
}
.logo{
    margin: 0 auto;
    margin-bottom: 50px;
    padding: 20px 0;
    width: 300px;
}
.button{
    margin: 0 auto;
    width: 864px;
    height: 96px;
}
.buttons{
    margin: 0 18px;
    width: 180px;
    display: inline-block;
    float: left;
}
.btn{
	padding:9px;
	width: 180px;
}
.align-center{
	margin: 0 auto;
}
.search{
    width: 1028px;
    height: 50px;
    line-height: 50px;
    margin: 0 auto;
}
.searchF{
	margin-top: 1rem;
}
.searchBtn{
    width: 100px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    padding: 8px;
    background-color: #ffae24;
    border-bottom: 4px solid #4159a9;
}
.searchBtn:hover{
	 border-bottom: 4px solid #626f9c;
}
.searchBox{
    width: 900px;
    min-width: 738px;
    height: 49px;
    border: solid 2px #e8a93f;
    border-radius: 0.3rem;
    padding-left: 1rem;
}
.board{
    width: 1200px;
    height: 500px;
    margin: 88px auto;
    margin-bottom: 200px;
}
.picture{
	width:590px ;
	height:450px ;
	display: inline-block;
	float: left;
}
.notice{
    width: 590px;
    height: 450px;
    display: inline-block;
    float: right;
    border: 1px solid #bbbbbb;
}
.notice-top{
	width: 518px;
    height: 70px; 
    display: block;
}
.notice-top h6{
    width: 150px;
    float: left;
    font-weight: bold;
    font-size: 30px;
    color: #3a589e;
}
.see-more{
	width: 54px;
    text-align: center;
    color: #808080;
    background-color: transparent;
    border: none;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 12px;
    float: right;
}
.see-more:hover{
	color: black;
}
.notice-word{
    margin: 28px 36px;
    width: 518px;
    height: 394px;
}
.notice-cont{
    width: 568px;
    height: 324px;
    font-size: 22px;
    font-variant: all-petite-caps;
}
.word-over{
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
}

input:disabled {
    background: #99460e;
}
.bottom{
	width: 100%;
    height: 200px;
}
.bottom-in{
    margin: 0 auto;
    margin-top: 30px;
    width: 500px;
    height: 200px;
    background-image: url(/logo/openSise_logo_f3af3d.png);
    background-size: 200px;
    background-position: top;
    background-repeat: no-repeat;
    background-color: rgba(255, 255, 255, 0.45);
}
.bottom-in p{
    padding-top: 20px;
    float: left;
    text-align: center;
    height: 140px;
    width: 500px;
    color: #000000b5;
    font-size: 13px;
    background-color: rgba(255, 255, 255, 0.7);
}


/* 팝업으로 뜨는 윈도우 css  */ 
.window{
    left: 50%;
    width: 1000px;
    height: 700px;
    background-color: #FFF;
    z-index: 10000;
    border-radius: 20px;
    position: fixed;
    margin-left: -25%;
    top: 50%;
    margin-top: -350px;
    overflow: auto;
    padding: 30px 20px 20px 20px;
    display: none;
}
.window h2{
    float: left;
    display: contents;
}
.close{
	font-size: 14px;
	color: black;
}
.notice-pop{
 	margin: 0 auto;
    width: 850px;
    height: 566px;
	overflow:scroll;
	overflow-x:hidden; 
	overflow-y:auto;
}
.notice-tbl{
    margin: 0 auto;
    width: 830px;
    height: 566px;
}
.notice-content{
	padding: 8px 90px !important;
}
</style>

<!-- bxSlider 연결 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->


<!-- layer popup -->
<script type="text/javascript"> 
//<![CDATA[
    function wrapWindowByMask(){
    	
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
 
        //윈도우(팝업창) 띄운다.
        $(".window").show();
 
    }
 
    
    //건물 분류 선택하기
    function getBC(bc){
    	$('#searchText').attr("readonly",false);
    	
    	$('#searchText').attr("placeholder","지역명, 아파트명을 입력하세요.");
    	var house = document.getElementById("house");
    	var apt = document.getElementById("apt");
    	var office = document.getElementById("office");
    	var store = document.getElementById("store");
    	house.style.backgroundColor = "transparent";
    	house.style.color = "#e8a93f";
    	apt.style.backgroundColor = "transparent"
    	apt.style.color = "#e8a93f";
    	office.style.backgroundColor = "transparent"
    	office.style.color = "#e8a93f";
    	store.style.backgroundColor = "transparent"
    	store.style.color = "#e8a93f";
    	
        bc.style.color = "#f1ebe0";
		bc.style.backgroundColor = "#f4b344";
		$("#building").val(bc.value);
		
    }
    
    // 공지사항 window 내용 fade 효과
    function noticeFade(id){
		var the = "#" + id;
		$(the).fadeToggle("fast");
	}
    
    
    $(document).ready(function(){
    	
    	$("#searchName").val("");
    	
		//검은 막 띄우기
		$(".openMask").click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$(".window .close").click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$("#mask, .window").hide();
		});

		//검은 막을 눌렀을 때
		$("#mask").click(function() {
			$(this).hide();
			$(".window").hide();

		});

		//search
		$("#search").click(function() {
			if($("#building").val()=="" || $("#building").val()== null){
				alert("최소한의  건물 분류는 선택해주세요");
			}else{
				$(".searchF").submit();
			}
		})

		//bxslider
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			slideWidth : 600
		});
		
		$.ajax({
			type : "POST",
			url : "/index/noticeList",
			success : function(data){
				var html = data;
				// 지우는 작업
				$("#noticeList").html("");
				// 다시 입히는 방법 
				$("#noticeList").html(html);
				
			}
			
		});
		
		// 비밀번호 찾기 alert
			var msg = '${msg}';
			if(msg != ""){
				alert(msg);
			}

		
	});

	//]]>
</script>
</head>
<body>
	<!-- navigation -->
	<div class="navC">
		<!-- nav_right -->
		<div class="nav_right">
			<ul class="top-menu">
				<!-- memVo가 null인 경우 -->
				<li><c:if test="${nowLogin == null && kakaoLogin == null }">
					<a href="/login/selectLogin">로그인</a>&emsp;
					<a href="/login/signup">회원가입</a>
					</c:if></li>
					
				
				<!-- 관리자일 경우에 생기는 a tag -->
 				<li><c:if test="${nowLogin.mem_mngr!= null}">
					${nowLogin.mem_nm} 관리자님 안녕하세요  &emsp;
					<a href="/manage/dataTrade/dataTrade">관리정보</a>&emsp;
					<a href="/login/logout">로그아웃</a>
				</c:if></li>
 				
				<!-- 로그인 한 경우에 생기는 a tag -->
				<li><c:if test="${nowLogin.mem_nm!= null && nowLogin.mem_mngr == null }">
					${nowLogin.mem_nm } 님 안녕하세요  &emsp;
					<a href="/mypage/myInfo">나의 정보</a>&emsp;
					<a href="/login/logout">로그아웃</a>
				</c:if></li>
	
				<li><c:if test="${kakaoLogin != null }">
					${kakaoLogin} 님 안녕하세요  &emsp;
					<a href="/mypage/myInfo">나의 정보</a>&emsp;
					<a href="/login/logout">로그아웃</a>
				</c:if></li>
			</ul>
		</div>
	</div>
	
	<!-- contents -->
	<div class="contents">
	
		<!-- logo -->
		<div class="logo">
			<img src="/logo/openSise_logo2.png" width="300px"/>
		</div>
		
		<!-- button -->
		<div class="button">
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="house" value="house" onclick="getBC(this)">단/다세대</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="apt" value="apt" onclick="getBC(this)">아파트</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="office" value="office" onclick="getBC(this)">오피스텔</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="store" value="store" onclick="getBC(this)">상가</button>
			</div>
		</div>
		
		<!-- search -->
		<div class="search align-center">
				<form class="searchF" action="/main/main">
					<input id="searchText" name="searchName" class="searchBox mr-sm-4" type="text"
						placeholder="건물 분류를 먼저 선택해 주세요" readonly="readonly">
					<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">시세보기</button>
					<input type="hidden" id="bc_type"/>
					<input type="hidden" id="building" name="building"/>
					<input type="hidden" id="dl_ty" name="dl_ty" value="매매"/>
				</form>
		</div>
			
		<!-- board -->
		<div class="board">
		
			<!-- picture -->
			<div class="picture" >
				<!-- bxslider -->
				<div class="bxslider">
				  <div><img src="/img/open4.jpg" style="width:580px; height:435px;"></div>
				  <div><img src="/img/open6.png" style="width:580px; height:435px;"></div>
				  <div><img src="/img/open5.jpg" style="width:580px; height:435px;"></div>
				  <div><img src="/img/open7.jpg" style="width:580px; height:435px;"></div>
				  <div><img src="/img/open1.jpg" style="width:580px; height:435px;"></div>
				  <div><img src="/img/open8.jpg" style="width:580px; height:435px;"></div>
				  <div><img src="/img/open2.jpg" style="width:580px; height:435px;"></div>
				</div>
			</div>
				
			<!-- notice -->
			<div class="notice">
			
				<!-- 공지사항 팝업용  -->
				<div id="mask"></div>
				<div class="window">
					<h2>공지사항</h2>
					<a href="#" class="close">닫기X</a>
					<hr/>
					<div class="notice-pop">
						<table class="table table-striped notice-tbl">
							<thead>
								<tr>
									<td style="width: 30px;">no.</td>
									<td>제목</td>
									<td>작성일</td>
								</tr>
								
			<!-- 공지사항 반복될 구간 START -->					
								<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
									<tr>
										<td style="width: 30px;">${status.count }</td>
										<td onclick="noticeFade('${noticeVo.post_no}')">${noticeVo.post_ttl }</td>
										<td>${noticeVo.post_date }</td>
									</tr>
									<tr>
										<td colspan="3" id="${noticeVo.post_no}" class="notice-content" style="display: none;" >${noticeVo.post_cntnt }</td>
									</tr>
								</c:forEach>
			<!-- 공지사항 반복될 구간 END -->	
							</thead>
						</table>
					</div>
				</div>
				<!-- 우측 하단 공지사항  -->
				<div class="notice-word">
					<div class="notice-top">
						<h6>공지사항</h6><button type="button" class="see-more openMask">더보기</button>
					</div>
					<div class="notice-cont word-over" id="noticeList">
			<!-- 공지사항 제목만 나열 -->
						<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${noticeVo.post_ttl }</td><br/>
							</tr>
						</c:forEach>
					</div>
				</div>

			</div>	<!-- 공지사항 END -->
		</div>	<!-- board END -->
	</div>	<!-- contents END -->
	
	<div class="bottom">
		<hr/>
		<div class="bottom-in">
			<p>상호: &nbsp 오픈시세 &nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp 회장: &nbsp <b>김종훈</b> &nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp 팀명: &nbsp 되찾은 자들<br/>
			주소: &nbsp 대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br/>
			서비스 이용문의: &nbsp010-6351-4419<br/>
			팀원:&nbsp <b>송연진 &nbsp 김주연 &nbsp 이소형 &nbsp 유다영</b><br/>
			©2018-2019 OpenSISE Co. All rights reserved.</p>
		</div>
	</div>
	

</body>
</html>