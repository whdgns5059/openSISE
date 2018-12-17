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
}
#favorTotalG, #favorDongG, #favorGuG{
	height:500px;
	width:800px;
	min-height:150px;
}
#favorTotalG{
	margin-left: 12px;
	border-top: 1px solid #f4b344;
	border-bottom: 1px solid #ccc;
	overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
}
::-webkit-scrollbar {
	width: 16px;
}
::-webkit-scrollbar-thumb {
	background-color: #e0e0e0;
	border-radius: 8px;
}
#favorDongG{
	margin-left: 12px;
}
.favorT{
	margin: 0 auto;
	width: 800px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	font-size: 12px;
}
.favorT tbody{

}
.favorT th{
	border: 1px solid white;
	font-weight: 500;
	text-align: center;
	background: #f4b344;
	color: white;
}
.favorT td{
	border: 1px solid #ccc;
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
	var i = 0;
	
	var favorGuG = {
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
	 	y:'55%',
	 	sticky:true,
	 	backgroundColor:'none',
	 	borderWidth:0,
	 	thousandsSeparator:',',
	 	text:'<span style="color:%color"> %t</span><br><span style="color:%color">찜 개수: %v</span>',
	    mediaRules:[
	        {
	           maxWidth:500,
	       	   y:'54%',
	        }
	    ]
	},
	plotarea: {
		backgroundColor: 'transparent',
	 	borderWidth: 0,
	 	borderRadius: "0 0 0 10",
	 	margin: "60 0 30 0"
	},
	// 작은 컨트롤러
	legend : {
	    toggleAction:'remove',
	    borderWidth:0,
	    adjustLayout:true,
	    align:'center',
	    verticalAlign:'top',
	    margin: '0 0 0 0',
	    marker: {
	        type:'circle',
	        cursor:'pointer',
	        borderWidth:0,
	        size:8
	    },
	    item: {
	        fontColor: "#777",
	        cursor:'pointer',
	        offsetX:-6,
	        fontSize:12
	    },
	    mediaRules:[
	        {
	            maxWidth:500,
	            visible:false
	        }
	    ]
	},
	scaleR:{
	  refAngle:270
	},
	series : [
		// 구별 데이터
		<c:forEach items="${favorGu}" var="gu">
			{
			 	text: '${gu.favor_gu}',
				values : [${gu.counts}],
				backgroundColor: colorList[i++], 
				lineWidth: 1,
				marker: {
				  backgroundColor: colorList[i]
				}
			},
		</c:forEach>
	]
	};
	zingchart.render({ 
		id : 'favorGuG', 
	 	data: {
	    graphset: [favorGuG]
	  },
		height: '499', 
		width: '99%' 
	});
});

</script>

<div class="admin-title">
	<h2>인기건물</h2>
	<div class="hr2"></div>
	
	<div class="admin-statis">
		<div class="square yellow"></div>
		<h5>찜 건물 순위</h5>
		<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#total">전체-all</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#dong">동별-Dong</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#gu">구별-Gu</a></li>
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show active" id="total">
				<p>가장 관심을 많이 갖는 건물 TOP 30</p>
				<div id='favorTotalG'>
					<table class="favorT">
						<thead>
							<tr>
								<th style="width: 30px;">순위</th>
								<th>구</th>
								<th>동</th>
								<th>번지</th>
								<th>도로명주소</th>
								<th>건물분류</th>
								<th>찜 받은 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${favorEach }" var="favorVo">
							<c:if test="${favorVo.rank le 30 }">
								<tr>
									<td>${favorVo.rank }</td>
									<td>${favorVo.favor_gu }</td>
									<td>${favorVo.favor_dong }</td>
									<td>${favorVo.favor_zip }</td>
									<td>${favorVo.favor_rd }</td>
									<td>${favorVo.bc_nm }</td>
									<td>${favorVo.counts }</td>
								</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade show" id="dong">
				<p>가장 인기 있는 동 TOP 20</p>
				<div id='favorDongG'>
					<table class="favorT">
						<thead>
							<tr>
								<th style="width: 30px;">순위</th>
								<th>구</th>
								<th>동</th>
								<th>찜 받은 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${favorDong }" var="favorVo">
							<c:if test="${favorVo.rank le 20 }">
								<tr>
									<td>${favorVo.rank }</td>
									<td>${favorVo.favor_gu }</td>
									<td>${favorVo.favor_dong }</td>
									<td>${favorVo.counts }</td>
								</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade show" id="gu">
				<p>구별 인기</p>
				<div id='favorGuG'></div>
			</div>
		</div>
	</div>
	<br/>
	


</div>    
