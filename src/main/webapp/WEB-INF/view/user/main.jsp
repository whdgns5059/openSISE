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

#sensor{
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
	cursor: pointer;
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

#camera{
	width: 40px; 
	height:40px; 
}

#cameraDiv{
	margin-right: 25px;
	margin-top: 10px;
	margin-left: -20px;
}
.divHeight{
	width:500px;
	height: 100px;
}

#mapWrap {width:100%; height:95%; position: relative;}
#map {width:100%; height:100%;}
.toLocal {position: absolute; top: 640px; left: 1055px; z-index: 10; width:150px; height: 150px;}


</style>
 <link href="/css/boostratp_slider_css_js/css/bootstrap-slider.css" rel="stylesheet">
<script type="text/javascript" src="/css/boostratp_slider_css_js/js/bootstrap-slider.js"></script>
<script type="text/javascript">
	//36.3505393936125,127.38483389033713
	$(document).ready(function() {
		
		var map;
		
		/* var dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
		$("#buildT").html(dl_Type); */
		dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
		$("#buildT").html(dl_Type);
		$("#dl_ty").val(dl_Type);
		
		
		settingMap(0,0);
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
		/*----------- 슬라이드 생성 코드(전세, 월세) -------------*/
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
		}
		
		function sliderRangeRnt(minimum, maximum){
			$("#slider-rnt").slider({
				range: "max",
				min : minimum,
				max : maximum,
				value :0,
				step : 50,
				orientation : "horizontal",
				animate: "slow",
			});
		}
		/*---------- 슬라이더 생성 코드 끝 --------------*/
		
		/*---------- 초기에 무제한이라고 초기값 설정 -------*/
		var price = $("#slider-bar").val();	
		var span = "<span id='price'> 무제한 </span>";
		$("#price").html("");
		$("#price").html(span);
		/*---------- 초기에 무제한이라고 초기값 설정 끝  -------*/
		
		/*---------- 슬라이더 값 변화 function -------*/
	/* 	$("#slider-bar").on("change",function(){
			priceTitle();
		});
		$("#slider-rnt").on("change",function(){
			priceTitle();
		}); */
		
		/*------------- 가격 ajax 설정(지금 이거 막아놨어 사용할거면 이거 풀어) -------------------*/
		/* $(".divHeight").on("change","#slider-bar",function(){
			priceTitle();
			getArticleList();
		});
		$(".divHeight").on("change","#slider-rnt",function(){
			priceTitle();
			getArticleList();
		}); */
		/*-----------------------------------------------------------------------*/
		
		
		
		/*------- 가격 ajax --------*/
		$(".divHeight").on("mousedown","#slider-bar",function(){
			alert("mouseOut");
		}); 
		/* $("#slider-bar").mouseleave(function(){
			console.log($("#slider-bar").val());
		}); */
		/*------- 가격 ajax 끝 ------*/
		function priceTitle(){
			
			if($("#dl_ty").val()=="매매"){
				
				price = $("#slider-bar").val();	
				if(price[1] == 30){
					span = "<span id='price'>" + price[0] + " 억 ~ " + " 무제한</span>";
				}else{
					span = "<span id='price'>" + price[0] + " 억 ~ " + price[1]+ " 억</span>";
				}
				$("#price").html("");
				$("#price").html(span);
				$("#dl_price1").val($("#slider-bar").val()[0]);
				$("#dl_price2").val($("#slider-bar").val()[1]);
			}else if($("#dl_ty").val()=="전세"){
				
				price = $("#slider-bar").val();	
				if(price[1] == 30000){
					span = "<span id='price'>" + price[0] + " 만원 ~ " + " 무제한</span>";
				}else{
					span = "<span id='price'>" + price[0] + " 만원  ~ " + price[1]+ " 만원</span>";
				}
				$("#price").html("");
				$("#price").html(span);
				$("#dl_price1").val($("#slider-bar").val()[0]);
				$("#dl_price2").val($("#slider-bar").val()[1]);
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
					span = "<span id='priceRnt'>" + price2[0] + " 만원  ~ " + " 무제한</span>";
				}else{
					span = "<span id='priceRnt'>" + price2[0] + " 만원  ~ " + price2[1] + "만원</span>";
				}
				$("#priceRnt").html("");
				$("#priceRnt").html(span);
				$("#dl_price1").val($("#slider-bar").val()[0]);
				$("#dl_price2").val($("#slider-bar").val()[1]);
				$("#dl_rnt1").val($("#slider-rnt").val()[0]);
				$("#dl_rnt2").val($("#slider-rnt").val()[1]);
			}
		}
		/*------------------- 슬라이더 onChange 끝 -------------------------*/
		

		/*전/월/매 ajax 처리*/
		$(".dlSelector").on("click", function(){
			dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			$("#buildT").html(dl_Type);
			$("#ty").val(dl_Type);
			$("#dl_ty").val(dl_Type);
			$("#dl_t").val(dl_Type);
			
			console.log($("#dl_ty").val());
			console.log($("#buildings").val());
			console.log($("#searchName").val());
			
			if($("#dl_ty").val() =="월세"){
				$(".divHeight").css("height", 200);
				priceRnt();
			}else{
				$(".divHeight").html("");
				$(".divHeight").css("height", 100);
				var html ;
				html += "<h4 id='dlTypePrice'>매매가</h4>";
				html +=	"<div id='slider-bar'></div>&nbsp&nbsp&nbsp";
				html +=	"<span id='price'>무제한</span>";
				html +=	"<hr>";
				$(".divHeight").html(html);
			}
			
			dlTypeInnerHtml();
			sliderMaker();
			getArticleList();
		}); 
		
		/*---------- 월세 가격 설정 -------------*/
		function priceRnt(){
			var html;
			html += "<h4>월세</h4>";
			html += "<div id='slider-rnt'></div>&nbsp&nbsp&nbsp";
			html += "<span id='priceRnt'>무제한</span>";
			
			$(".divHeight").append(html);
			
		}
		/*---------- 월세 가격 설정 끝 -----------*/
		
		/*---------- 매매 형태에 따른 가격 기본값 고정 --------- */
		function dlTypeInnerHtml(){
			if($("#dl_ty").val() == '매매'){
				$("#dlTypePrice").html("매매가");
			}else if($("#dl_ty").val() == '전세'){
				$("#dlTypePrice").html("보증금");
			}else{
				$("#dlTypePrice").html("보증금");
				$("#dlRntPrice").html("월세");
			}
		}
		/*---------- 매매 형태에 따른 가격 탭 기본값 고정 끝 --------- */
		
		/*---------- 매매 형태에 따른 슬라이더 생성 -----------*/
		function sliderMaker(){
			if($("#dl_ty").val() == '매매'){
				sliderRange(0,30);
			}else if($("#dl_ty").val() == '전세'){
				sliderRangeDepos(0,30000);
			}else{
				sliderRangeDepos(0,10000);
				sliderRangeRnt(0,400);
			}
		}
		/*---------- 매매 형태에 따른 슬라이더 생성 끝 -----------*/
		
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

			getArticleList();
		});
		
		
		/*------------- 해당 매물 mouseover시 중심 좌표 이동---------*/
		$(".main-right").on("mouseover",".article",function(){
			var x = this.getElementsByClassName("lat")[0].value;	// mouseOver가 된 해당 매물의 위도
			var y = this.getElementsByClassName("lng")[0].value;	// mouseOver가 된 해당 매물의 경도
			
			var moveLatLng = new daum.maps.LatLng(x, y);
			map.panTo(moveLatLng);
			
			//settingMap(x,y);
		});
		/*------------- 해당 매물 mouseover시 중심 좌표 이동 끝---------*/
		
		
		/*------------- 해당 매물 클릭 시 상세정보로 이동 ---------------*/
		$(".main-right").on("click",".article",function(){
			$("#artcl_gu").val(this.getElementsByTagName("input")[2].value);
			$("#artcl_dong").val(this.getElementsByTagName("input")[3].value);
			$("#artcl_zip").val(this.getElementsByTagName("input")[4].value);
			$("#artcl_rd").val(this.getElementsByTagName("input")[5].value);
			$("#frmDetail").submit();
		});
		/*------------- 해당 매물 클릭 시 상세정보로 이동 끝 ---------------*/
		
		
		
		function settingMap(x,y){
			var lat;
			var lng;
			if ($("#loc").val() == "") {
				// 검색값이 없을 때 시청으로 기본 좌표값 설정
				lat = 36.3505393936125;
				lng = 127.38483389033713;
			}else if($("#listSize").val() == "0"){
				lat = $("#latX").val();
				lng = $("#lngY").val();
			}else if(x == 0 && y == 0) {
				// 해당 주소에 대한 좌표값을 담을 변수
				lat = $(".lat").val(); //위도
				lng = $(".lng").val(); //경도
			}else{
				lat = x;
				lng = y;
			}

			// 해당 주소를 담을 값
			var addr;

			/*------------ 지도생성 코드 ----------------*/
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			/*------------- 지도 생성 코드 끝 ----------------*/

			/*------------- 마커 생성 코드 ----------------*/

			var positions = setLatlngArr();

			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			
			//마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(lat, lng);
			var marker;
			for(var i =0; i<positions.length; i++){
				//마커를 생성합니다
					//마커이미지 주소
					var imageSrc = '/img/placePicker.png',
					 imageSize = new daum.maps.Size(34, 50),
					 imageOption = {offset : new daum.maps.Point(27, 80)};

					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
				
					marker = new daum.maps.Marker({
					position : positions[i],
					image : markerImage
				});
				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
			}
			/*--------------마커 생성 코드 끝--------------*/
			
			//toLocal 클릭시 좌표읽어서 이동
			$('.toLocal').on('click',function(){
				console.log("클림됨");
				var geocoder = new daum.maps.services.Geocoder();

				var center = map.getCenter();

				var coord = new daum.maps.LatLng(center.getLat(), center.getLng());
				var callback = function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						
						var gu = result[0].address.region_2depth_name;
						var dong = result[0].address.region_3depth_name;


						location.href="/local/local?gu="+gu+"&dong="+dong;
						
					}
				};

				geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			});
			
		}
		
		function getArticleList(){
			console.log($("#buildings").val());
		 	var param = $("form[name=frm]").serialize();
		 	var building = document.getElementById("buildings").value;
		 	var searchName = document.getElementById("loc").value;
		 	var dl_ty = document.getElementById("dl_ty").value;
		 	var dl_excv_area = document.getElementById("dl_excv_area").value;
		 	var artcl_const_y = document.getElementById("artcl_const_y").value;
		 	var dl_price1 = document.getElementById("dl_price1").value;
		 	var dl_price2 = document.getElementById("dl_price2").value;
		 	var dl_rnt1 = document.getElementById("dl_rnt1").value;
		 	var dl_rnt2 = document.getElementById("dl_rnt2").value;
		 	
			$.ajax({
				type : "POST",
				url : "/main/mainAjax",
				data : {building : building, searchName : searchName, 
						dl_ty : dl_ty, dl_excv_area : dl_excv_area, 
						artcl_const_y : artcl_const_y, dl_price1 : dl_price1, 
						dl_price2 : dl_price2, dl_rnt1 :dl_rnt1 ,dl_rnt2 : dl_rnt2},
				success : function(data){
					$(".main-right").html("");
					$(".main-right").html(data);
					settingMap(0,0);
				}
			});
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

		
		
		
	});
	
	
	

	
	
