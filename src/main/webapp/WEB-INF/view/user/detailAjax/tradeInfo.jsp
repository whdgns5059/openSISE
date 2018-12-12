<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

setTradeChart();

<%-- 실거래 차트  --%>
function setTradeChart() {
	var tradeChartData = {
	type: 'line',  
	title: { text: '1년간 실거래가'  },
	legend: {}, // Creates an interactive legend
	series: [  { values: [28, 40, 39, 36, 12, 3, 32, 2, 12, 12, 32] } ]
	
	};

	zingchart.render({ // Render Method[3]
	  id: 'myChart',
	  data: tradeChartData,
	});

}

</script>
<div id="threeMonthInfoDiv">
	<div class="subThreeMonth">
		<span class="subTitle">1년 평균 매매가</span><br/>
		<span class="subContent">10000만원</span>
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
	<input type="range" class="marginTop" id="calculator" max="17000"><br/>
	<span id="calcResult">얼마일까</span>
</div>