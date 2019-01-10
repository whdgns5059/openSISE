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
	var allCnt = ${allHumanMaxValue} +1;
	
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
                "min-value": ${allHumanMinValue}-3000,
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
                   <c:forEach items="${hsDate}" var= "ahs">
                   		${ahs.hs_date},
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
                    	<c:forEach items="${allHumanStatis}" var= "ahs">
                    		${ahs.hs_hm_no},
                    	</c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "총 인구수(명)",
                }
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
		<span class="subTitle">전체 인구표</span>
		<table id="siseTable" class="table">
			<thead>
				<tr>
					<td>날짜</td>
					<td>남</td>
					<td>여</td>
					<td>합계</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allTalbeList}" var="at">
					<tr>
						<td>${at.hs_date}</td>
						<td>${at.hs_gndrm}</td>
						<td>${at.hs_gndrf}</td>
						<td>${at.hs_hm_no}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>