</script>


<!-- left contents -->
<div class="main-left">
	<input type="hidden" id ="latX" value="${buildingSaleList[0].artcl_lat}">
	<input type="hidden" id ="lngY" value="${buildingSaleList[0].artcl_lng}">
	<!-- 검색 조건 -->
	<div class="search-filt">
		<!-- 검색어 -->
		<div class="search">
			<input type="hidden" id="dl_type" name="dl_type" value="${dlType}"> 
			<form method="post" name="frm">
				<input type="text" class="search-box" placeholder="지역명, 지하철역명, 아파트명" name="searchName" id="loc" value="${searchName}"> 
				<input type="hidden" id="buildings" name="building" value="${building}">
				<input type="hidden" id="dl_ty" name="dl_ty" value ="${dlType}"> 
				<input type="hidden" id="dl_excv_area" name="dl_excv_area"> 
				<input type="hidden" id="artcl_const_y" name="artcl_const_y"> 
				<input type="hidden" id="dl_price1" name="dl_price1"/>
				<input type="hidden" id="dl_price2" name="dl_price2"/>
				<input type="hidden" id="dl_rnt1" name="dl_rnt1"/>
				<input type="hidden" id="dl_rnt2" name="dl_rnt2"/> 
				<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
			</form>
		</div>

		<!-- 필터 -->
		<div class="filters-div">
			<ul class="nav nav-tabs">
				<li id="cameraDiv">
					<img  src="../img/camera.png" id="camera"/>
				</li>
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
					<div class="dropdown-menu divHeight">
						<h4 id="dlTypePrice">매매가</h4>
  						<div id="slider-bar"></div>&nbsp&nbsp&nbsp
  						<span id="price">무제한</span>
  						<hr>
					</div>
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
	<div id="mapWrap">
		<div id="map"></div>
		<div class="toLocal">
			<img src="/img/to_local.png" width="280" height="200"/>
		</div>
	</div>
