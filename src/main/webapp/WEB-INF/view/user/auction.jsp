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
	padding-top: 50px;
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
.urlA {
    color: #f3af3d;
    background: #f5f3f0;
    display: block;
    width: 29%;
    margin: 0 auto;
    padding: 20px 0 15px 47px;
    font-weight: 100;
    font-size: 20px;
    font-family: 'Do Hyeon', sans-serif;
    position: fixed;
    float: left;
}
.auction {
	width: 500px;
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
<script type="text/javascript">
function settingMap(x,y){
	var lat;
	var lng;
	lat = 36.3505393936125;
	lng = 127.38483389033713;
	
	// 해당 주소를 담을 값
	var addr;

/*------------ 지도생성 코드 ----------------*/
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

	mapOption = {
		center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		level : 5 // 지도의 확대 레벨
	};
	// 지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
/*------------- 지도 생성 코드 끝 ----------------*/
 
 	getGeocoder('addr');
 	
// 마우스 오버에 따른 지도 이동
 	$('#auctions').on('mouseover','.auction',function(){
		var addr = this.children[0].value;
		movingMap(addr);
	});
	
 	function panTo(y, x) {
 	    // 이동할 위도 경도 위치를 생성합니다 
 	    var moveLatLon = new daum.maps.LatLng(y, x);
 	    
 	    // 지도 중심을 부드럽게 이동시킵니다
 	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
 	    map.panTo(moveLatLon);            
 	}

 	/* 중심좌표 바꾸기 */
 	function movingMap(addr){
 		
 		var geocoder = new daum.maps.services.Geocoder();
 		
 		// 주소 
 		var address = addr;
 		//주소로 좌표검색
 		geocoder.addressSearch(address, function(result, status) {
 		
 			// 좌표 검색 성공시
 			if (status === daum.maps.services.Status.OK) {
 				// 지도 위치 이동
 				panTo(result[0].y, result[0].x);
 				
 			}
 		});
 	}; 
// 마우스 오버에 따른 지도 이동 끝
 	
/*------------- 마커 생성 코드 ----------------*/
	/* geocoder로 좌표 변환 */
	function getGeocoder(addr){
		var geocoder = new daum.maps.services.Geocoder();
		
		for(var i = 0; i< document.getElementsByClassName(addr).length ; i++){
			// 주소 
			var address = document.getElementsByClassName(addr)[i].value;
			//주소로 좌표검색
			geocoder.addressSearch(address, function(result, status) {
	
				// 좌표 검색 성공시
				if (status === daum.maps.services.Status.OK) {
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					
					//마커이미지 주소
					var imageSrc = '/img/placePicker.png',
					imageSize = new daum.maps.Size(34, 50),
					imageOption = {offset : new daum.maps.Point(27, 80)};
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
					
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords,
						image: markerImage, // 마커이미지 설정 
						clickable: true
					});
		
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
				}
			});
		}
	};
/*--------------마커 생성 코드 끝--------------*/
};



/* 경매 리스트 출력하는 메서드 */
function aucListAjax(){
 	
	$.ajax({
		type : "GET",
		url : "/auction/aucListAjax",
		success : function(data){
			$("#auctions").html(data);
			
			/* 지도를 뿌리고, 마커를 표시 */
			settingMap(0,0);
		}
	});
};


$(document).ready(function() {
		
		// 경매 리스트 뿌리기
		aucListAjax();
		
});
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
	<a href="https://www.courtauction.go.kr/" class="urlA">법원 경매 사이트로 이동</a>
	
<!-- 경매 리스트  -->
	<div id="auctions">
		
	</div>
</div>




























