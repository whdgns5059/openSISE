

$('#totalDeal').on('click',function(){
	
	console.log('확인');
	
	var dl_excv_area = document.getElementById('excv_area').value;
	var artcl_gu = document.getElementById('artcl_gu').value;
	var artcl_dong = document.getElementById('artcl_dong').value;
	var artcl_zip = document.getElementById('artcl_zip').value;
	var artcl_rd = document.getElementById('artcl_rd').value;
	var dl_ty = document.getElementById('dl_ty').value;
	
	var data = {
		dl_gu : artcl_gu,
		dl_dong : artcl_dong,
		dl_zip : artcl_zip,
		dl_rd : artcl_rd,
		dl_excv_area : dl_excv_area,
		dl_ty : dl_ty
	}
	
	$.ajax({
		
		type:'POST',
		url : '/detail/totalDeal',
		data : data,
		success : function(data){
			 var newWindow = window.open("", "new window", "width=800, height=800");
			 newWindow.document.write(data);
		}
		
	});

	
	
	
})

$('#calcul').on('change', function(){

	var calval = $('#calcul').val();
	
	console.log("here");
	
	var calDefault = parseInt(document.getElementById('calDefault').innerHTML);
	
	if(!(isNaN(calDefault) || calDefault == 1)){
		if(calval >= 20){
			var calResult = Math.round(calDefault / 100 * calval);
			var ori = calDefault - calResult;
			var inter = Math.round(ori * 0.025 / 12 * Math.pow((1 + 0.025 / 12), 36) / Math.pow((1+0.025 / 12), 36) - 1)
			$('#clacResult').html(calResult +'만원');
			$('#inter').html('월' + inter + '만원');
		}else{
			$('#clacResult').html('최소 20%의 보유금이 필요합니다');
		}
	}else {
		
		$('#clacResult').html('1년 평균거래가 없습니다.');
		$('#inter').html('1년 평균거래가 없습니다.');
		$('#calDefault').html('1년 평균거래가 없습니다.')
	}
	
	
	
});




var dl_priceArr = document.getElementsByClassName('avg_dl_price');
var dl_deposArr = document.getElementsByClassName('avg_dl_depos');
var dl_rntArr = document.getElementsByClassName('avg_dl_rnt');
var dl_ty = document.getElementById('dl_ty').value;

var priceVal = new Array();
var deposVal = new Array();
var rntVal = new Array();
console.log("charthere!");

var maxVal = 0;
var minVal = 10000000;

if(dl_ty == '매매'){

	for(var i= 0 ; i< dl_priceArr.length; i++){
		
		if(dl_priceArr[i].value == 0){
			
			if(i== 0){ continue; }
			
			dl_priceArr[i].value = dl_priceArr[i- 1].value;
		}
		priceVal[i] = parseInt(dl_priceArr[i].value);
		maxVal = maxVal < priceVal[i] ? priceVal[i] : maxVal;
		minVal = minVal > priceVal[i] ? priceVal[i] : minVal;
	}

}else if(dl_ty == '전세'){

	for(var i= 0 ; i< dl_deposArr.length; i++){
		
		if(dl_deposArr[i].value == 0){
			
			if(i== 0){ continue; }
			
			dl_deposArr[i].value = dl_deposArr[i- 1].value;
		}
		deposVal[i] = parseInt(dl_deposArr[i].value);
		maxVal = maxVal < deposVal[i] ? deposVal[i] : maxVal;
		minVal = minVal > deposVal[i] ? deposVal[i] : minVal;
	}
	
}else if(dl_ty == '월세'){

	for(var i= 0 ; i< dl_rntArr.length; i++){
		
		if(dl_rntArr[i].value == 0){
			
			if(i== 0){ continue; }
			
			dl_rntArr[i].value = dl_rntArr[i- 1].value;
		}
		rntVal[i] = parseInt(dl_rntArr[i].value);
		maxVal = maxVal < rntVal[i] ? rntVal[i] : maxVal;
		minVal = minVal > rntVal[i] ? rntVal[i] : minVal;
	}
	
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
		            "min-value" : minVal,
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
		                "text":"매매가",
		                "values": priceVal
		            },
		            {
		                "text":"전세가",
		                "values": deposVal
		            },
		            {
		                "text":"월세가",
		                "values": rntVal
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

	
	 