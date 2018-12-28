<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
#psDateG, #psPageG{
	height:450px;
	width:100%;
	min-height:150px;
}
#from, #to, #searchDate{
	width: 100px;
    height: 25px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	/* background: white; */
	font-family: 'Noto Sans KR', sans-serif;
}
#searchDate{
	width: 50px;
	cursor: pointer;
}
#modal {
    display: none;
    width: 400px;
    height: 250px;
    background-color: #FFFFFF;
    position: absolute;
    margin: 0 auto;
    top: 300px;
    left: 500px;
    z-Index: 11;
    border-radius: 25px;
}
.modalTop{
    width: 100%;
    height: 41px;
    background: #f1ebe0;
    border-top-left-radius: 25px;
    border-top-right-radius: 25px;
}
.modalCont{
    width: 100%;
    height: 200px;
    padding-top: 10px;
    color: black;
    text-align: center;
}
.modalCont h3{
	padding-top: 11px;
}
.modalCont p{
	padding-top: 31px;
}
#modalOk{
    width: 58px;
    height: 32px;
    margin-top: 11px;
    border: 1px solid #d8d8d8;
    background: #f5f3f0;
    border-radius: 4px;
    font-size: 13px;
    cursor: pointer;
}

</style> 
<script>
/* 알림창 */
function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
	
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
	 
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeTo("fast", 0.6);    
	 
    //모달창을 띄운다.
    $("#modal").show();
};

$(document).ready(function(){
	
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
	
	/* 달력 */
    $( "#from" ).datepicker({
	    dateFormat: "yy-mm-dd",
	    changeMonth: true,
	    changeYear: true
    });
    $( "#to" ).datepicker({
	    dateFormat: "yy-mm-dd",
	    changeMonth: true,
	    changeYear: true
    });
    
    /* 일별 페이지 열람 수 AJAX */
    // 기본 첫 그래프
    var from = new Date('2018/12/20');
	var to = new Date();
    var dateData = {from : from, to : to};
    $.ajax({
		type : 'POST',
		url : '/statis/pageCountAjax',
		data : dateData,
		success : function(data){
			// 일별 페이지 통계 그래프
			$('#psDateG').html(data);
		}
	});
    
    // 날짜를 지정했을 시
    $("#searchDate").on("click", function(){
	    from = $( "#from" ).datepicker( "getDate" );
	    to = $( "#to" ).datepicker( "getDate" );
	    if(from > to){
	    	//검은 막 띄우기
			wrapWindowByMask();
			//닫기 버튼을 눌렀을 때
	    	$("#modalOk").on("click", function(){
				$("#mask, #modal").hide();
	    	})
	    }else{
	    	
		   	dateData = {from : from, to : to};
		    
			$.ajax({
				type : 'POST',
				url : '/statis/pageCountAjax',
				data : dateData,
				success : function(data){
					// 일별 페이지 통계 그래프
					$('#psDateG').html(data);
				}
			});
	    }
	});
    	
	/* 페이지별 방문 수 그래프 */
	var psPageG = {
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
	 	text:'<span style="color:%color"> %t</span><br><span style="color:%color">횟수: %v</span>',
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
		layout: 'float',
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
	        size:7
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
		// 페이지별 데이터
		 <c:forEach items="${psPage }" var="psVo">
			{
			 	text: '${psVo.ps_pg}',
				values : [${psVo.ps_vstr}],
				backgroundColor: colorList[i++], 
				lineWidth: 1,
				marker: {
				  backgroundColor: colorList[i]
				}
			},
		</c:forEach>
	]};
	zingchart.render({ 
		id : 'psPageG', 
	 	data: {
	    graphset: [psPageG]
	  },
		height: '100%', 
		width: '99%' 
	});
	
});
</script>

<div class="admin-title">
	<h2>페이지사용량</h2>
	<div class="hr2">
	</div>
	
	<div class="admin-statis">
		<div class="square yellow"></div><h5>페이지 조회 통계 그래프</h5>
		<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#psDate">날짜별-date</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#psPage">페이지별-page</a></li>
		</ul>
		<div id="myTabContent" class="tab-content tab-content-size">
			<div class="tab-pane fade show active" id="psDate">
				<p>
					날짜&nbsp:&nbsp 
					<input type="text" id="from"/>&nbsp ~ &nbsp<input type="text" id="to"/>&nbsp&nbsp
					<button id="searchDate" >찾기</button>
				</p>
				<div id="psDateG"></div>
			</div>
			<div class="tab-pane fade show" id="psPage">
				<p>
					사용량이 가장 많은 페이지&nbsp:&nbsp<c:out value="${pageMax.ps_pg}"/>&nbsp&nbsp<c:out value="${pageMax.ps_vstr}"/>번
				</p>
				<div id="psPageG"></div>
			</div>
		</div>
	</div>
	
	<!-- 알림창 모달창  --> 
	<div id="mask"></div>	
	<div id="modal">
		<div class="modalTop"></div>
		<div class="modalCont">
			<h3>날짜 오류</h3>
			<p>날짜를 다시 설정해 주세요.</p>
			<button id="modalOk">확인</button>
		</div>
	</div>
	
</div>   
    
