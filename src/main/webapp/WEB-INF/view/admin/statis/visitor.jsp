<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.admin-statis{
    width: 925px;
}
.tab-yellow .nav-link, .tab-yellow .nav-link.disabled, .tab-yellow .nav-link.disabled:hover, 
.tab-yellow .nav-link.disabled:focus{
	border-color: #f4b344;
}
.tab-yellow {
	border-color: #f4b344;
}
.tab-yellow .nav-link:hover, .tab-yellow .nav-link:focus {
	background: #f4b344;
}
.tab-green .nav-link, .tab-green .nav-link.disabled, .tab-green .nav-link.disabled:hover, 
.tab-green .nav-link.disabled:focus{
	border-color: #aad035;
}
.tab-green {
	border-color: #aad035;
}
.tab-green .nav-link:hover, .tab-green .nav-link:focus {
	background: #aad035;
}
.tab-content-size{
    height: 370px;
}
.tab-pane p{
	font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    font-style: italic;
    font-size: 13px;
    color: #9a9a9a;
    margin-top: 12px;
    margin-left: 12px;
    margin-bottom: 0;
}
#visitDateG{
	height:450px;
	width:100%;
	min-height:150px;
}
#visitDayG {
	height:400px;
	width:100%;
	min-height:150px;
}
.zc-ref {
  display: none;
}

