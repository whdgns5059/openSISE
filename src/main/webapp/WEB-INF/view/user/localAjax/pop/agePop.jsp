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
            "type": "line",
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
                "min-value": 3000,
            	"max-value": allCnt + 10,
            	"values" : "${ageHumanStatisMinValue}-100 : " + (allCnt+10) + ": 500" , 
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
                   <c:forEach items="${hsDate}" var= "ehs">
                   		${ehs.hs_date},
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
                    	
                    	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                    		<c:if test="${ahs.hs_age_grp == '0~4세'}">
                    			${ahs.hs_hm_no},
                    		</c:if>
                    	</c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "0~4세",
                } ,
                {
                  // 실제 값
                    "values": [
                    	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                		<c:if test="${ahs.hs_age_grp == '5~9세'}">
                			${ahs.hs_hm_no},
                		</c:if>
                	</c:forEach>
                    ],
                    "alpha": 0.95,
                    "borderRadiusTopLeft": 7,
                    "background-color": colorList[i++],
                    "text": "5세~9세",
                },
                {
                    // 실제 값
                      "values": [
                      	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                  		<c:if test="${ahs.hs_age_grp == '10~14세'}">
                  			${ahs.hs_hm_no},
                  		</c:if>
                  	</c:forEach>
                      ],
                      "alpha": 0.95,
                      "borderRadiusTopLeft": 7,
                      "background-color": colorList[i++],
                      "text": "10~14세",
                  },
                  {
                      // 실제 값
                        "values": [
                        	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                    		<c:if test="${ahs.hs_age_grp == '15~19세'}">
                    			${ahs.hs_hm_no},
                    		</c:if>
                    	</c:forEach>
                        ],
                        "alpha": 0.95,
                        "borderRadiusTopLeft": 7,
                        "background-color": colorList[i++],
                        "text": "15~19세",
                  },
                  {
                      // 실제 값
                        "values": [
                        	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                    		<c:if test="${ahs.hs_age_grp == '20~24세'}">
                    			${ahs.hs_hm_no},
                    		</c:if>
                    	</c:forEach>
                        ],
                        "alpha": 0.95,
                        "borderRadiusTopLeft": 7,
                        "background-color": colorList[i++],
                        "text": "20~24세",
                   },
                   {
                       // 실제 값
                         "values": [
                         	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                     		<c:if test="${ahs.hs_age_grp == '25~29세'}">
                     			${ahs.hs_hm_no},
                     		</c:if>
                     	</c:forEach>
                         ],
                         "alpha": 0.95,
                         "borderRadiusTopLeft": 7,
                         "background-color": colorList[i++],
                         "text": "25~29세",
                    },
                    {
                        // 실제 값
                          "values": [
                          	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                      		<c:if test="${ahs.hs_age_grp == '30~34세'}">
                      			${ahs.hs_hm_no},
                      		</c:if>
                      	</c:forEach>
                          ],
                          "alpha": 0.95,
                          "borderRadiusTopLeft": 7,
                          "background-color": colorList[i++],
                          "text": "30~34세",
                     },
                     {
                         // 실제 값
                           "values": [
                           	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                       		<c:if test="${ahs.hs_age_grp == '35~39세'}">
                       			${ahs.hs_hm_no},
                       		</c:if>
                       	</c:forEach>
                           ],
                           "alpha": 0.95,
                           "borderRadiusTopLeft": 7,
                           "background-color": colorList[i++],
                           "text": "35~39세",
                      },
                      {
                          // 실제 값
                            "values": [
                            	<c:forEach items="${ageHumanStatisList}" var= "ahs">
                        		<c:if test="${ahs.hs_age_grp == '40~44세'}">
                        			${ahs.hs_hm_no},
                        		</c:if>
                        	</c:forEach>
                            ],
                            "alpha": 0.95,
                            "borderRadiusTopLeft": 7,
                            "background-color": colorList[i++],
                            "text": "40~44세",
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
		<span class="subTitle">2018년 연령별 인구 표</span>
		<table id="siseTable" class="table">
			<thead>
				<tr>
					<th>연령대</th>
					<th>인구 수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ageHumanStatisList}" var= "ahs">
				<c:if test="${ahs.hs_date == '201801'}">
				<tr>
					<td>${ahs.hs_age_grp}</td>
					<td>${ahs.hs_hm_no}명</td>
				</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>