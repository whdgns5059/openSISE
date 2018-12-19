var dl_priceArr = document.getElementsByClassName('avg_dl_price');
var dl_cont_ymArr = document.getElementsByClassName('avg_dl_cont_ym');

var priceVal = new Array();
var contYmVal = new Array();

for(var valIndex = 0 ; valIndex < dl_priceArr.length; valIndex++){
	
	if(dl_priceArr[valIndex].value == 0){
		
		if(valIndex == 0){ continue; }
		
		dl_priceArr[valIndex].value = dl_priceArr[valIndex - 1].value;
	}
	
	priceVal[valIndex] = parseInt(dl_priceArr[valIndex].value);
	contYmVal[valIndex] = dl_cont_ymArr[valIndex].value;
}


var myConfig = {
		"graphset":[
		    {
		        "type":"line",
		        "background-color":"#ECEFF1",
		        "globals":{
		          "fontColor":"#212121"
		        },
		        "title":{
		            "text":"실거래 차트",
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
		            "min-value":1273266300000,
		            "step":"minute",
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
		            "progression":"demical",
		            "min-value" : 4000,
		            "decimals":0,
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
		            "decimals":0,
		            "line-width":2,
		            "max-nodes":500,
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
		                "values": priceVal
		            }
		        ]
		    }
		]
		};
		 
		zingchart.render({ 
			id : 'monthlyAvg', 
			data : myConfig, 
		});
		 
		zingchart.shape_click = function(p){
		  if(p.shapeid == "view_all"){
		    zingchart.exec(p.id,'viewall');
		  }
		}
	 