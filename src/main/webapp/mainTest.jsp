<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main-left {
	width: 70%;
	height: 100%;
	float: left;
	z-index: 9000;
}

.search-filt {
	width: 100%;
	height: 5%;
}

.search {
	margin: 10px 24px 0 40px;
	width: 280px;
	height: 37px;
	float: left;
}

.search-box {
	width: 210px;
	height: 36px;
	align-self: center;
	margin: 0;
	padding: 0;
	border: none;
	border-bottom: 2px solid #4159a9;
}

.search-box::placeholder {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 400;
	color: #cacaca;
}

.searchBtn {
	width: 57px;
	padding: 0;
	margin: 0;
	height: 35px;
	color: white;
	font-size: 14px;
	font-weight: 400;
	text-align: center;
	background-color: #ffae24;
	border-bottom: 5px solid #4159a9;
}

.searchBtn:hover {
	border-bottom: 4px solid #626f9c;
}

.main-right {
	width: 30%;
	height: 100%;
	float: left;
	border-left: 1px solid #e0e0e0;
	background: #f5f3f0;
	position: relative;
}

.filters-div {
	float: left;
}

.articles {
	width: 95%;
	height: 170%;
	float: right;
	overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
}

::-webkit-scrollbar {
	width: 16px;
}

::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background-color: #ffae24;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #4159a9;
}

.article {
	width: 500px;
	height: 140px;
	margin: 15px 0;
	padding: 20px;
	border: 1px solid #e0e0e0;
	font-size: 15px;
	font-family: 'Nanum Gothic Coding', monospace;
	background: white;
}

.article h4 {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	color: #4159a9;
	font-size: 24px;
}

.address {
	margin-top: 8px;
}

.avg-price {
	
}

.area-analysis {
	z-index: 10000;
	position: absolute;
	width: 100px;
	height: 100px;
	background: black;
	left: -100px;
	bottom: 0;
}

#slider-vertical {
	margin-left: 20px;
}

#mini {
	margin-left: 50px;
}

.cRtqxV {
	max-width: 150px;
	height: 100%;
	font-size: 14px;
	color: rgb(255, 255, 255);
	font-weight: 500;
	line-height: 34px;
	background-color: rgb(0, 108, 255);
	user-select: none;
	position: relative;
	padding: 0px 30px 0px 12px;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(0, 108, 255);
	border-image: initial;
	border-radius: 3px;
}

.shape {
	display: inline-block;
}

.filterT{
	margin-left: 10px;
	line-height: 40px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
}


.fJNXpX {
	max-width: 150px;
	height: 100%;
	font-size: 14px;
	color: rgb(34, 34, 34);
	font-weight: 500;
	line-height: 34px;
	background-color: rgb(255, 255, 255);
	
	user-select: none;
	position: relative;
	padding: 0px 30px 0px 12px;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(224, 224, 224);
	border-image: initial;
	border-radius: 3px;
}

.fJNXpX:hover {
	background-color: rgb(245, 245, 245);
	border-color: rgb(245, 245, 245);
}

#svg{
	color: black;
}

.subShape{
	z-index: 10; 
}

#slider-bar{
	margin-left: 10px;
}


</style>
<script type="text/javascript"
	src="/css/boostratp_slider_css_js/js/jquery.min.js"></script>
 <link href="/css/boostratp_slider_css_js/css/bootstrap-slider.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/css/boostratp_slider_css_js/js/bootstrap-slider.js"></script>
<link href="css/boostratp_slider_css_js/css/bootstrap.min.css" rel="stylesheet">

	
<script type="text/javascript">
 $(document).ready(function(){
	 var dib = document.getElementsByName("subDiv");
	 
	$(dib).hide();
	 
	 $("#showSubDiv").on("click",function(){
		 alert("클릭됬당");
		 $(dib).show();
	 });
	 
	$("#slider-bar").slider({
		 range:"max",
		 min: 1,
		 max : 30,
		 value :1,
		 orientation : "horizontal",
		 animate : "slow",
		 slide: function(event, ui){
			 $("#data-value").val(ui.value);
		 }
	 });
	var price = $("#slider-bar").val();	
	var span = "<span id='price'> 무제한 </span>"
	$("#price").html("");
	$("#price").html(span);
	$("#slider-bar").on("change",function(){
		price = $("#slider-bar").val();	
		if(price[1] == 30){
			span = "<span id='price'>" + price[0] + " 억  ~ " + " 무제한</span>"
		}else{
			span = "<span id='price'>" + price[0] + " 억  ~ " + price[1]+ " 억</span>"
		}
		$("#price").html("");
		$("#price").html(span);
	});
 });
