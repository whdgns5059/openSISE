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

#auctions {
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
.auction {
	width: 500px;
	/* height: 170px; */
	margin: 15px 0;
	padding: 20px 20px 10px 20px;
	border: 1px solid #e0e0e0;
	font-size: 15px;
	font-family: 'Nanum Gothic Coding', monospace;
	background: white;
	cursor: pointer;
}
.h4 {
	width: 50%;
    margin-bottom: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	color: #4159a9;
	font-size: 24px;
}
.address {
	margin-top: 8px;
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
.toLocal {position: absolute; top: 740px; left: 1150px; z-index: 10; width:150px; height: 150px;}


</style>
<link href="/css/boostratp_slider_css_js/css/bootstrap-slider.css" rel="stylesheet">
<script type="text/javascript" src="/css/boostratp_slider_css_js/js/bootstrap-slider.js"></script>
<script type="text/javascript">
	//36.3505393936125,127.38483389033713
	$(document).ready(function() {
		
		// 경매 리스트 뿌리기
		aucListAjax();
		/* settingMap(0.0); */
		
		function settingMap(x,y){
			var lat;
			var lng;
			lat = 36.3505393936125;
			lng = 127.38483389033713;
			
			// 해당 주소를 담을 값
			var addr;

			/*------------ 지도생성 코드 ----------------*/
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			/*------------- 지도 생성 코드 끝 ----------------*/

			/*------------- 마커 생성 코드 ----------------*/

			/* var positions = setLatlngArr(); */

			//마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(lat, lng);
			var marker;
			for(var i =0; i<positions.length; i++){
				//마커를 생성합니다
					marker = new daum.maps.Marker({
					position : positions[i]
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

		/* geocoder로 좌표 변환 */
		var geocoder = new daum.maps.services.Geocoder();

		var addr = document.getElementById('addr').value;
		//주소로 좌표검색
		geocoder.addressSearch(addr, function(result, status) {

			//TODO : 주소로 좌표 검색...
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});

				map.setCenter(coords);

			}

		});
		/*     */
		
		
	});
	
	function aucListAjax(){
	 	
		$.ajax({
			type : "GET",
			url : "/auction/aucListAjax",
			success : function(data){
				console.log("여기");
				$("#auctions").html(data);
				/* settingMap(0,0); */
			}
		});
	}
	
	
</script>


<!-- left contents -->
<div class="main-left">
	<input type="hidden" id ="latX" value="${buildingSaleList[0].artcl_lat}">
	<input type="hidden" id ="lngY" value="${buildingSaleList[0].artcl_lng}">
	
	<!-- 지도 -->
	<div id="mapWrap">
		<div id="map"></div>
	</div>
</div>

<!-- right contents -->
<div class="main-right">
	<!-- 매물리스트 들어가는 자리 -->
	
	<div id="lngLat">
		<input type="hidden" id="listSize" value="${buildingSaleListSize}" />
	</div>
<!-- 경매 리스트  -->
	<div id="auctions">
		
	</div>
</div>




