</style> 
<script>
$(document).ready(function(){
	// 방문 수 최대치 : 그래프 range설정을 위함
	var allCnt = <c:out value="${maxCnt}"/>;
	
	var visitDateG = {
	"graphset":[
		{
		"type":"line",
	    "globals":{
	        "fontColor": "#808080"
	    },
	    "plot": {
	    	"background-color":"#f7cc06",
            "highlight":true,
            "tooltip-text": "%t views: %v<br>%k",
            "shadow": 0,
            "line-width": "2px",
            "marker": {
                "type": "circle",
                "size": 3},
            "highlight-state": { "line-width":3},
	    },
	    "tooltip": {"visible":false},
	    "type":"area",
	    "backgroudColor": "#f7cc06",
	    "plotarea" : {
	        "margin":"50 40 40 80"
	    },
	    "shapes":[{
              "type":"rectangle",
              "id":"view_all",
              "height":"20px",
              "width":"75px",
              "border-color":"#f29c3e",
              "border-width":"1px",
              "x":"86%",
              "y":"7%",
              "background-color":"white",
              "alpha":0.6,
              "cursor":"hand",
              "label":{
                "text":"View All",
                "font-size":12,
                "font-color":"#f29c3e",
                "bold":true 
              }
        }],
	  // 커서를 올렸을 때 나타나는 정보
	  "crosshairX":{
	    "shared": true,
	    "line-color": "#efefef",
	    "plotLabel":{
	    	"border-radius": "5px",
            "border-width": "1px",
            "border-color": "#f6f7f8",
            "padding": "10px",
            "font-weight": "bold",
	      	"text": "%v명",
	      	"y":0,
	    },
	    "scaleLabel":{
	    	"font-color": "#000",
            "background-color": "#f6f7f8",
            "border-radius": "5px"
	    }
	  },
	  // 하위 전체 표
	    "preview":{
	        "border-width":1,
	        "handle":{
	            "line-width":0,
	            "height":20
	        },
	        "adjust-layout":true
	    },
	    // zoom 했을 때 스크롤바
	    "scroll-x":{ 
	      "handle":{
	      "background-color":"#f29c3e"}
	    },
	    "scale-x" : {
	    	/* "min-value": ${visitDate[0].ymd }, */
            "shadow": 0,
	      	"step": "day",
	      	"transform": {
	            "type": "date",
	            "all": "%Y<br/>%M %d. %D",
	            "guide": {"visible": false},
	            "item": {"visible": false} },
	        "label": { "visible": false},
	        "minor-ticks": 0 ,
	        "zooming" : true
	    },
	    /* 세로축 */
	    "scale-y":{
	    	"autoFit":true,
	        "min-value":"auto",
        	"max-value": allCnt+10,
        	"short":true,
	      	"line-color": "#f6f7f8",
	      	"shadow": 0,
	      	"guide": { "line-style": "dashed" },
	      	"label": {
		        "text": "방문 수",
	            "font-size": "15px",
	            "font-family":"'Noto Sans KR', sans-serif",
                "font-weight": "400",
	            "font-color": "#808080"},
		      	"minor-ticks": 0,
	      	"thousands-separator": ","
	    },
		"series":[
			{
				/* "marker": {"border-color": "none", "size":1 }, */
				"text": "가입 회원",
                "line-color": "#f7cc06",
                "legend-item":{
                  "background-color": "#f7cc06",
                  "borderRadius":5,
                  "font-color":"white"},
                "legend-marker": {"visible":false },
                "marker": {
                    "background-color": "#f7cc06",
                    "border-width": 1,
                    "shadow": 0,
                    "border-color": "#f7cc06" },
				"values":[
					<c:forEach items="${visitDate }" var="visitVo">
	        			[${visitVo.ymd} , ${visitVo.counts} ],
	        		</c:forEach>
	            ]
			}
		]
	}]
	};

	zingchart.render({ 
		id: 'visitDateG', 
		data: visitDateG, 
		height: "100%", 
		width: '100%',
		modules : 'zoom-buttons'
	});
	
	zingchart.shape_click = function(p){
		if(p.shapeid == "view_all"){
		    zingchart.exec(p.id,'viewall');
		}
	};
	
	var visitDayG = {
	"graphset":[
		{
		"type":"line",
	    "globals":{
	        "fontColor": "#808080"
	    },
	    "plot": {
	    	"background-color":"#f7cc06",
            "highlight":true,
            "tooltip-text": "%t views: %v<br>%k",
            "shadow": 0,
            "line-width": "2px",
            "marker": {
                "type": "circle",
                "size": 3},
            "highlight-state": { "line-width":3},
	    },
	    "tooltip": {"visible":false},
	    "type":"area",
	    "backgroudColor": "#f7cc06",
	    "plotarea" : {
	        "margin":"50 40 40 80"
	    },
	  // 커서를 올렸을 때 나타나는 정보
	  "crosshairX":{
	    "shared": true,
	    "line-color": "#efefef",
	    "plotLabel":{
	    	"border-radius": "5px",
            "border-width": "1px",
            "border-color": "#f6f7f8",
            "padding": "10px",
            "font-weight": "bold",
	      	"text": "%v명",
	      	"y":0,
	    },
	    "scaleLabel":{
	    	"font-color": "#000",
            "background-color": "#f6f7f8",
            "border-radius": "5px"
	    }
	  },
	    "scale-x" : {
	    	/* "min-value": ${visitDate[0].ymd }, */
            "shadow": 0,
	      	"step": "day",
	      	"transform": {
	            "type": "date",
	            "all": "%Y<br/>%M %d. %D",
	            "guide": {"visible": false},
	            "item": {"visible": false} },
	        "label": { "visible": false},
	        "minor-ticks": 0 ,
	    },
	    /* 세로축 */
	    "scale-y":{
	    	"autoFit":true,
	        "min-value":"auto",
        	"max-value": allCnt+10,
        	"short":true,
	      	"line-color": "#f6f7f8",
	      	"shadow": 0,
	      	"guide": { "line-style": "dashed" },
	      	"label": {
		        "text": "방문 수",
	            "font-size": "15px",
	            "font-family":"'Noto Sans KR', sans-serif",
                "font-weight": "400",
	            "font-color": "#808080"},
		      	"minor-ticks": 0,
	      	"thousands-separator": ","
	    },
		"series":[
			{
				/* "marker": {"border-color": "none", "size":1 }, */
				"text": "가입 회원",
                "line-color": "#f7cc06",
                "legend-item":{
                  "background-color": "#f7cc06",
                  "borderRadius":5,
                  "font-color":"white"},
                "legend-marker": {"visible":false },
                "marker": {
                    "background-color": "#f7cc06",
                    "border-width": 1,
                    "shadow": 0,
                    "border-color": "#f7cc06" },
				"values":[
					<c:forEach items="${visitDate }" var="visitVo">
	        			[${visitVo.ymd} , ${visitVo.counts} ],
	        		</c:forEach>
	            ]
			}
		]
	}]
	};

	zingchart.render({ 
		id: 'visitDayG', 
		data: visitDayG, 
		height: "100%", 
		width: '100%',
	});
	
});
</script>

<div class="admin-title">
	<h2>방문자 수</h2>
	<div class="hr2">
	</div>
	
	<div class="admin-statis">
		<div class="square yellow"></div><h5>방문자 수 통계 그래프</h5>
		<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#visitDate">날짜별-date</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#visitDay">요일별-day</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#visitHour">시간대별-hour</a></li>
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show active" id="visitDate">
				<p>
					가장 방문자가 많았던 날&nbsp:&nbsp <br/>
					방문자 수&nbsp:&nbsp${maxCnt}
				</p>
				<div id="visitDateG"></div>
			</div>
			<div class="tab-pane fade show" id="visitDay">
				<p>요일별</p>
				<div id="visitDayG"></div>
			</div>
			<div class="tab-pane fade show" id="visitHour">
				<p>시간대별</p>
				<div id="visitHourG"></div>
			</div>
		</div>
	</div>	
	
</div>

























