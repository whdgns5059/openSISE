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
    height: 25px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
}

#intrstAllG, #intrstAgeG{
	height:500px;
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
	var allCnt = ${maxCnt} +1;
	
	/* 관심사별 선택 그래프 */
	var intrstAllG = {
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
	 	text:'<span style="color:%color"> %t</span><br><span style="color:%color">관심 수: %v</span>',
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
		 <c:forEach items="${intrstAll }" var="intrstVo">
			{
			 	text: '${intrstVo.intrst_nm}',
				values : [${intrstVo.counts}],
				backgroundColor: colorList[i++], 
				lineWidth: 1,
				marker: {
				  backgroundColor: colorList[i]
				}
			},
		</c:forEach>
	]};
	zingchart.render({ 
		id : 'intrstAllG', 
	 	data: {
	    graphset: [intrstAllG]
	  },
		height: '499', 
		width: '99%' 
	});
	
	/* 연령 초기 값 */
	var ageData = {mem_age : "allAge"};
	$.ajax({
		type : 'POST',
		url : '/statis/intrstAgeAjax',
		data : ageData,
		success : function(data){
			// 연령별 관심사 그래프
			$('#intrstAgeG').html(data);
		}
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
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show active" id="intrstAll">
				<div id="intrstAllG"></div>
			</div>
			<div class="tab-pane fade show" id="intrstAge">
				<p>연령&nbsp:&nbsp
					<select id="selBox" >
					  	<option value="allAge" selected>전연령</option>
						<c:forEach items="${ageList }" var="age">
					  		<option value="${age }">${age }</option>
						</c:forEach>
					</select>
				</p>
				<div id="intrstAgeG"></div>
			</div>
		</div>
	</div>	
	
</div>








