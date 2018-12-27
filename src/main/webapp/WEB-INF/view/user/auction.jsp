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
		
		settingMap(0.0);
		
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

			var positions = setLatlngArr();

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

		
		
		
	});
	
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
<!-- 매물리스트  -->
	<div class="articles">
	<form action="/detail/info" id="frmDetail">
		
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
</div>




























