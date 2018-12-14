<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
</style>
<script>
$(document).ready(function(){
	var colorList = new Array();
	colorList.push("#f7cc06");
	colorList.push("#f38b72");
	colorList.push("#aad035");
	var i = 0;
	var certi = ["여성","남성","총"];
	// 관심사 수 최대치
	var allCnt = ${maxCnt} +1;
	
var intrstAgeG = {
    "graphset": [
        {
            "type": "bar",
            "background-color": "white",
            "plotarea": {
                "margin": "dynamic"
            },
            "legend": {
                "layout": "x5",
                "overflow": "none",
                "alpha": 0.05,
                "shadow": false,
                "align":"center",
                "adjust-layout":true,
                "marker": {
                    "type": "circle",
                    "border-color": "none",
                    "size": "10px"
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
                    "speed": 800,
                    "delay": 800
                }
            },
            "scale-y": {
                "line-color": "#7E7E7E",
                "item": {
                    "font-color": "#7e7e7e"
                },
                "values": "0:"+allCnt+":"+Math.ceil(allCnt/10),
                "guide": {
                    "visible": true,
                    "line-style": "dashed"
                },
                "label": {
                  "text": "관심 수",
                  "font-family": "'Noto Sans KR', sans-serif",
			            "font-weight": "400",
			            "font-size": "15px",
			            "font-color": "#808080",
                },
            },
            "scaleX":{
               // x축
                "values": [
                    <c:forEach items="${intrstAge }" var="intrstVo">
                      "${intrstVo.intrst_nm}",
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
                  "header-text":"%kv Sales"
                }
            },
            "series": [
                {
                  // 실제 값
                    "values": [
		              <c:forEach items="${intrstAge }" var="intrstVo">
                       	${intrstVo.female},
		              </c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "여성",
                },
                {
                  // 실제 값
                    "values": [
		              <c:forEach items="${intrstAge }" var="intrstVo">
                       	${intrstVo.male},
		              </c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "남성",
                },
                {
                  // 실제 값
                    "values": [
		              <c:forEach items="${intrstAge }" var="intrstVo">
                       	${intrstVo.counts},
		              </c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "총",
                },
            ]
        }
    ]
	};

	zingchart.render({ 
		id : 'intrstAgeG', 
	 	data: intrstAgeG,
		height: '100%', 
		width: '100%' 
	});
});
				
</script>







