<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(36.3505393936125, 127.38483389033713), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(36.3505393936125, 127.38483389033713);
		//마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		$("#search").on("click",function(){
			//현재 표시되어있는 마커는 지우기
			var loc = $("#loc").val();
			marker.setMap(null);
			var ps = new daum.maps.services.Places();
			ps.keywordSearch(loc,placeSearchCB);
			
			/* marker.setMap(null);
			var ps = new daum.maps.services.Places();
			ps.keywordSearch(loc,placeSearchCB); */
		});
		function placeSearchCB(data, status, pagination) {
			if (status == daum.maps.services.Status.OK) {
				var bounds = new daum.maps.LatLngBounds();
				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
				}
				map.setBounds(bounds);
				var moveLatLon = new daum.maps.LatLng(data[0].y, data[0].x);
				map.setCenter(moveLatLon);
			}
			//지도 레벨 표시
			map.setLevel(3);
		}
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker = new daum.maps.Marker({
				map : map,
				position : new daum.maps.LatLng(place.y, place.x)
			});
			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
						+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	});
</script>

<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	<!-- left contents -->
	<div>
		<form style="width: 300px;display: inline-block; float: left; padding-left: 20px; padding-top: 10px;">
			<input  type="text" placeholder="Search" id="loc">
			<button  type="button" id="search">Search</button>
		</form>
			<ul class="nav nav-tabs" style="width: 1000px;">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</li>
			</ul>
		<!-- <img src="https://via.placeholder.com/1400x850/ffaaaa?text=daum_map" /> -->
		<div id="map" style="width: 1400px; height: 800px;"></div>
	</div>
	<!-- right contents -->
	<div>
<!-- 		<img src="https://via.placeholder.com/500x850/aaffaa?text=/user/main.jsp" /> -->

			<!-- 매물리스트  -->
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<!-- 1번 시작 -->
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> Collapsible Group Item #1 </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in"
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
				</div>
			</div>
			<!-- 1번 끝 -->
			<div class="panel panel-default">
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
			</div>
			<div class="panel panel-default">
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
			</div>
		</div>
	</div>
</div>