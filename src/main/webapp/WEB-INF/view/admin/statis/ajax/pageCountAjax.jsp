<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
	
	console.log("아작스");
	var pageMax = <c:out value="${pageMax.ps_vstr}"/>;
	
	var colorList = new Array();
	colorList.push("#f7cc06");
	colorList.push("#f38b72");
	colorList.push("#aad035");
	colorList.push("#71afdd");
	colorList.push("#bc80d2");
	colorList.push("#3ea6c8");
	colorList.push("#f29c3e");
	colorList.push("#4385cd");
	var i = 0;
	
	/* 일별 페이지 열람 수 */
	var psDateG = {
	"graphset":[
		{
			"type":"line",
		    "globals":{
		        "fontColor": "#808080"
		    },
		    "plot": {
	            "highlight":true,
	            "shadow": 0,
	            "line-width": "2px",
	            "marker": {
	                "type": "circle",
	                "size": 3},
	            "highlight-state": { "line-width":3},
		    },
		    "tooltip": {"visible":false},
		    "plotarea" : {
		        "margin":"50 40 40 80"
		    },
		 	// 작은 컨트롤러
            "legend": {
	            "layout": "float",
	            "background-color": "none",
	            "border-width": 0,
	            "shadow": 0,
	            "align":"center",
	            "adjust-layout":true,
	            "item":{
	              "padding": 7,
	              "marginRight": 17,
	              "cursor":"hand" },
	            "marker": {
	               "type": "square",
	               "border-radius": "5",
	               "border-color": "none",
	               "size": "10px",
	               "cursor": "pointer"
	            },
	        },
		// 커서를 올렸을 때 나타나는 정보
		"crosshair-x": {
            "line-color": "#efefef",
            "plot-label": {
                "border-radius": "5px",
                "border-width": "1px",
                "border-color": "#f6f7f8",
                "padding": "10px",
                "font-weight": "bold"},
            "scale-label": {
                "font-color": "#000",
                "background-color": "#f6f7f8",
                "border-radius": "5px"} 
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
	    // 날짜
	    "scale-x" : {
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
	        "min-value":0,
        	"max-value":pageMax,
        	"short":true,
	      	"line-color": "#f6f7f8",
	      	"shadow": 0,
	      	"guide": { "line-style": "dashed" },
	      	"label": {
		        "text": "방문 수(명)",
	            "font-size": "15px",
	            "font-family":"'Noto Sans KR', sans-serif",
                "font-weight": "400",
	            "font-color": "#808080"},
		      	"minor-ticks": 0,
	      	"thousands-separator": ","
	    },
		"series":[
				<c:forEach items="${pageCount}" var="item">
				{
					"text": "${item}",
	                "line-color": colorList[++i],
	                "legend-item":{ "cursor": "pointer"},
	                "legend-marker": {"visible":true },
	                "marker": {
	                    "background-color":  colorList[i],
	                    "border-width": 1,
	                    "shadow": 0,
	                    "border-color":  colorList[i] },
					"values":[
							<c:forEach items="${psDate }" var="psVo">
								<c:if test="${psVo.ps_pg eq item}">
									[${psVo.ps_dateStr}, ${psVo.ps_vstr}],
								</c:if>
			        		</c:forEach>
		        ]},
		        </c:forEach>
		]
	}]
	};
	
	zingchart.render({ 
		id: 'psDateG', 
		data: psDateG, 
		height: "100%", 
		width: '100%',
		modules : 'zoom-buttons'
	});
	
	
});
				
</script>







