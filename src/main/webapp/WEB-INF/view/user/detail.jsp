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
		
		//주소 좌표 변환 객체
		var geocoder = new daum.maps.services.Geocoder();

		
		<%-- toLocal 클릭시 좌표읽어서 이동 --%>
		$('.toLocal').on('click', function(){
			
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
		
	});
</script>



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

<!-- 리뷰 컨트롤 스크립트 -->
<script>
	
	$(document).ready(function(){
		
		$('.reviewDetailWrapper').hide();
		
		
		$('.titleWrapper').on('click',  function(){
			if($(this.nextElementSibling).is(':visible')){
				$(this.nextElementSibling).hide("slow");
			}else{
				$(this.nextElementSibling).show("slow");
			}
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
	
	#reviewDiv {width: 1200px; min-height: 300px;}
	.reviewWrapper {width: 1000px; margin:auto;}
	.titleWrapper {width: 1000px; margin:auto;}
	.titleWrapper * {border:1px solid black;}
	.reviewDate { clear:left; float:left; width:200px;}
	.reviewTitle {float:left; width: 600px;}
	.reviewWriter {float:left; width: 200px;}
	.reviewDetailWrapper {width:1000px;clear:left; margin:auto; padding-top: 15px; padding-bottom: 15px; }
	.starDivWrapper { height: 45px;}
	.starDiv {float:left;}
	.reportDiv {float:left; width: 800px; text-align: right;}
	.photo {clear:left;}
	.reviewModify {text-align: right;}	
	
	.class {position: absolute; }
	
	#mapWrap {position: relative;}
	.toLocal {position: absolute; top: 740px; left: 540px; z-index: 10; width:150px; height: 150px;}	
	
</style>

<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	
	<div id="mapWrap">
	<!-- 지도-->
	<div id="map"> </div>
	<!-- 지도 오버레이(지역분석으로 이동) -->
	<div class="toLocal">
		<img src="https://via.placeholder.com/100x100?text=toLocal" />
	</div>
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
			<div id="reviewDiv">
				<c:forEach begin="1" end="2">
					<div class="reviewWrapper">
						<div class="titleWrapper">
							<div class="reviewDate"> 2018-10-20</div>
							<div class="reviewTitle"> 집에서 쥐가 나와요</div>
							<div class="reviewWriter"> whdgns****</div>
						</div>
						<div class="reviewDetailWrapper">
							<div class="starDivWrapper">
								<div class="starDiv"><img src="https://via.placeholder.com/180x30"/></div>
								<div class="reportDiv"> <img src="https://via.placeholder.com/30"/></div>
							</div>
							<div class="photo">
								<img src="https://via.placeholder.com/200" />
								<img src="https://via.placeholder.com/200" />
							</div>
							<div class="reviewText">
								<p>리뷸비류비류비류비류비ㅠㄹ디ㅠㅁㄹ;ㅣㅏ덜미ㅏㄴ더로ㅓ올키ㅏ터올키ㅏ터올키타어로
									ㅁㄴㅇㄻㄴㄹㄷㅁㄴㄻㄴㄷㄻㄴㄷ라ㅕㅓㅋ농리ㅏㅓㅋ통리ㅏㅓㅋ녿ㄱ리ㅐㅏㅓㅋ녿ㄹ기ㅏ컨룈나ㅓ
								</p>
							</div>
							<div class="reviewModify">
								<button>수정</button><button>삭제</button>
							</div>
							<div class="replyWrapper">
								<div class="reply">
									fewfw*** : 야호호오오오ㅗ오오옹 <br/>
									fed2***  : 야호돚도롲돌졷ㄹ<br/>
								</div>
								<div class="writeReply">
									<input type="text" /> <button>입력</button>
								</div>
							</div>
						</div>
					</div>	
				</c:forEach>
			</div>
		</div>
	</div>
</div>