<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>


<script type="text/javascript">
	$(document).ready(function(){
		

		
		// 해당 주소에 대한 좌표값을 담을 변수
		var x;
		var y;
	
		// 해당 주소를 담을 값
		var addr;
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
		
	});
</script>


<!-- 챠트 -->
<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<!-- 실거래 차트  -->
<script>

	$(document).ready(function(){
		var tradeChartData = {

		type: 'line',  
		title: { text: '1년간 실거래가'  },
		legend: {}, // Creates an interactive legend
		series: [  // Insert your series data here
			  { values: [28, 40, 39, 36, 12, 3, 32, 2, 12, 12, 32] }
		 	 ]
		
		
		};

		zingchart.render({ // Render Method[3]
		  id: 'myChart',
		  data: tradeChartData,
		});
		
	});

</script>
<!-- 다각형 그래프 -->
<script>

	$(document).ready(function(){
		var radarChartData = {

		type: 'radar',  
		title: { text: 'openSISE 점수표'  },
		legend: {}, // Creates an interactive legend
		series: [  // Insert your series data here
			  { values: [28, 40, 39, 36, 12] }
		 	 ],
		scaleK : {
			labels : ["물가", "교통", "상업시설", "편의시설", "물가"]
		}
		
		
		
		};

		zingchart.render({ // Render Method[3]
		  id: 'radarChartDiv',
		  data: radarChartData,
		});
		
	});

</script>


<style type="text/css">
	#map {width : 650px; height:1000px;}
	#rightContentWrapper {width : 1250px; height:1000px; overflow:hidden}
	#rightContent{width : 1200px; height:920px; overflow-y: scroll; overflow-x:hidden;
					margin:auto; margin-top:40px; margin-bottom: 40px;}
	#articleNameDiv{text-align: center;}
	#articleNameSpan {font-size: 40px;  }
	#tabDiv {height:30px;}
	#threeMonthInfoDiv{height: 110px; width:1500px; text-align:center; padding-top: 10px;}
	.subThreeMonth {float:left; width:600px;}		
	.floatClearDiv {clear:both; padding: 5px;}
		
	.subTitle {font-size: 30px;}
	.subContent {font-size: 25px;}
	
	#myChart{ width:1200px; height:500px; margin-top: 30px;}
	
	#siseTableDiv {width:1200px; height: 500px; text-align: center;}
	#siseTable {width: 1000px; height: 400px; margin: auto; border:1px solid black;}
	
	#loanClacDiv {width: 1200px; height: 200px; text-align: center;}
	.marginTop {margin-top: 30px;}
	
	#radarChartDiv {width: 1200px; height:500px;}
</style>

<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	<!-- left contents -->
	<div id="map">
	</div>
	<!-- right contents -->
	<div id="rightContentWrapper">
		<div id="rightContent">

			<div id = "articleNameDiv">
				<span id="articleNameSpan">대덕 아파트</span>
				<hr/>
			</div>
			<div id="tabDiv">
				<button>10평</button>
				<button>20평</button>
				<button>30평</button>
				<button>40평</button>
			</div>
			<div id="threeMonthInfoDiv">
				<div class="subThreeMonth">
					<span class="subTitle">3개월 평균 시세</span><br/>
					<span class="subContent">보증금 1000</span><span class="subContent">월세 40만원</span>
				</div>
				<div class="subThreeMonth">
					<span class="subTitle">가장 최근 거래가</span><br/>
					<span class="subContent">보증금 1100</span><span class="subContent">월세 42만원</span>
				</div>
				<div class="floatClearDiv">
					<hr/>
				</div>
			</div>
			<div id="myChart">
			</div>
			
			<div id="siseTableDiv">
				<span class="subTitle">실거래 시세표</span> <button>전체 시세표</button>
				<table id="siseTable">
					<thead>
						<tr>
							<td>거래일</td>
							<td>보증금</td>
							<td>월세</td>
							<td>층</td>
						</tr>
					</thead>	
					<tbody>
						<c:forEach begin="1" end="5">
						<tr>
							<td>2018년 10월 2일</td>
							<td>1000만원</td>
							<td>40만원</td>
							<td>4</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
			<div id="loanClacDiv">
				<span class="subTitle"> 대출금 계산기</span><br/>
				<input type="range" class="marginTop">
			</div>
			<div id="radarChartDiv">
				
			</div>
			<div><img src="https://via.placeholder.com/1200x300/ffeb99?text=review" /></div>
		</div>
	</div>
</div>