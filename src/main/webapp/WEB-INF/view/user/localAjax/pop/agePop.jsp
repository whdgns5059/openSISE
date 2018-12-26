<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	// 연령 선택
	$("#selBox").on("change", function(){
		var mem_age = this.value;
		var ageData = {dong : "${dong}", hs_age_grp : mem_age };
		
		$.ajax({
			type : 'POST',
			url : '/local/ageAjaxPop',
			data : ageData,
			success : function(data){
				// 연령별 관심사 그래프
				$('#myChart').html(data);
			}
		});
	});
		
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
		                "min-value": ${ageHumanStatisMinValue},
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
		                    	<c:forEach items="${ageHumanStatisList}" var= "ahs">
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

		function setAgeCircle(){
			console.log("circle실행");
			var colorList = new Array();
			colorList.push("#f7cc06");
			colorList.push("#f38b72");
			colorList.push("#aad035");
			colorList.push("#71afdd");
			colorList.push("#bc80d2");
			colorList.push("#909090");
			colorList.push("#3ea6c8");
			colorList.push("#f4b344");
			colorList.push("#f29c3e");
			colorList.push("#4385cd");
			colorList.push("#61c773");
			colorList.push("#b07748");
			colorList.push("#d080aa");
			colorList.push("#cec440");
			colorList.push("#9d8cc1");
			var i = 0;
			// 관심사 수 최대치
			var allCnt = ${gndrHumanStatisMaxValue} +1;
			
			/* 관심사별 선택 그래프 */
			var ageCircle = {
			 	type: "ring",
			 	plot: {
			 	  slice:'50%',
			 	  borderWidth:0,
			 	  animation:{
			 	    effect:2,
			 	    sequence:3
			 	  },
			 	  valueBox: [
			 	    {
			 	      type: 'all',
			 	      text: '%t',
			 	      placement: 'out'
			 	    }, 
			 	    {
			 	      type: 'all',
			 	      text: '%npv%',
			 	      placement: 'in'
			 	    }
			 	  ]
			 	},
			// 둥근차트 가운데 정보
			tooltip:{
			 	fontSize:16,
			 	anchor:'c',
			 	x:'50%',
			 	y:'58%',
			 	sticky:true,
			 	backgroundColor:'none',
			 	borderWidth:0,
			 	thousandsSeparator:',',
			 	text:'<span style="color:%color"> %t</span><br><span style="color:%color">인원 수: %v</span>',
			    mediaRules:[ { maxWidth:500, y:'54%' }]
			},
			plotarea: {
				backgroundColor: 'transparent',
			 	borderWidth: 0,
			 	borderRadius: "0 0 0 10",
			 	margin: "30 0 30 0"
			},
			// 작은 컨트롤러
			legend : {
				layout: 'x8',
			    toggleAction:'remove',
			    borderWidth:0,
			    adjustLayout:true,
			    align:'center',
			    verticalAlign:'top',
			    margin: '30 0 0 0',
			    marker: {
			        type:'circle',
			        cursor:'pointer',
			        borderWidth:0,
			        size:5
			    },
			    item: {
			        fontColor: "#777",
			        cursor:'pointer',
			        offsetX:-6,
			        fontSize:12
			    },
			    mediaRules:[{ maxWidth:500, visible:false}]
			},
			scaleR:{
			  refAngle:270
			},
			series : [
				// 관심별 데이터
				 <c:forEach items="${ageCircle}" var="age">
					{
					 	text: '${age.hs_age_grp}',
						values : [${age.hs_hm_no}],
						backgroundColor: colorList[i++], 
						lineWidth: 1,
						marker: {
						  backgroundColor: colorList[i]
						}
					},
				</c:forEach>
			]};
			zingchart.render({ 
				id : 'ageCircle', 
			 	data: {
			    graphset: [ageCircle]
			  },
				height: '100%', 
				width: '99%' 
			});
		}

		setChart();
		setAgeCircle();
	
});
	
</script>
<div class="tab-pane fade show" id="intrstAge">
	<p>연령&nbsp:&nbsp
		<select id="selBox" >
		  	<option value="allAge" selected>0~4세</option>
			<c:forEach items="${ageList}" var="age">
		  		<option value="${age.hs_age_grp}">${age.hs_age_grp}</option>
			</c:forEach>
		</select>
	</p>
	<div id="myChart" style="height: 500px;"></div>
</div>

<div>
	<div id="siseTableDiv">
		<span class="subTitle"> 연령별 인구 비율 그래프</span>
		<div id="ageCircle" style="height: 500px;"></div>
	</div>
</div>