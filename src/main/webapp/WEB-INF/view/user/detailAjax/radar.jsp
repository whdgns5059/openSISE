<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div>
	<input type="hidden" id="priceStat" value="${priceStat }"/>
	<input type="hidden" id="marketStat" value="${marketStat}"/>
	<input type="hidden" id="humanStat" value="${humanStat }"/>
	<div id="radarChart"> 
	</div>		
</div>


<script>
	
var priceStat = document.getElementById('priceStat').value;
var marketStat = document.getElementById('marketStat').value;
var humanStat = document.getElementById('humanStat').value;

var statArr = [parseFloat(priceStat), parseFloat(marketStat), parseFloat(humanStat)];


var radarConfig = 
        {
            "type": "radar",
            "background-color": "white",
            "border-top": "3px solid #7e7e7e",
            "border-bottom": "3px solid #7e7e7e",
            "border-right": "3px solid #7e7e7e",
            "border-left": "3px solid #7e7e7e",
            "border-color": "black",
            "border-size": "5",
            "title": {
                "text": "openSISE 점수표",
                "background-color": "none",
                "font-color": "000",
                "font-size": "22px"
            },
            "tooltip": {
                "text": "%v",
                "shadow": 0,
                "border-radius": 3
            },
            "scale-k": {
                "background-color": "none",
                "values": [
                  "평당가<br/>1점: 평당 30만원 ", "물가<br/>1점 : 100원", "인구수<br/>1점 : 5000명"
                ],
                "item": {
                    "font-size": "14px",
                    "padding-left": "30px",
                    "padding-bottom": "15px"
                },
                "guide": {
                    "line-color": "#818181",
                    "line-style": "solid",
                    "line-width": "2px",
                    "items": [
                        {
                            "background-color": "#fff"
                        }
                    ]
                },
                "tick": {
                    "visible": false
                }
            },
            "scale-v": {
                "values": [
                  -6,-5,-4,-3,-2,-1,0,1,2,3,4,5,
                ],
                "ref-line": {
                    "line-width": "1px",
                    "line-color": "#818181"
                },
                "guide": {
                    "line-width": "1px",
                    "line-style": "solid"
                },
                "tick": {
                    "size": 10,
                    "line-width": ".5px",
                    "line-length": 0.55,
                    "line-color": "#818181"
                },
                "item": {
                    "padding-left": "9.5px",
                    "font-size": "8px"
                }
            },
            "series": [
                {
                    "values": statArr,
                    "aspect": "line",
                    "text": "ER",
                    "line-color": "#fd7e14",
                    "background-color": "none",
                    "line-width": "4px",
                    "alpha": "0.35",
                    "marker": {
                        "background-color": "#999999",
                        "size": "4",
                        "border-color": "#999999",
                        "alpha": "0.55"
                    }
                  
                }
            ]
        };

zingchart.render({ 
	id : 'radarChart', 
	data : radarConfig, 
});
    
</script>