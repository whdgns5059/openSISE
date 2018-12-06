<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 

<style type="text/css">
.contents {
	margin: 0 auto;
	padding-left: 300px;
	padding-right: 300px;
}
.navC{
	width: 100%;
	height: 50px;
}
.nav_right{
	width:500px;
	height: 80px;
	display:inline-block;
	float: right;
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
	width:1050px ;
	height:50px ;
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
    height: 49px;
    border: solid 2px #e8a93f;
    border-radius: 0.3rem;
	padding-left: 1rem;
}
.board{
	width:1303px ;
	height:500px ;
    margin: 100px 0 150px 0;
}
.picture{
	width:600px ;
	height:450px ;
	display: inline-block;
	float: left;
}
.notice{
    width: 640px;
    height: 450px;
    display: inline-block;
    float: right;
    border: 1px solid #bbbbbb;
}
.notice-top{
	width: 568px;
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
    width: 100px;
    padding-left: 9%;
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
    width: 556px;
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
    width: 340px;
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
    width: 340px;
    color: #000000b5;
    font-size: 13px;
    background-color: rgba(255, 255, 255, 0.7);
}


/* 마스크 띄우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
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
    	
    	$('#searchText').attr("placeholder","지역명, 지하철역명, 아파트명을 입력하세요.");
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
    $("#fadeToggleBtn").on("click", function() {

        // id가 "divBox"인 요소를 1초에 걸쳐 점점 나타나게 하거나 사라지게 함.

        $("#divBox").fadeToggle(1000);

    });
    
    
    $(document).ready(function(){
    	
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
			$(".searchF").submit();
		})

		//bxslider
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			slideWidth : 600
		});

	});

	//]]>
</script>
</head>
<body>
<!-- wrap div -->
<div class="wrap">
	<!-- navigation -->
	<div class="navC">
		<!-- nav_right -->
		<div class="nav_right">
			<ul class="top-menu">
				<!-- memVo가 null인 경우 -->
				<li style="margin-right: 50px;" ><a href="/login/selectLogin">로그인</a></li>
				<li style="margin-right: 50px;" ><a href="/signup/signup">회원가입</a></li>
				<!-- 관리자일 경우에 생기는 a tag  --> 
 				<li><a href="/manage/dataTrade/dataTrade">관리자</a></li>
			<!-- 로그인 한 경우에 생기는 a tag  --> 
				<li><a href="/">{회원의 닉네임}님 환영합니다! </a></li>

				
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
				<button type="button" class="btn btn-outline-primary" id="house" value="단/다세대" onclick="getBC(this)">단/다세대</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="apt" value="아파트" onclick="getBC(this)">아파트</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="office" value="오피스텔" onclick="getBC(this)">오피스텔</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary" id="store" value="상가" onclick="getBC(this)">상가</button>
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
				</form>
		</div>
			
		<!-- board -->
		<div class="board">
		
			<!-- picture -->
			<div class="picture" >
				<!-- bxslider -->
				<div class="bxslider">
				  <div><img src="/img/img1.png"></div>
				  <div><img src="/img/img2.png"></div>
				  <div><img src="/img/img3.png"></div>
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
								<tr>
									<td style="width: 30px;">1</td>
									<td onclick="oneFade('1')">공지사항</td>
									<td>2018.11.30</td>
								</tr>
								<tr>
									<td style="width: 30px;">2</td>
									<td>공지사항</td>
									<td>2018.11.30</td>
								</tr>
								<%for(int i=0 ; i<20 ; i++){
									%>
									<tr>
									<td style="width: 30px;">2</td>
									<td>공지사항</td>
									<td>2018.11.30</td>
								</tr>
								<%
								}
								%>
							</thead>
						</table>
					</div>
				</div>
				<!-- 우측 하단 공지사항  -->
				<div class="notice-word">
					<div class="notice-top">
						<h6>공지사항</h6><button type="button" class="see-more openMask">더보기</button>
					</div>
					<div class="notice-cont word-over">
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
						title만 나열합니다.<br/>
					</div>
				</div>

			</div><!-- 공지사항 END -->
		</div>
	</div><!-- contents END -->
	
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
	
	
</div><!-- wrap END -->

</body>
</html>