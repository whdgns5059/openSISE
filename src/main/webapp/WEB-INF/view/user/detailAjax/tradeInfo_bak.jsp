<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>


</style>

<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
<script type="text/javascript">





//<![CDATA[
function wrapWindowByMask(){
	
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  

    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    

    //윈도우(팝업창) 띄운다.
    $("#siseWindow").show();

}


// 공지사항 window 내용 fade 효과
function noticeFade(id){
	var the = "#" + id;
	$(the).fadeToggle("fast");
}


$(document).ready(function(){
	
	$("#searchName").val("");
	
	//검은 막 띄우기
	$(".openMask").click(function(e) {
		e.preventDefault();
		var buttonId = this.id;
		if(buttonId == 'reviewMask'){
			wrapWindowByMaskReview();		
		}else {
			wrapWindowByMask();
		}
	});

	//닫기 버튼을 눌렀을 때
	$(".window .close").click(function(e) {
		//링크 기본동작은 작동하지 않도록 한다.
		e.preventDefault();
		$("#mask, .window").hide();
	});

	//검은 막을 눌렀을 때
	$("#mask").click(function() {
		$(this).hide();
		$(".window").hide();

	});

});

//]]>
</script>


</script>
<div id="threeMonthInfoDiv">
	<div class="subThreeMonth">
		<span class="subTitle">1년 평균 ${dl_ty }가</span><br/>
		<span class="subContent">${avgTradeVo.avg_price }</span>
	</div>
	<div class="subThreeMonth">
		<span class="subTitle">가장 최근 거래가</span><br/>
		<c:forEach items="${recentTradeList }" var="rtList">
			<span class="subContent">${rtList.dl_price } / </span>
			<span class="subContent">${rtList.dl_flr} 층 /</span>
			<span class="subContent">${rtList.dl_cont_ym}</span>
			<br/>
		</c:forEach>
	</div>
	<div class="floatClearDiv">
		<hr/>
	</div>
</div>
<div id="myChart">
</div>

<div id="siseTableDiv">
	<span class="subTitle">실거래 시세표</span> <button class="openMask" id="siseMask">전체 시세표</button>
	<table id="siseTable">
		<thead>
			<tr>
				<td>거래일</td>
				<td>거래금액</td>
				<td>층</td>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${dealListByArea }" var="dealList" begin="0" end="6">
			<tr>
				<td>${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
				<td>${dealList.dl_price }</td>
				<td>${dealList.dl_flr }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
</div>
<!-- 공지사항 팝업용  -->
<div class="window" id="siseWindow">
	<h2>공지사항</h2>
	<a href="#" class="close">닫기X</a>
	<hr/>
	<div class="notice-pop">
		<table class="table table-striped notice-tbl">
			<thead>
				<tr>
					<td style="width: 200px;">거래이</td>
					<td>거래가</td>
					<td>거래층</td>
				</tr>
				
				<c:forEach items="${dealListByArea }" var="dealVo">
				<tr>
					<td style="width: 200px;">${dealVo.dl_cont_ym }, ${dealVo.dl_cont_d }<td>
					<td>${dealVo.dl_price }</td>
					<td>${dealVo.dl_flr }</td>
				</tr>
				</c:forEach>
				
			</thead>
		</table>
	</div>
</div>
<div id="loanClacDiv">
	<span class="subTitle"> 대출금 계산기</span><br/>
	<input type="range" class="marginTop" id="calculator" max="${avgTradeVo.avg_price }"><br/>
	<span id="calcResult">얼마일까</span>
</div>