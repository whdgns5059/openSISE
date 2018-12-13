<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main-left {
	width: 70%;
	height: 100%;
	float: left;
	z-index: 9000;
}

.search-filt {
	width: 100%;
	height: 5%;
}

.search {
	margin: 10px 24px 0 40px;
	width: 280px;
	height: 37px;
	float: left;
}

.search-box {
	width: 210px;
	height: 36px;
	align-self: center;
	margin: 0;
	padding: 0;
	border: none;
	border-bottom: 2px solid #4159a9;
}

.search-box::placeholder {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 400;
	color: #cacaca;
}

.searchBtn {
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

.searchBtn:hover {
	border-bottom: 4px solid #626f9c;
}

.main-right {
	width: 30%;
	height: 100%;
	float: left;
	border-left: 1px solid #e0e0e0;
	background: #f5f3f0;
	position: relative;
}

.filters-div {
	float: left;
}

.articles {
	width: 95%;
	height: 100%;
	float: right;
	overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
}

::-webkit-scrollbar {
	width: 16px;
}

::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background-color: #ffae24;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #4159a9;
}

.article {
	width: 500px;
	height: 140px;
	margin: 15px 0;
	padding: 20px;
	border: 1px solid #e0e0e0;
	font-size: 15px;
	font-family: 'Nanum Gothic Coding', monospace;
	background: white;
}

.article h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	color: #4159a9;
	font-size: 24px;
}

.address {
	margin-top: 8px;
}

.avg-price {
	
}

.area-analysis {
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
	$(document).ready(function() {
		var buildingTy = $("#building").val();
		getArticleList(buildingTy);
		settingMap();
		
		/*------------ 마커생성 코드 끝 ----------------*/

		
		$(".dlSelector").on("click", function(){
			
			var dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			
			$("#buildT").html(dl_Type);
			$("#dl_ty").val(dl_Type);
			
			getArticleList(dl_Type);
		}); 
		

	});
	
	function getArticleList(){
	 	var param = $("form[name=frm]").serialize();
		$.ajax({
			type : "GET",
			url : "/main/mainAjax",
			data : param,
			success : function(data){
				$(".main-right").html(data);
				settingMap();
			}
		});
	}
	
	function settingMap(){
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

		/*------------ 지도생성 코드 ----------------*/
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(x, y), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		/*------------- 지도 생성 코드 끝 ----------------*/

		/*------------- 마커 생성 코드 ----------------*/

		var positions = setLatlngArr();

		//마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(x, y);
		for(var i =0; i<positions.length; i++){
			//마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : positions[i]
			});
			//마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		}
	}
	
	/*검색한 좌표들을 배열에 담아준다*/
	function setLatlngArr() {
		/* console.log(lat[0]);
		console.log(lng[0]); */
		var lat = document.getElementsByClassName("lat");
		var lng = document.getElementsByClassName("lng");
		var position = [];
		for (var i = 0; i < lat.length; i++) {
			position[i] = new daum.maps.LatLng(lat[i].value, lng[i].value);
		}
		return position;
	}
	
	
</script>


<!-- left contents -->
<div class="main-left">
	
	<!-- 검색 조건 -->
	<div class="search-filt">
		<!-- 검색어 -->
		<div class="search">
			<form action="/" method="get" name="frm">
					<input type="text" class="search-box" placeholder="지역명, 지하철역명, 아파트명" name="searchName" id="loc" value="${searchName}"> 
					<input type="hidden" id="building" name="building" value="${building}">
					<input type="hidden" id="dl_ty" name="dl_ty">
				<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
			</form>
		</div>

		<!-- 필터 -->
		<div class="filters-div">
			<ul class="nav nav-tabs">
				<c:if test="${building == 'multi'}">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">주거형태</a>
						<div class="dropdown-menu">
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="checkbox" class="custom-control-input" id="single" /> 
									<label class="custom-control-label" for="jeonse">&ensp단독</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="checkbox" class="custom-control-input" id="multi" /> 
									<label class="custom-control-label" for="wolse">&ensp다세대</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="checkbox" class="custom-control-input" id="multip" /> 
									<label class="custom-control-label" for="maemae">&ensp연립</label>
								</a>
							</div>
						</div>
					</li>
				</c:if>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false"><span id="buildT">전/월/매</span></a>
					<div class="dropdown-menu" id="dlType">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input dlSelector" id="jeonse" name="buildingType" value="전세"/> 
								<label class="custom-control-label" for="jeonse">&nbsp&nbsp전세</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input dlSelector" id="wolse" name="buildingType" value="월세"/> 
								<label class="custom-control-label" for="wolse">&nbsp&nbsp월세</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" checked="checked" class="custom-control-input dlSelector" id="maemae" name="buildingType" value="매매"/> 
								<label class="custom-control-label" for="maemae">&nbsp&nbsp매매</label>
							</a>
						</div>
					</div></li>
					<!-- 가격 수정 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">가격</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input" id="low" name="floorType"/> 
								<label class="custom-control-label" for="low">&nbsp&nbsp저층(5층이하)</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input" id="middle" name="floorType"/> 
								<label class="custom-control-label" for="middle">&nbsp&nbsp중층(20층 이하)</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio"  class="custom-control-input" id="high" name="floorType"/> 
								<label class="custom-control-label" for="high">&nbsp&nbsp고층(20층 이상)</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" checked="checked" class="custom-control-input" id="all" name="floorType"/> 
								<label class="custom-control-label" for="all">&nbsp&nbsp전체</label>
							</a>
						</div>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">면적</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">준공년도</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">층수</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input" id="low" name="floorType"/> 
								<label class="custom-control-label" for="low">&nbsp&nbsp5층이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input" id="middle" name="floorType"/> 
								<label class="custom-control-label" for="middle">&nbsp&nbsp20층 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio"  class="custom-control-input" id="high" name="floorType"/> 
								<label class="custom-control-label" for="high">&nbsp&nbsp20층 이상</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" checked="checked" class="custom-control-input" id="all" name="floorType"/> 
								<label class="custom-control-label" for="all">&nbsp&nbsp전체</label>
							</a>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
	<!-- 지도 -->
	<div id="map" style="width: 100%; height: 95%;"></div>

</div>

<!-- right contents -->
<div class="main-right">
	<!-- 매물리스트 들어가는 자리 -->
	<!-- 지역분석 버튼 -->
	<!-- <div class="area-analysis">
		2
	</div> -->
</div>





























