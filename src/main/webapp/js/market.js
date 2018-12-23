
var myConfig = {
		"graphset":[
		    {
		        "type":"line",
		        "background-color":"#ECEFF1",
		        "globals":{
		          "fontColor":"#212121"
		        },
		        "title":{
		            "text":"월별 평균 물가 정보",
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
		            "min-value":1199145600000,
		            "step":"month",
		            "itemsOverlap": true,
		            "tick":{
		 
		            },
		            "minor-tick":{
		 
		            },
		            "transform":{
		                "type":"date",
		                "all":"%Y<br/>%M"
		            },
		            "zooming":true
		        },
		        "tooltip":{
		            "visible":false
		        },
		        "scale-y":{
		            "progression":"demical",
		            "min-value" : 0,
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
		                "text":"평균가",
		                "values": [8000, 9000] 
		            }
		        ]
		    }
		]
		};
		 
		zingchart.render({ 
			id : 'marketChart', 
			data : myConfig, 
		});
		 
		zingchart.shape_click = function(p){
		  if(p.shapeid == "view_all"){
		    zingchart.exec(p.id,'viewall');
		  }
		}

	
	 