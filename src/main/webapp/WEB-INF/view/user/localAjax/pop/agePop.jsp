<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	
function setChart(){
	var colorList = new Array();
	colorList.push("#f7cc06");
	colorList.push("#f38b72");
	colorList.push("#aad035");
	var i = 0;
	// 전체 인구수 최대치
	var allCnt = ${ageHumanStatisMaxValue} +1;
	
var totalPopChart = {
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
                   <c:forEach items="${ageHumanStatisList}" var= "ehs" varStatus="status">
                   	<c:if test="status % 3 == 0">
                   		${ehs.hs_date},
                   	</c:if>
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
                    	
                    	<c:forEach items="${ageHumanStatisList}" var= "ehs">
                    		${ehs.hs_hm_no},
                    	</c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "6월",
                }/* ,
                {
                  // 실제 값
                    "values": [
                    	 4,8,5,2,9,2
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "12월",
                } */
            ]
        }
    ]
	};

	zingchart.render({ 
		id : 'myChart', 
	 	data: totalPopChart,
		height: '400px', 
		width: '100%' 
	});
}

setChart();
	
</script>
<div id="myChart"></div>
<div>
	<div id="siseTableDiv">
		<span class="subTitle">나이별 인구표</span>
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