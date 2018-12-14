<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.admin-statis{
    width: 925px;
    height: 550px;
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
}
#selBox{
	width: 100px;
	border: none;
	background: #f4b344;
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
}

#intrstAllG, #intrstAgeG{
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
	var colorList = new Array();
	colorList.push("#f7cc06");
	colorList.push("#f38b72");
	colorList.push("#aad035");
	var i = 0;
	var certi = ["여성","남성","총"];
	// 관심사 수 최대치
	var allCnt = ${maxCnt} +1;
	
	// 관심사별 선택 그래프
	var intrstAllG = 
	{ "type": "bar",
	    "utc": true,
	    "plotarea": {"margin": "dynamic 45 60 dynamic" },
	    /* 가로축 */
	    "scale-x": {
	    	"values": [
            	<c:forEach items="${intrstAll }" var="intrstVo">
					"${intrstVo.intrst_nm}",
				</c:forEach>
			]	
	    },
	    /* 세로축 */
	    "scale-y": {
	        "values": "0:"+allCnt+":"+Math.ceil(allCnt/10), /* 시작 : 끝 : 단계 */
	        "line-color": "#f6f7f8",
	        "shadow": 0,
	        "guide": { "line-style": "dashed" },
	        "label": {
	            "text": "관심 가지는 수",
	            "font-family": "'Noto Sans KR', sans-serif",
	            "font-weight": "400",
	            "font-size": "15px",
	            "font-color": "#808080"},
	        "minor-ticks": 0,
	        "thousands-separator": "," },
	    "tooltip": {"visible": false},
	    "plot": {
	        "highlight":true,
	        "tooltip-text": "%t views: %v<br>%k",
	        "shadow": 0,
	        "line-width": "2px",
	        "marker": {
	            "type": "circle",
	            "size": 3},
	        "highlight-state": { "line-width":3},
	        "animation":{
	          "effect":1,
	          "sequence":2,
	          "speed":100 } },
	    "series": [
	        {// 관심사 counts
	            "values": [ 
			        <c:forEach items="${intrstAll }" var="intrstVo">
	            		${intrstVo.counts},
			        </c:forEach>
	            ],
	            "legend-marker": {"visible":false },
	            "background-color": "#aad035",
	        }
	    ]
	};
	zingchart.render({ 
		id : 'intrstAllG', 
		data : intrstAllG, 
		height: '100%', 
		width: '100%' 
	});
	
	// 연령 선택
	$("#selBox").on("change", function(){
		var mem_age = this.value;
		var ageData = {mem_age : mem_age};
		$.ajax({
			type : 'POST',
			url : '/statis/intrstAgeAjax',
			data : ageData,
			success : function(data){
				// 연령별 관심사 그래프
				$('#intrstAgeG').html(data);
			}
		});
	});
	
	
	
});
</script>
<form id="ageF" action="/statis/intrstAgeAjax" method="post">
	<input type="hidden" id="age"/>
</form>
    
<div class="admin-title">
	<h2>관심사통계</h2>
	<div class="hr2">
	</div>
	
	<div class="admin-statis">
		<div class="square yellow"></div><h5>관심사 그래프</h5>
		<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#intrstAll">전체-all</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#intrstAge">연령별-age</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#intrstGndr">성별-gender</a></li>
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show" id="intrstAll">
				<p>관심사 목록&nbsp: &nbsp
					<c:forEach items="${intrstAll }" var="intrstVo">
						${intrstVo.intrst_nm }&nbsp&nbsp
					</c:forEach>
				</p>
				<div id="intrstAllG"></div>
			</div>
			<div class="tab-pane fade show active" id="intrstAge">
				<p>연령&nbsp:&nbsp
					<select id="selBox" >
						<c:forEach items="${ageList }" var="age">
					  	<option value="${age }">${age }</option>
						</c:forEach>
					</select>
				</p>
				<div id="intrstAgeG"></div>
			</div>
			<div class="tab-pane fade show" id="intrstGndr">
				<p>성별</p>
			</div>
		</div>
	</div>	
	
</div>








