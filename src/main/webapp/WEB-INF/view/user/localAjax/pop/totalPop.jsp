<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	
function setChart(){
	
	var tradeChartData = {
			type: 'line',  
			title: { text: '인구통계'  },
			legend: {}, // Creates an interactive legend
			series: [  // Insert your series data here
				  { values: [28, 40, 39, 36, 12, 3, 32, 2, 12, 12, 32] }
			 	 ]
			
			
			};
			zingchart.render({ // Render Method[3]
			  id: 'myChart',
			  data: tradeChartData,
			});
	
}

setChart();
	
</script>
<div id="myChart"></div>
<div>
	<div id="siseTableDiv">
		<span class="subTitle">전체 인구표</span>
		<table id="siseTable">
			<thead>
				<tr>
					<td>조사일</td>
					<td>총인구</td>
					<td>남</td>
					<td>여</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="5">
					<tr>
						<td>2018년 10월</td>
						<td>1000</td>
						<td>5000</td>
						<td>5000</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>