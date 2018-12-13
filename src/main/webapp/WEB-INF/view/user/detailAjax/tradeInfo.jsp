<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script type="text/javascript">


<%-- 실거래 차트  --%>
function setTradeChart() {

	<%--
	var tradeChartData = {
		type: 'line',  
		title: { text: '1년간 실거래가'  },
		legend: {}, // Creates an interactive legend
		series: [  { values: [ 0
			<c:forEach items="${dealListByArea}" var="dealVo">
				,${dealVo.dl_price}
			</c:forEach>
			] } ]
		
	};
	
	zingchart.render({ // Render Method[3]
	  id: 'myChart',
	  data: tradeChartData,
	});
	--%>
	var myConfig = {
			"graphset":[
			    {
			        "type":"line",
			        "background-color":"#ECEFF1",
			        "globals":{
			          "fontColor":"#212121"
			        },
			        "title":{
			            "text":"Scientific Notation w/ Log Scales",
			            "adjustLayout": true
			        },
			        "plotarea":{
			            "margin":"dynamic 50 dynamic dynamic",
			            "backgroundColor":"#fff"
			        },
			         "shapes":[
			              {
			                "type":"rectangle",
			                "id":"view_all",
			                "height":"20px",
			                "width":"75px",
			                "border-color":"#777",
			                "border-width":"1px",
			                "x":"86%",
			                "y":"7%",
			                "background-color":"white",
			                "alpha":0.6,
			                "cursor":"hand",
			                "label":{
			                  "text":"View All",
			                  "font-size":12,
			                  "bold":true
			                }
			              }
			            ],
			        "scale-x":{
			            "min-value": 10000000,
			            "step":"month",
			            "itemsOverlap": true,
			            "tick":{
			 
			            },
			            "minor-ticks":4,
			            "minor-tick":{
			 
			            },
			            "transform":{
			                "type":"date",
			                "all":"%D, %d %M<br>%h:%i %A"
			            },
			            "zooming":true
			        },
			        "tooltip":{
			            "visible":false
			        },
			        "scale-y":{
			        	"min-value" : 8000,
			            "progression":"number",
			            "auto-fit":true,
			            "item":{
			                "font-weight":"bold"
			            },
			            "tick":{
			            }
			        },
			        "crosshair-x":{
			          "lineColor":"#B71C1C",
			            "plotLabel":{
			              "backgroundColor":'#CFD8DC'
			            },
			            "scaleLabel":{
			              "fontColor":"#fff"
			            },
			            "marker":{
			              "backgroundColor":"#263238",
			              "size": 5,
			              "type":"triangle",
			              "angle": 180,
			              "offsetY": -10,
			              "offsetX": -1
			            }
			        },
			        "preview":{
			            "adjustLayout": true,
			            "live":1
			        },
			        "plot":{
			            "decimals":10,
			            "line-width":2,
			            "max-nodes":500,
			            "exponent":true,
			            "exponent-decimals":3,
			            "lineColor":'#607D8B',
			            "marker":{
			                "type":"circle",
			                "size":3,
			                "backgroundColor":'#455A64'
			            },
			            "tooltip-text":"%v"
			        },
			        "series":[
			            {
			                "text":"Series 1 Data",
			                "values":[
			                	${dealListByArea[0].dl_price}
			                	<c:forEach items="${dealListByArea}" var="dealVo">
			                		,${dealVo.dl_price}
			                	</c:forEach>
			                	]
			            }
			        ]
			    }
			]
			};
			 
			zingchart.render({ 
				id : 'myChart', 
				data : myConfig, 
			});
			 
			zingchart.shape_click = function(p){
			  if(p.shapeid == "view_all"){
			    zingchart.exec(p.id,'viewall');
			  }
			}

}

setTradeChart();



</script>
<div id="threeMonthInfoDiv">
	<div class="subThreeMonth">
		<span class="subTitle">1년 평균 ${dl_ty }가</span><br/>
		<span class="subContent">${avgTradeVo.avg_price }</span>
	</div>
	<div class="subThreeMonth">
		<span class="subTitle">가장 최근 거래가</span><br/>
		<c:forEach items="${recentTradeList }" var="rtList">
			<span class="subContent">${rtList.dl_price } / </span>
			<span class="subContent">${rtList.dl_flr} 층 /</span>
			<span class="subContent">${rtList.dl_cont_ym}</span>
			<br/>
		</c:forEach>
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
				<td>거래금액</td>
				<td>층</td>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${dealListByArea }" var="dealList" begin="0" end="6">
			<tr>
				<td>${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
				<td>${dealList.dl_price }</td>
				<td>${dealList.dl_flr }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
</div>
<div id="loanClacDiv">
	<span class="subTitle"> 대출금 계산기</span><br/>
	<input type="range" class="marginTop" id="calculator" max="${avgTradeVo.avg_price }"><br/>
	<span id="calcResult">얼마일까</span>
</div>