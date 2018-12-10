<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main-left{
	width: 70%;
	height: 100%;
	float: left;
	z-index: 9000;
}
.search-filt{
	width: 100%;
	height: 5%;
}
.search{
    margin: 10px 24px 0 40px;
    width: 280px;
    height: 37px;
    float: left;
}
.search-box{
    width: 210px;
    height: 36px;
    align-self: center;
    margin: 0;
    padding: 0;
    border: none;
    border-bottom: 2px solid #4159a9;
}
.search-box::placeholder{
    font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 400;
    color: #cacaca;
}
.searchBtn{
    width: 57px;
    padding: 0;
    margin: 0;
    height: 35px;
    color: white;
    font-size: 14px;
    font-weight: 400;
    text-align: center;
    background-color: #ffae24;
    border-bottom: 5px solid #4159a9;
}
.searchBtn:hover{
	 border-bottom: 4px solid #626f9c;
}
.main-right{
	width: 30%;
	height: 100%;
	float: left;
	border-left: 1px solid #e0e0e0;
	background: #f5f3f0;
	position: relative;
}
.filters-div{
	float: left;
}
.articles{
    width: 95%;
    height: 100%;
    float: right;
    overflow: scroll;
    overflow-x: hidden;
    overflow-y: auto;
}


::-webkit-scrollbar{width: 16px;}
::-webkit-scrollbar-track {background-color:#f1f1f1;}
::-webkit-scrollbar-thumb {background-color:#ffae24;border-radius: 10px;}
::-webkit-scrollbar-thumb:hover {background: #4159a9;}

.article{
    width: 500px;
    height: 140px;
    margin: 15px 0;
    padding: 20px;
    border: 1px solid #e0e0e0;
    font-size: 15px;
    font-family: 'Nanum Gothic Coding', monospace;
    background: white;
}
.article h4{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	color: #4159a9;
	font-size: 24px;
}
.address{
	margin-top: 8px;
}
.avg-price{
}
.area-analysis{
    z-index: 10000;
    position: absolute;
    width: 100px;
    height: 100px;
    background: black;
    left: -100px;
    bottom: 0;
}

</style>
<script type="text/javascript">
//36.3505393936125,127.38483389033713
	$(document).ready(
			function() {
				
				var x;
				var y;
				
				if($("#loc").val() == ""){
					// 검색값이 없을 때 시청으로 기본 좌표값 설정
					x = 36.3505393936125;
					y = 127.38483389033713;
				}else{
					// 해당 주소에 대한 좌표값을 담을 변수
					x = $(".lat").val(); //위도
					y = $(".lng").val(); //경도
				}
				
				
				// 해당 주소를 담을 값
				var addr;

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(x,y), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				//마커가 표시될 위치입니다 
				var markerPosition = new daum.maps.LatLng(x,y);
				//마커를 생성합니다
				var marker = new daum.maps.Marker({
					position : markerPosition
				});
				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

			});

	$(document).ready(function() {

		var x;
		var y;

		if ($("#loc").val() == "" || $("#listSize").val() == 0) {
			// 검색값이 없을 때 시청으로 기본 좌표값 설정
			x = 36.3505393936125;
			y = 127.38483389033713;
		} else {
			// 해당 주소에 대한 좌표값을 담을 변수
			x = $(".lat").val(); //위도
			y = $(".lng").val(); //경도
		}

		// 해당 주소를 담을 값
		var addr;

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(x, y), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(x, y);
		//마커를 생성합니다'
		var marker = new daum.maps.Marker({
			position : markerPosition
		});
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

	});
</script>


<!-- left contents -->
<div class="main-left">
	<input type="hidden" id="listSize" value="${buildingSaleListSize}" />
	<c:forEach items="${buildingSaleList}" var="build">
		<input type="hidden" class="lat" value="${build.artcl_lat}">
		<input type="hidden" class="lng" value="${build.artcl_lng}">
	</c:forEach>
	
	<!-- 검색 조건 -->
	<div class="search-filt">
		<!-- 검색어 -->
		<div class="search"> 
			<form action="/" method="get">
				<input type="text" class="search-box" placeholder="지역명, 지하철역명, 아파트명" id="loc" value="${search}">
				<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
			</form>
		</div>
		
		<!-- 필터 -->
		<div class="filters-div">
			<ul class="nav nav-tabs" >
			<c:if test="${building == 'multi'}">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">주거형태</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="jeonse" />
		     					<label class="custom-control-label" for="jeonse">&nbsp&nbsp단독</label>
		     				</a>
		     			</div>
		     			<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="wolse" />
		     					<label class="custom-control-label" for="wolse">&nbsp&nbsp다세대</label>
		     				</a>
		     			</div>
		     			<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="maemae" />
		     					<label class="custom-control-label" for="maemae">&nbsp&nbsp연립</label>
		     				</a>
		     			</div>
					</div> 
				</li>
			</c:if>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">전/월/매</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="jeonse" />
		     					<label class="custom-control-label" for="jeonse">&nbsp&nbsp전세</label>
		     				</a>
		     			</div>
		     			<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="wolse" />
		     					<label class="custom-control-label" for="wolse">&nbsp&nbsp월세</label>
		     				</a>
		     			</div>
		     			<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="maemae" />
		     					<label class="custom-control-label" for="maemae">&nbsp&nbsp매매</label>
		     				</a>
		     			</div>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">가격</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">면적</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">준공년도</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">층수</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- 지도 -->
	<div id="map" style="width: 100%; height: 95%;"></div>
	
</div>
	
<!-- right contents -->
<div class="main-right">

	<!-- 매물리스트  -->
	<div class="articles">
	<c:choose>
		<c:when test="${buildingSaleListSize != 0}">
			<c:forEach items="${buildingSaleList}" var="build">
				<div class="article">
				<c:choose>
					<c:when test="${building == 'apt'}">
						<h4>${build.artcl_complx}</h4>		
					</c:when>
					<c:when test="${building == 'multi'}">
						<h4>${build.artcl_rd}</h4>		
					</c:when>
					<c:when test="${building == 'office'}">
						<h4>${build.artcl_complx}</h4>		
					</c:when>
					<c:when test="${building == 'store'}">
						<h4>${build.artcl_nm}</h4>		
					</c:when>
				</c:choose>
				
				<label class="address">상세주소시 상세구 주소동 상세주소단지</label><br/>
				<!-- 평균 시세는 근 3개월 간의 시세를 평균으로 낸다. -->
				<label class="avg-price">평균시세&nbsp:&nbsp&nbsp100억</label>
            	</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			검색 결과가 없습니다.(돋보기 그림 추가 + 글씨크기 키우고 색은 옅은 회색)
		</c:otherwise>
	</c:choose>
	</div>
	
	<!-- 지역분석 버튼 -->
	<!-- <div class="area-analysis">
		2
	</div> -->
</div>





























