var dl_priceArr = document.getElementsByClassName('avg_dl_price');
var dl_cont_ymArr = document.getElementsByClassName('avg_dl_cont_ym');

var priceVal = new Array();
var contYmVal = new Array();

for(var valIndex = 0 ; valIndex < 30; valIndex++){
	priceVal[valIndex] = dl_priceArr[valIndex].value;
	contYmVal[valIndex] = dl_cont_ymArr[valIndex].value;
}

console.log(priceVal[0]);
console.log(contYmVal);


var myConfig = {
	 	type: 'line',
	 	backgroundColor:'#2C2C39',
	 	title:{
	 	  text:'Time Series Data with null values',
	 	  adjustLayout: true,
	 	  fontColor:"#E3E3E5",
	 	  marginTop: 7
	 	},
	 	legend:{
	 	  align: 'center',
	 	  verticalAlign: 'top',
	 	  backgroundColor:'none',
	 	  borderWidth: 0,
	 	  item:{
	 	    fontColor:'#E3E3E5',
	 	    cursor: 'hand'
	 	  },
	 	  marker:{
	 	    type:'circle',
	 	    borderWidth: 0,
	 	    cursor: 'hand'
	 	  }
	 	},
	 	plotarea:{
	 	  margin:'dynamic 70'
	 	},
	 	plot:{
	 	  aspect: 'spline',
	 	  lineWidth: 2,
	 	  marker:{
	 	    borderWidth: 0,
	 	    size: 5
	 	  }
	 	},
	 	scaleX:{
	 	  lineColor: '#E3E3E5',
	 	  zooming: true,
	 	  zoomTo:[0,15],
	 	  minValue: 1459468800000,
	 	  step: 'day',
	 	  item:{
	 	    fontColor:'#E3E3E5'
	 	  },
	 	  transform:{
	 	    type: 'date',
	 	    all: '%D %M %d<br>%h:%i:%s'
	 	  }
	 	},
	 	scaleY:{
	 	  minorTicks: 1,
	 	  lineColor: '#E3E3E5',
	 	  tick:{
	 	    lineColor: '#E3E3E5'
	 	  },
	 	  minorTick:{
	 	    lineColor: '#E3E3E5'
	 	  },
	 	  minorGuide:{
	 	    visible: true,
	 	    lineWidth: 1,
	 	    lineColor: '#E3E3E5',
	 	    alpha: 0.7,
	 	    lineStyle: 'dashed'
	 	  },
	 	  guide:{
	 	    lineStyle: 'dashed'
	 	  },
	 	  item:{
	 	    fontColor:'#E3E3E5'
	 	  }
	 	},
	 	tooltip:{
	 	  borderWidth: 0,
	 	  borderRadius: 3
	 	},
	 	preview:{
	 	  adjustLayout: true,
	 	  borderColor:'#E3E3E5',
	 	  mask:{
	 	    backgroundColor:'#E3E3E5'
	 	  }
	 	},
	 	crosshairX:{
	 	  plotLabel:{
	 	    multiple: true,
	 	    borderRadius: 3
	 	  },
	 	  scaleLabel:{
	 	    backgroundColor:'#53535e',
	 	    borderRadius: 3
	 	  },
	 	  marker:{
	 	    size: 7,
	 	    alpha: 0.5
	 	  }
	 	},
	 	crosshairY:{
	 	  lineColor:'#E3E3E5',
	 	  type:'multiple',
	 	  scaleLabel:{
	 	    decimals: 2,
	 	    borderRadius: 3,
	 	    offsetX: -5,
	 	    fontColor:"#2C2C39",
	 	    bold: true
	 	  }
	 	},
	 	shapes:[
	              {
	                type:'rectangle',
	                id:'view_all',
	                height:'20px',
	                width:'75px',
	                borderColor:'#E3E3E5',
	                borderWidth:1,
	                borderRadius: 3,
	                x:'85%',
	                y:'11%',
	                backgroundColor:'#53535e',
	                cursor:'hand',
	                label:{
	                  text:'View All',
	                  fontColor:'#E3E3E5',
	                  fontSize:12,
	                  bold:true
	                }
	              }
	            ],
		series: [
			{
				values: priceVal,
				lineColor:'#E34247',
				marker:{
				  backgroundColor:'#E34247'
				}
			}
		]
	};
	 
	zingchart.bind('monthlyAvg', 'shape_click', function(p){
	  if(p.shapeid == "view_all"){
	    zingchart.exec(p.id,'viewall');
	  }
	})
	 
	zingchart.render({ 
		id: 'monthlyAvg', 
		data: myConfig, 
	});
	 