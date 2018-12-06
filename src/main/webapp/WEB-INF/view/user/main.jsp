<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main-left{
	width: 70%;
	height: 100%;
	float: left;
}
.search-filt{
	width: 100%;
	height: 5%;
}
.search{
    margin: 10px 24px 0 40px;
    width: 280px;
    height: 37px;
    float: left;
}
.search-box{
    width: 210px;
    height: 36px;
    align-self: center;
    margin: 0;
    padding: 0;
    border: none;
    border-bottom: 2px solid #4159a9;
}
.searchBtn{
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
.searchBtn:hover{
	 border-bottom: 4px solid #626f9c;
}
.main-right{
	width: 30%;
	height: 100%;
	float: left;
	border-left: 1px solid #e0e0e0;
}
.filters-div{
	float: left;
}

</style>
<script type="text/javascript">
	$(document).ready(
			function() {

				// 해당 주소에 대한 좌표값을 담을 변수
				var x;
				var y;

				// 해당 주소를 담을 값
				var addr;

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(36.3505393936125,
							127.38483389033713), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				//마커가 표시될 위치입니다 
				var markerPosition = new daum.maps.LatLng(36.3505393936125,
						127.38483389033713);
				//마커를 생성합니다
				var marker = new daum.maps.Marker({
					position : markerPosition
				});
				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

			});
</script>


<!-- left contents -->
<div class="main-left">
	<c:forEach items="${buildingSaleList}" var="build">
		<input type="hidden" class="lat" value="${build.artcl_lat}">
		<input type="hidden" class="lng" value="${build.artcl_lng}">
	</c:forEach>
	
	<!-- 검색 조건 -->
	<div class="search-filt">
		<!-- 검색어 -->
		<div class="search"> 
			<form action="/" method="get">
				<input type="text" class="search-box" placeholder="Search" id="loc" value="${search}">
				<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
			</form>
		</div>
		
		<!-- 필터 -->
		<div class="filters-div">
			<ul class="nav nav-tabs" >
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">전/월/매</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="jeonse" />
		     					<label class="custom-control-label" for="jeonse">&nbsp&nbsp전세</label>
		     				</a>
		     			</div>
		     			<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="wolse" />
		     					<label class="custom-control-label" for="wolse">&nbsp&nbsp월세</label>
		     				</a>
		     			</div>
		     			<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#">
								<input type="checkbox" class="custom-control-input" id="maemae" />
		     					<label class="custom-control-label" for="maemae">&nbsp&nbsp매매</label>
		     				</a>
		     			</div>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">가격</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">면적</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">준공년도</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a> 
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">층수</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> 
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div id="map" style="width: 100%; height: 95%;"></div>
</div>
	
<!-- right contents -->
<div class="main-right">

	<!-- 매물리스트  -->
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<!-- 1번 시작 -->
		<div class="panel panel-default">
			<c:choose>
				<c:when test="${building eq multi}">
					<c:forEach items="${buildingSaleList}" var="build">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 
									${build.artcl_gu}&nbsp;${build.artcl_dong}&nbsp; ${build.artcl_rd} </a>
							</h4>
						</div>
					</c:forEach>

				</c:when>

				<c:when test="${building eq apt}">
					<c:forEach items="${buildingSaleList}" var="building">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 
									${building.artcl_complx}</a>
							</h4>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
			
			
			
				<!-- <div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div> -->
			</div>

			<!-- 1번 끝 -->
			<!-- <div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							Collapsible Group Item #2 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div> -->
			<!-- <div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							Collapsible Group Item #3 </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div> -->
		</div>
	</div>
