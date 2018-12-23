<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/local.css" rel="stylesheet">
<script>

	$(document).ready(function(){

		// 해당 주소에 대한 좌표값을 담을 변수
		var x;
		var y;
	
		// 해당 주소를 담을 값
		var addr;
		
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(36.3505393936125,127.38483389033713), // 지도의 중심좌표
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
		
		
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		setContentDivByAjax('popStatis');
		
		$('.categoryDiv').on('click', '.category', function(){
			
			setContentDivByAjax(this.id);
			
		})
		
	});
	
	function setContentDivByAjax(id){
		var dong = "${dong}";
		$.ajax({
			type: 'POST',
			data : {dong : dong},
			url : '/local/'+id,
			success : function(data){
				$('.contentDiv').html(data);
			}
		});
		
	}
	


	
	
</script>

<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	<!-- left contents -->
	<div id="map">
	</div>
	<!-- right contents -->
	<div id="rightContentWrapper">
		<div id="rightContent">
			<div id = "localNameDiv">
				<span id="localNameSpan">${dong} 지역 분석</span>
				<hr/>
			</div>
			<div class="categoryDiv">
				<ul class="nav nav-tabs tab-yellow">
					<li class="nav-item"><a class="nav-link tab-yellow show category" data-toggle="tab" href="#signDaily" id="popStatis">인구 통계</a></li>
					<li class="nav-item"><a class="nav-link tab-yellow category" data-toggle="tab" href="#signAgeGndr" id="nearFaci">근린 시설</a></li>
					<li class="nav-item"><a class="nav-link tab-yellow category" data-toggle="tab" href="#signMonthly" id="market">물가 정보</a></li>
					<li class="nav-item"><a class="nav-link tab-yellow category" data-toggle="tab" href="#signAgeGndr" id="">교통 정보</a></li>
					<li class="nav-item"><a class="nav-link tab-yellow category" data-toggle="tab" href="#signAgeGndr" id="etc">기타 정보</a></li>
				</ul>
			</div>
			<div class="contentDiv">

			</div>
		</div>
	</div>
</div>