</div>

<!-- right contents -->
<!-- <div id="sensor">  -->
<div class="main-right">
	<!-- 매물리스트 들어가는 자리 -->
	
	<div id="lngLat">
		<input type="hidden" id="listSize" value="${buildingSaleListSize}" />
	</div>
<!-- 매물리스트  -->
	<div class="articles">
	<form action="/detail/info" id="frmDetail">
		<input type="hidden" id="artcl_gu" name="artcl_gu">
		<input type="hidden" id="artcl_dong" name="artcl_dong">
		<input type="hidden" id="artcl_zip" name="artcl_zip">
		<input type="hidden" id="artcl_rd" name="artcl_rd">
		<input type="hidden" id="ty" name="dl_ty" value ="${dlType}">
	</form>
		<c:choose>
			<c:when test="${buildingSaleListSize != 0}">
				<c:forEach items="${buildingSaleList}" var="build">
					<div class="article">
						<input type="hidden" class="lat" value="${build.artcl_lat}">
						<input type="hidden" class="lng" value="${build.artcl_lng}">
						<input type="hidden" id="gu" value="${build.artcl_gu}">
						<input type="hidden" id="dong" value="${build.artcl_dong}">
						<input type="hidden" id="zip" value="${build.artcl_zip}">
						<input type="hidden" id="rd" value="${build.artcl_rd}">
						<c:choose>
							<c:when test="${building == 'apt'}">
								<h4 class="clickDetail">${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${building == 'house'}">
								<c:choose>
									<c:when test="${build.artcl_bc == 'multi'}">
										<h4 class="clickDetail">${build.artcl_rd}</h4><span>다세대</span>
									</c:when>
									<c:when test="${build.artcl_bc == 'multip'}">
										<h4 class="clickDetail">${build.artcl_nm}</h4><span>연립</span>
									</c:when>
									<c:when test="${build.artcl_bc == 'single'}">
										<h4 class="clickDetail">${build.artcl_rd}</h4><span>단세대</span>
									</c:when>
								</c:choose>
								<br>
							</c:when>
							<c:when test="${building == 'office'}">
								<h4 class="clickDetail">${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${building == 'store'}">
								<h4 class="clickDetail">${build.artcl_rd}</h4>
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
<!-- </div> 
 -->




























