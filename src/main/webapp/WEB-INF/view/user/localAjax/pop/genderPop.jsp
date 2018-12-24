<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	
function setChart(){
	var colorList1 = new Array();
	colorList1.push("#f7cc06");
	colorList1.push("#f38b72");
	colorList1.push("#aad035");
	var i = 0;
	// 전체 인구수 최대치
	var allCnt = ${gndrHumanStatisMaxValue} +1;
	
		var genderPopChart = {
		    "graphset": [
		        {
		            "type": "bar",
		            "background-color": "white",
		            "plotarea": {
		                "margin": "dynamic"
		            },
		            "legend": {
		                "overflow": "none",
		                "alpha": 0.05,
		                "shadow": false,
		                "align":"center",
		                "adjust-layout":true,
		                "marker": {
		                    "type": "square",
		                    "border-radius": "5",
		                    "border-color": "none",
		                    "size": "10px",
		                    "cursor": "pointer"
		                },
		                "border-width": 0,
		                "maxItems": 3,
		                "toggle-action": "hide",
		            },
		            "plot": {   
		                "bars-space-left":0.15,
		                "bars-space-right":0.15,
		                "animation": {
		                    "effect": "ANIMATION_SLIDE_BOTTOM",
		                    "sequence": 0, 
		                    "speed": 800
		                }
		            },
		            "scale-y": {
		                "line-color": "#7E7E7E",
		                "item": {
		                    "font-color": "#7e7e7e"
		                },
		                "min-value": 0,
		            	"max-value": allCnt + 10,
		                "guide": {
		                    "visible": true,
		                    "line-style": "dashed"
		                },
		                "label": {
		                  "text": "인구 수(명)",
		                  "font-family": "'Noto Sans KR', sans-serif",
					            "font-weight": "400",
					            "font-size": "15px",
					            "font-color": "#808080",
		                },
		            },
		            "scaleX":{
		               // x축
		                "values": [
		                   <c:forEach items="${hsDate}" var= "ghs">
		                   		${ghs.hs_date},
		                   </c:forEach>
		                ],
		                "placement":"default",
		                "tick":{
		                    "size":58,
		                    "placement":"cross"
		                },
		                "itemsOverlap":true,
		                "item":{
		                    "offsetY":-55
		                }
		            },
		            "tooltip": {
		              "visible": false
		            },
		            "crosshair-x":{
		                "line-width":"100%",
		                "alpha":0.18,
		                "plot-label":{
		                  "header-text":"%kv"
		                }
		            },
		            "series": [
		                {
		                  // 실제 값
		                    "values": [
		                    	<c:forEach items="${gndrHumanStatis}" var= "ghs">
		                    		<c:if test="${ghs.hs_gndr == '여자'}">
		                    			${ghs.hs_hm_no},
		                    		</c:if>
		                    	</c:forEach>
		                    ],
		                    "alpha": 0.95,
		                    "borderRadiusTopLeft": 7,
		                    "background-color": colorList1[i++],
		                    "text": "여자",
		                } ,
		                {
		                  // 실제 값
		                    "values": [
		                    	<c:forEach items="${gndrHumanStatis}" var= "ghs">
		                    		<c:if test="${ghs.hs_gndr == '남자'}">
		                    			${ghs.hs_hm_no},
		                    		</c:if>
	                    	</c:forEach>
		                    ],
		                    "alpha": 0.95,
		                    "borderRadiusTopLeft": 7,
		                    "background-color": colorList1[i++],
		                    "text": "남자",
		                }
		            ]
		        }
		    ]
			};

			zingchart.render({ 
				id : 'myChart', 
			 	data: genderPopChart,
				height: '400px', 
				width: '100%' 
			});
	
	
}

setChart();
	
</script>
<div id="myChart"></div>
<div>
	<div id="siseTableDiv">
		<span class="subTitle">성별 인구표</span>
		<table id="siseTable" class="table">
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