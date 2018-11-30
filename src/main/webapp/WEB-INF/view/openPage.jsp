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
/* div { */
/* 	border : 1px solid red; */
/* } */
.contents {
	margin: 0 auto;
	padding-left: 300px;
	padding-right: 300px;
}
.navC{
	width: 1900px;
	height: 80px;
}
.nav_right{
	width:500px;
	height: 80px;
	display:inline-block;
	float: right;
}
ul{
	margin-top: 50px;
	margin-left: 100px;
}
ul li {
	list-style: none;
	float: left;
	vertical-align: center;
	font-size: large;
}
a {
	text-decoration: none !important;
}
td {
	width: 450px;
	white-space:nowrap; 
	overflow:hidden; 
	text-overflow:ellipsis; 
}
.logo{
	margin: 20px 0 20px 0;
	padding: 20px 400px 20px 500px;
	width: 1303px;
}
.button{
	margin : 0 0 0 100px;
	width:1303px ;
	height:100px ;
}
.buttons{
	width: 200px;
	display: inline-block;
	float: left;
	margin: 10px 50px 0px 100px;
}
.search{
	
	width:1303px ;
	height:50px ;
}
.board{
	width:1303px ;
	height:450px ;
	margin-top:10px;
}
.picture{
	width:650px ;
	height:450px ;
	display: inline-block;
	float: left;
	margin-top: 30px;
	margin-left: 50px;
}
.notice{
	width:481px ;
	height:450px ;
	display: inline-block;
	float: left;
	margin-top: 30px;
	margin-left: 20px;
}

 
/* 마스크 뛰우기 */
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
    display: none;
    left:50%;
    width:1000px;
    height:700px;
    background-color:#FFF;
    z-index:10000; 
    border-radius: 20px;
    
    position: fixed;
    margin-left: -25%; /* half of width */
    top: 50%;
    margin-top: -350px; /* half of height */
    overflow: auto;
 
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
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask").click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
 
        });  
        
        //search
        $("#search").click(function(){
        	
        	$(".searchF").submit();
        })
        
        //bxslider
        $('.bxslider').bxSlider({
        	  auto: true,
        	  autoControls: true,
        	  stopAutoOnClick: true,
        	  pager: true,
        	  slideWidth: 600
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
			<ul>
				<li style="margin-right: 50px;"><a href="/login/login">로그인</a></li>
				<li style="margin-right: 50px;"><a href="/signup/signup">회원가입</a></li>
				<li><a href="/manage/dataTrade/dataTrade">관리자</a></li>
			</ul>
		</div>
	</div>
	
	<!-- contents -->
	<div class="contents">
		<!-- logo -->
		<div class="logo">
			<img src="/img/snail.png"  />
			<img src="/img/openSise.png"  />
		</div>
		
		<!-- button -->
		<div class="button">
			<div class="buttons">
				<button type="button" class="btn btn-primary btn-lg" style="padding: 20px">Large button</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-primary btn-lg" style="padding: 20px" >Large button</button>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-outline-primary"  style="padding:20px">Large button</button>
			</div>
		</div>
		
		<!-- search -->
		<div class="search">
				<form class="form-inline my-2 my-lg-5 searchF" action="/main/main">
					<input class="form-control mr-sm-5" type="text"
						placeholder="지역명, 지하철역명, 아파트명, 등을 입력하세요">
					<button type="button" class="btn btn-primary btn-lg" id="search">search</button>
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
					<div id="wrap_pop">
						<div id="container">
							<div id="mask"></div>
							<div class="window">
								<h2 style="margin-left: 20px;display: inline-block;">공지사항</h2>
								<p
									style="text-align: center; background: #ffffff; padding: 20px;display: inline-block;
											float:right;">
									<a href="#" class="close">닫기X</a>
								</p>
								<hr/>
								<div style="width: 850px;height: 500px; margin-left: 70px;">
									<table class="table table-striped">
										<thead>
											<tr>
												<td>번호</td>
												<td>제목</td>
												<td>작성일</td>
											</tr>
											<tr>
												<td>1</td>
												<td>공지사항</td>
												<td>2018.11.30</td>
											</tr>
											<tr>
												<td>2</td>
												<td>공지사항</td>
												<td>2018.11.30</td>
											</tr>
											<tr>
												<td>3</td>
												<td>공지사항</td>
												<td>2018.11.30</td>
											</tr>
											<tr>
												<td>4</td>
												<td>공지사항</td>
												<td>2018.11.30</td>
											</tr>
											<tr>
												<td>5</td>
												<td>공지사항</td>
												<td>2018.11.30</td>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<table border="0" cellpadding="0" cellspacing="0" width="100%" >
								<thead>
									<tr>
										<td style="font-size: 30px;"><b>공지사항</b></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="font-size: medium;line-height: 50px;">1.공지사항입니다.</td>
									</tr>
									<tr>
										<td style="font-size: medium;">2.동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세 
																								무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세</td>
									</tr>
									<tr>
										<td style="font-size: medium;">2.동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세 
																								무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세</td>
									</tr>
									<tr>
										<td style="font-size: medium;">2.동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세 
																								무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<button type="button" class="btn btn-warning openMask">더보기</button>
						</div>
					</div>
			</div>
	</div>
</div>

</body>
</html>