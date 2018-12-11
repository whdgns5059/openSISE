<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.sign-mem{
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

#signDaily, #signMonthly {
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
	var signDaily = 
    { "type": "line",
        "utc": true,
        "plotarea": {"margin": "dynamic 45 60 dynamic" },
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
              "cursor":"hand"
            }},
        /* 가로축 */
        "scale-x": {
        	"min-value": 1543968000000,
            "shadow": 0,
            "step": "day",
            "transform": {
                "type": "date",
                "all": "%Y<br/>%M %d. %D",
                "guide": {"visible": false},
                "item": {"visible": false}},
            "label": { "visible": false},
            "minor-ticks": 0 },
        /* 세로축 */
        "scale-y": {
            "values": "0:1000:100", /* 시작 : 끝 : 단계 */
            "line-color": "#f6f7f8",
            "shadow": 0,
            "guide": { "line-style": "dashed" },
            "label": {
                "text": "회원 수",
                "font-family": "'Noto Sans KR', sans-serif",
                "font-weight": "400",
                "font-size": "15px",
                "font-color": "#808080"},
            "minor-ticks": 0,
            "thousands-separator": ","},
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
                "border-radius": "5px"}},
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
              "speed":100, }},
        "series": [
            {// 가입 회원
                "values": [
                	0
                	<c:forEach items="${memVoInList }" var="memVo">
            			,${memVo.counts}
            		</c:forEach>
                ],
                "text": "가입 회원",
                "line-color": "#da534d",
                "legend-item":{
                  "background-color": "#da534d",
                  "borderRadius":5,
                   "font-color":"white"},
                "legend-marker": {"visible":false },
                "marker": {
                    "background-color": "#da534d",
                    "border-width": 1,
                    "shadow": 0,
                    "border-color": "#da534d" }},
            {// 탈퇴 회원
                "values": [
                	0
                	<c:forEach items="${memVoOutList }" var="memVo">
            			,${memVo.counts}
            		</c:forEach>
                ],
                "text": "탈퇴한 회원",
                "line-color": "#f7cc06",
                "legend-item":{
                  "background-color": "#f7cc06",
                  "borderRadius":5,
                   "font-color":"white" },
                "legend-marker": {"visible":false},
                "marker": {
                    "background-color": "#f7cc06",
                    "border-width": 1,
                    "shadow": 0,
                    "border-color": "#f7cc06"} }
        ]
    };

	zingchart.render({ 
		id : 'signDaily', 
		data : signDaily, 
		height: '100%', 
		width: '100%' 
	});
	
	var signMonthly = 
    { "type": "line",
        "utc": true,
        "plotarea": {"margin": "dynamic 45 60 dynamic" },
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
              "cursor":"hand"
            }},
        /* 가로축 */
        "scale-x": {
        	"labels":[ 
        		"2018/10"
        		<c:forEach items="${memVoInMonthly }" var="memVo">
    				,"${memVo.ymd}"
    			</c:forEach>
             ]
          },
        /* 세로축 */
        "scale-y": {
            "values": "0:1000:100", /* 시작 : 끝 : 단계 */
            "line-color": "#f6f7f8",
            "shadow": 0,
            "guide": { "line-style": "dashed" },
            "label": {
                "text": "회원 수",
                "font-family": "'Noto Sans KR', sans-serif",
                "font-weight": "400",
                "font-size": "15px",
                "font-color": "#808080"},
            "minor-ticks": 0,
            "thousands-separator": ","},
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
                "border-radius": "5px"}},
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
              "speed":100, }},
        "series": [
            {// 가입 회원
                "values": [
                	0
                	<c:forEach items="${memVoInMonthly }" var="memVo">
            			,${memVo.counts}
            		</c:forEach>
                ],
                "text": "가입 회원",
                "line-color": "#da534d",
                "legend-item":{
                  "background-color": "#da534d",
                  "borderRadius":5,
                   "font-color":"white"},
                "legend-marker": {"visible":false },
                "marker": {
                    "background-color": "#da534d",
                    "border-width": 1,
                    "shadow": 0,
                    "border-color": "#da534d" }},
            {// 탈퇴 회원
                "values": [
                	0
                	<c:forEach items="${memVoOutMonthly }" var="memVo">
            			,${memVo.counts}
            		</c:forEach>
                ],
                "text": "탈퇴한 회원",
                "line-color": "#f7cc06",
                "legend-item":{
                  "background-color": "#f7cc06",
                  "borderRadius":5,
                   "font-color":"white" },
                "legend-marker": {"visible":false},
                "marker": {
                    "background-color": "#f7cc06",
                    "border-width": 1,
                    "shadow": 0,
                    "border-color": "#f7cc06"} }
        ]
    };

	zingchart.render({ 
		id : 'signMonthly', 
		data : signMonthly, 
		height: '100%', 
		width: '100%' 
	});
		
	
});	

</script>

<div class="admin-title">
	<h2>회원통계</h2>
	<div class="hr2"></div>
	
	<div class="sign-mem">
		<div class="square yellow"></div><h5>가입한 회원 수 그래프</h5>
		<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#daily-in">일별-daily</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#monthly-in">월별-monthly</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#age-in">연령별-age</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#gender-in">성별-gender</a></li>
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show" id="daily-in">
				<p>일별 회원 가입 통계 그래프 입니다.</p>
				<div id='signDaily'></div>
			</div>
			<div class="tab-pane fade show active" id="monthly-in">
				<p>월별 회원 가입 통계 그래프 입니다.</p>
				<div id='signMonthly'></div>
			</div>
			<div class="tab-pane fade show" id="age-in">
				<p>연령별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="gender-in">
				<p>성별 회원 가입 통계 그래프 입니다.</p>
			</div>
		</div>
	</div>
	<br/>
	<div class="sign-mem">
		<div class="square green"></div><h5>탈퇴한 회원 수 그래프</h5>
		<ul class="nav nav-tabs tab-green">
			<li class="nav-item"><a class="nav-link show" data-toggle="tab" href="#daily-out">일별-daily</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#monthly-out">월별-monthly</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#age-out">연령별-age</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#gender-out">성별-gender</a></li>
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show active" id="daily-out">
				<p>일별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="monthly-out">
				<p>월별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="age-out">
				<p>연령별 회원 가입 통계 그래프 입니다.</p>
			</div>
			<div class="tab-pane fade show" id="gender-out">
				<p>성별 회원 가입 통계 그래프 입니다.</p>
			</div>
		</div>
	</div>


</div>