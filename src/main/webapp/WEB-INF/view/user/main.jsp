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

#slider-vertical{
	margin-left: 20px;
}

#mini{
	margin-left: 50px;
}
#dlTypePrice{
	margin-left : 10px;
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
 <link href="/css/boostratp_slider_css_js/css/bootstrap-slider.css" rel="stylesheet">
<script type="text/javascript" src="/css/boostratp_slider_css_js/js/bootstrap-slider.js"></script>
<script type="text/javascript">
	//36.3505393936125,127.38483389033713
	$(document).ready(function() {
		/* var dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
		$("#buildT").html(dl_Type); */
		dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
		$("#buildT").html(dl_Type);
		$("#dl_ty").val(dl_Type);
		
		
		settingMap();
		sliderRange(0,30);
		
		/*------------ 슬라이드 생성 코드(매매) ---------------*/
		function sliderRange(minimum, maximum){
			
			$("#slider-bar").slider({
				range: "max",
				min : minimum,
				max : maximum,
				value :0,
				step : 5,
				orientation : "horizontal",
				animate: "slow",
			});
		}
		/*----------- 슬라이드 생성 코드(전세, 월세)*/
		function sliderRangeDepos(minimum, maximum){
			
			$("#slider-bar").slider({
				range: "max",
				min : minimum,
				max : maximum,
				value :0,
				step : 100,
				orientation : "horizontal",
				animate: "slow",
			});
			
			$("#slider-rnt").slider({
				range: "max",
				min : minimum,
				max : maximum,
				value :0,
				step : 100,
				orientation : "horizontal",
				animate: "slow",
			});
		}
		var price = $("#slider-bar").val();	
		var span = "<span id='price'> 무제한 </span>";
		$("#price").html("");
		$("#price").html(span);
		
		$("#slider-bar").on("change",function(){
			priceTitle();
		});
		
		
		function priceTitle(){
			
			if($("#dl_ty").val()=="매매"){
				
				price = $("#slider-bar").val();	
				if(price[1] == 30){
					span = "<span id='price'>" + price[0] + "  ~ " + " 무제한</span>";
				}else{
					span = "<span id='price'>" + price[0] + "  ~ " + price[1]+ " 억</span>";
				}
				$("#price").html("");
				$("#price").html(span);
				
			}else if($("#dl_ty").val()=="전세"){
				
				price = $("#slider-bar").val();	
				if(price[1] == 100000){
					span = "<span id='price'>" + price[0] + "  ~ " + " 무제한</span>";
				}else{
					span = "<span id='price'>" + price[0] + " 만원  ~ " + price[1]+ " 만원</span>";
				}
				$("#price").html("");
				$("#price").html(span);
			}else{
				
				price = $("#slider-bar").val();
				if(price[1] == 10000){
					span = "<span id='price'>" + price[0] + " 만원  ~ " + " 무제한</span>";
				}else{
					span = "<span id='price'>" + price[0] + " 만원  ~ " + price[1]+ " 만원</span>";
				}
				$("#price").html("");
				$("#price").html(span);
				
				var price2 = $("#slider-rnt").val();
				if(price2[1] == 400){
					span = "<span id='priceRnt'>" + price[0] + " 만원  ~ " + " 무제한</span>";
				}else{
					span = "<span id='priceRnt'>" + price[0] + " 만원  ~ " + price[1] + "만원</span>";
				}
				$("#priceRnt").html("");
				$("#priceRnt").html(span);
			}
		}
		
		

		/*전/월/매 ajax 처리*/
		$(".dlSelector").on("click", function(){
			dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			$("#buildT").html(dl_Type);
			
			$("#dl_ty").val(dl_Type);
			
			if($("#dl_ty").val() == '매매'){
				$("#dlTypePrice").html("매매가");
				sliderRange(0,30);
			}else if ($("#dl_ty").val() == '전세'){
				$("#dlTypePrice").html("보증금");
				sliderRangeDepos(0,100000);
			}else{
				$("#dlTypePrice").html("보증금");
				sliderRangeDepos(0,10000);
				$("#dlRntPrice").html("월세");
				sliderRangeDepos(0,400);
			}
			
			getArticleList();
		}); 
		
		/*단/다세대 ajax 처리*/
		$(".houseSelector").on("click", function(){
			building = document.querySelector('input[name="house"]:checked').value;
			$("#buildings").val(building);
			console.log($("#buildings").val());
			if(building == "single"){
				$("#houseType").html("단독");
			}else if(building == "multi"){
				$("#houseType").html("다세대");
			}else if(building == "multip"){
				$("#houseType").html("연립");
			}else{
				$("#houseType").html("전체");
			}
			getArticleList();
		});
		
		/*평(형)수 ajax 처리*/
		$(".areaSelector").on("click",function(){
			dl_excv_area = document.querySelector('input[name="area"]:checked').value;
			if(dl_excv_area == "0"){
				$("#excv_area").html("전체");
			}else if(dl_excv_area == "60"){
				$("#excv_area").html(dl_excv_area+"평대 이상");
			}else{
				$("#excv_area").html(dl_excv_area+"평대");
			}
			
			$("#dl_excv_area").val(dl_excv_area);
			getArticleList();
			
		});
		
		/*준공년도 ajax 처리*/
		$(".yearSelector").on("click",function(){
			artcl_const_y = document.querySelector('input[name="year"]:checked').value;
			if(artcl_const_y == "all"){
				$("#const_y").html("무관");
			}else{
				$("#const_y").html(artcl_const_y+"년 이하");
			}
			$("#artcl_const_y").val(artcl_const_y);
			getArticleList();
			
		});
		
		
		/*검색버튼 ajax 처리*/
		$("#search").on("click",function(){
			dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			$("#buildT").html(dl_Type);
			
			$("#dl_ty").val(dl_Type);
			/* if($("#dl_ty").val() == '매매'){
				$("#dlTypePrice").html("매매가");
			}else if ($("#dl_ty").val() == '전세'){
				$("#dlTypePrice").html("보증금");
			}else{
				$("#dlTypePrice").html("월세");
			} */
			getArticleList();
			console.log($("#dl_ty").val());
		});
		
		$(".article").hover(
			function(){
				console.log(document.getElementsByClassName("article"));
			},
			function(){
				settingMap();
			}
		);
		
		
	});
	
	function getArticleList(){
		console.log($("#buildings").val());
	 	var param = $("form[name=frm]").serialize();
	 	
		$.ajax({
			type : "POST",
			url : "/main/mainAjax",
			data : param,
			success : function(data){
				$(".main-right").html("");
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
			<input type="hidden" id="dl_type" name="dl_type" value="${dlType}"> 
			<form method="get" name="frm">
					<input type="text" class="search-box" placeholder="지역명, 지하철역명, 아파트명" name="searchName" id="loc" value="${searchName}"> 
					<input type="hidden" id="buildings" name="building" value="${building}">
					<input type="hidden" id="dl_ty" name="dl_ty" value ="${dlType}"> 
					<input type="hidden" id="dl_excv_area" name="dl_excv_area"> 
					<input type="hidden" id="artcl_const_y" name="artcl_const_y"> 
				<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
			</form>
		</div>

		<!-- 필터 -->
		<div class="filters-div">
			<ul class="nav nav-tabs">
				<c:if test="${building == 'house'}">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" id="houseType">주거형태</a>
						<div class="dropdown-menu">
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" class="custom-control-input houseSelector" id="single" name="house" value="single" /> 
									<label class="custom-control-label" for="single">&nbsp&nbsp단독</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" class="custom-control-input houseSelector" id="multi" name="house" value="multi" /> 
									<label class="custom-control-label" for="multi">&nbsp&nbsp다세대</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" class="custom-control-input houseSelector" id="multip" name="house" value="multip"/> 
									<label class="custom-control-label" for="multip">&nbsp&nbsp연립</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" checked="checked" class="custom-control-input houseSelector" id="all" name="house" value="all" /> 
									<label class="custom-control-label" for="all">&nbsp&nbsp전체</label>
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
								<input type="radio"  class="custom-control-input dlSelector" id="jeonse" name="buildingType" value="전세"/> 
								<label class="custom-control-label" for="jeonse">&nbsp&nbsp전세</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio"  class="custom-control-input dlSelector" id="wolse" name="buildingType" value="월세"/> 
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
					<c:choose>
						<c:when test="${dlType == '월세'}">
							<div class="dropdown-menu" style="width:600px; height: 100px;">
								<h4 id="dlTypePrice">매매가</h4>
		  						<div id="slider-bar"></div>&nbsp&nbsp&nbsp
		  						<span id="price">무제한</span>
		  						<hr>
		  						<h4 id="dlRntPrice"></h4>
		  						<div id="slider-rnt"></div>&nbsp&nbsp&nbsp
		  						<span id="priceRnt"></span>
							</div>						
						</c:when>
						<c:when test="${dlType != '월세'}">
							<div class="dropdown-menu" style="width:400px; height: 100px;">
								<h4 id="dlTypePrice">매매가</h4>
		  						<div id="slider-bar"></div>&nbsp&nbsp&nbsp
		  						<span id="price">무제한</span>
		  						<hr>
							</div>						
						</c:when>
					</c:choose>
					</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false" id="excv_area">평(형)수</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="tenArea" name="area" value="10"/> 
								<label class="custom-control-label" for="tenArea">&nbsp&nbsp10평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="secArea" name="area" value="20"/> 
								<label class="custom-control-label" for="secArea">&nbsp&nbsp20평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="thirArea" name="area" value="30"/> 
								<label class="custom-control-label" for="thirArea">&nbsp&nbsp30평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="fourArea" name="area" value="40"/> 
								<label class="custom-control-label" for="fourArea">&nbsp&nbsp40평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="fifArea" name="area" value="50"/> 
								<label class="custom-control-label" for="fifArea">&nbsp&nbsp50평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="sixArea" name="area" value="60"/> 
								<label class="custom-control-label" for="sixArea">&nbsp&nbsp60평 이상</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " checked="checked" id="allArea" name="area" value="0"/> 
								<label class="custom-control-label" for="allArea">&nbsp&nbsp전체</label>
							</a>
						</div>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false" id="const_y">준공년도</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " id="fiveYear" name="year" value="5"/> 
								<label class="custom-control-label" for="fiveYear">&nbsp&nbsp5년 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " id="tenYear" name="year" value="10"/> 
								<label class="custom-control-label" for="tenYear">&nbsp&nbsp10년 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " id="fifYear" name="year" value="15"/> 
								<label class="custom-control-label" for="fifYear">&nbsp&nbsp15년 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " checked="checked" id="ignore" name="year" value="all"/> 
								<label class="custom-control-label" for="ignore">&nbsp&nbsp무관</label>
							</a>
						</div>
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
	<!-- 매물리스트 들어가는 자리 -->
	
	<div id="lngLat">
	<input type="hidden" id="listSize" value="${buildingSaleListSize}" />
	<c:forEach items="${buildingSaleList}" var="build">
		<input type="hidden" class="lat" value="${build.artcl_lat}">
		<input type="hidden" class="lng" value="${build.artcl_lng}">
	</c:forEach>
	</div>
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
							<c:when test="${building == 'house'}">
								<c:choose>
									<c:when test="${build.artcl_bc == 'multi'}">
										<h4>${build.artcl_rd}</h4><span>다세대</span>
									</c:when>
									<c:when test="${build.artcl_bc == 'multip'}">
										<h4>${build.artcl_nm}</h4><span>연립</span>
									</c:when>
									<c:when test="${build.artcl_bc == 'single'}">
										<h4>${build.artcl_rd}</h4><span>단세대</span>
									</c:when>
								</c:choose>
								<br>
							</c:when>
							<c:when test="${building == 'office'}">
								<h4>${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${building == 'store'}">
								<h4>${build.artcl_rd}</h4>
							</c:when>
						</c:choose>
						<label class="address">대전광역시 ${build.artcl_gu} ${build.artcl_dong} ${build.artcl_rd} ${build.artcl_rd_detail}</label><br />
						<!-- 평균 시세는 근 3개월 간의 시세를 평균으로 낸다. -->
						<c:choose>
							<c:when test="${build.dl_ty == '매매' }">
								<label class="avg-price">평당 평균가&nbsp&nbsp${build.avg_dl}만원</label>
							</c:when>
							<c:when test="${build.dl_ty == '전세' }">
								<label class="avg-price">평균 전세가 &nbsp&nbsp${build.dl_depos}만원</label>
							</c:when>
							<c:when test="${build.dl_ty == '월세' }">
								<label class="avg-price">평균 보증금&nbsp ${build.dl_depos}만원 <br> 평균 월세가 &nbsp ${build.dl_rnt}만원</label>
							</c:when>
						</c:choose>
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





























