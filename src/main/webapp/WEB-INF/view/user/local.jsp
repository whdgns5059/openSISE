<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script>

	$(document).ready(function(){

		// 해당 주소에 대한 좌표값을 담을 변수
		var x;
		var y;

		// 해당 주소를 담을 값
		var addr;

		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(36.3505393936125, 127.38483389033713), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(36.3505393936125, 127.38483389033713);
		//마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});
		
		marker.setMap(map);
		
	});

	
</script>

<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	<!-- left contents -->
	<div id="map">
	</div>
	<!-- right contents -->
	<div>
		<img src="https://via.placeholder.com/1150x850/aaffaa?text=/user/local.jsp" />
	</div>
</div>