</script>
<!-- left contents -->
	<!-- 검색 조건 -->
	<div class="search-filt">
		<!-- 검색어 -->
		 <%-- <div class="search">
			<input type="hidden" id="dl_type" name="dl_type" value="${dlType}">
			<form method="get" name="frm">
				<input type="text" class="search-box" placeholder="지역명, 지하철역명, 아파트명"
					name="searchName" id="loc" value="${searchName}"> <input
					type="hidden" id="building" name="building" value="${building}">
				<input type="hidden" id="dl_ty" name="dl_ty" value="매매">
				<button type="button" class="btn btn-primary searchBtn btn-lg"
					id="search">검색</button>
			</form>
		</div>  --%>

		<!-- 필터 -->
		<!-- <div class="styled__FilterWrap-sfs8fz-1 fvkqQK">
			<div class="styled__Wrap-sc-1a98puu-0 hWgOZv" tabindex="0">
				<div class="styled__Btn-sc-1a98puu-1 fJNXpX shape" id="showSubDiv">
					<span class="filterT">전/월/매</span>
					<svg id="svg" width="11" height="7" viewBox="0 0 11 7">
						<path fill="none" fill-rule="evenodd" stroke-width="1.5"
							d="M.658 1.021l4.537 4.263 4.463-4.263"></path>
					</svg>
				</div>
				<div class="styled__Btn-sc-1a98puu-1 fJNXpX shape">
					<span class="filterT">가격</span>
					<svg width="11" height="7" viewBox="0 0 11 7">
						<path fill="none" fill-rule="evenodd" stroke-width="1.5"
							d="M.658 1.021l4.537 4.263 4.463-4.263"></path></svg>
				</div>
				<div class="styled__FilterBox-sc-1a98puu-2 fhfjff subShape"
					style="left: 0px;" name ="subDiv">
					<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
						매물형태
						<p class="styled__Desc-sc-1a98puu-5 dUdesp">중복선택이 불가능합니다.</p>
					</h1>
					<ul class="styled__Ul-sc-1eqdfqp-0 hpBewf">
						<li><label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi"
							size="22"><input type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 fEHAIG"
								name="multi_room_type" value="" checked=""><span
								class="CheckBox"></span><span
								class="styled__Text-sc-1eqdfqp-2 kMvalg">전세</span></label></li>
						<li><label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi"
							size="22"><input type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 fEHAIG"
								name="multi_room_type" value="" checked=""><span
								class="CheckBox"></span><span
								class="styled__Text-sc-1eqdfqp-2 kMvalg">월세</span></label></li>
						<li><label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi"
							size="22"><input type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 fEHAIG"
								name="multi_room_type" value="" checked=""><span
								class="CheckBox"></span><span
								class="styled__Text-sc-1eqdfqp-2 kMvalg">매매</span></label></li>
					</ul>
				</div>
				<div class="styled__FilterBox-sc-1a98puu-2 fhfjff subShape"
					style="left: 0px;" name ="subDiv">
					<h1 class="styled__Title-sc-1a98puu-3 lmqlXb">
						매물형태
						<p class="styled__Desc-sc-1a98puu-5 dUdesp">중복선택이 불가능합니다.</p>
					</h1>
					<ul class="styled__Ul-sc-1eqdfqp-0 hpBewf">
						<li><label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi"
							size="22"><input type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 fEHAIG"
								name="multi_room_type" value="" checked=""><span
								class="CheckBox"></span><span
								class="styled__Text-sc-1eqdfqp-2 kMvalg">가격1</span></label></li>
						<li><label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi"
							size="22"><input type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 fEHAIG"
								name="multi_room_type" value="" checked=""><span
								class="CheckBox"></span><span
								class="styled__Text-sc-1eqdfqp-2 kMvalg">가격2</span></label></li>
						<li><label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi"
							size="22"><input type="checkbox"
								class="Checkbox__CheckboxStd-ifp1yz-1 fEHAIG"
								name="multi_room_type" value="" checked=""><span
								class="CheckBox"></span><span
								class="styled__Text-sc-1eqdfqp-2 kMvalg">가격2</span></label></li>
					</ul>
				</div>
			</div>
		</div> -->
		<!-- <input type="text" id="data-value"> -->
		<!-- <input type="range" min="1" max="100" id="range-slider">
		<br> -->
		<h3>매매가</h3>
		<div id="slider-bar"></div>&nbsp&nbsp
		<span id="price"></span>

		<!-- 지도 -->
		<div id="map" style="width: 100%; height: 95%;"></div>

	</div>

	<!-- right contents -->

		<!-- 지역분석 버튼 -->
		<!-- <div class="area-analysis">
		2
	</div> -->
	</div>