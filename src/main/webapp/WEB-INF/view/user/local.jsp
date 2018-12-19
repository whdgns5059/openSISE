<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		$('.categoryDiv').on('click', 'button', function(){
			
			setContentDivByAjax(this.id);
			
		})
		
	});
	
	function setContentDivByAjax(id){
		
		$.ajax({
			type: 'POST',
			url : '/local/'+id,
			success : function(data){
				$('.contentDiv').html(data);
			}
		});
		
	}
	


	
	
</script>

<style type="text/css">
	
	#map {width : 650px; height:1000px;}
	#rightContentWrapper {width : 1250px; height:1000px; overflow:hidden}
	#rightContent{width : 1200px; height:920px; overflow-y: scroll; overflow-x:hidden;
					margin:auto; margin-top:40px; margin-bottom: 40px;}
	#localNameDiv{text-align: center;}
	#localNameSpan {font-size: 40px;  }
	.categoryDiv {height :60px;}
	.subTitle {font-size: 30px;}
	#myChart{ width:1200px; height:500px; margin-top: 30px;}
	#siseTableDiv {width:1200px; height: 500px; text-align: center;}
	#siseTable {width: 1000px; height: 400px; margin: auto; border:1px solid black;}
	
	
</style>

<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	<!-- left contents -->
	<div id="map">
	</div>
	<!-- right contents -->
	<div id="rightContentWrapper">
		<div id="rightContent">
			<div id = "localNameDiv">
				<span id="localNameSpan">xx동 지역 분석</span>
				<hr/>
			</div>
			<div class="categoryDiv">
				<button class="category" id="popStatis">인구통계</button>
				<button class="category" id="nearFaci">근린시설</button>
				<button class="category" id="market">물가정보</button>
				<button class="category" id="etc">기타정보</button>
			</div>
			<div class="contentDiv">

			</div>
		</div>
	</div>
</div>