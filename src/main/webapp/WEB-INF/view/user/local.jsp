<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/local.css" rel="stylesheet">
<script type="text/javascript" src="/js/local_nearFaci.js"></script>

<!-- 전체 contents div -->
<div class="row" style="height: 1000px !important">
	<!-- left contents -->
	<div id="mapWrap">
		<div id="map"></div>
		<ul id="category">
			<li id="BK9" data-order="0"> 
				<span class="category_bg bank"></span>
				은행
			</li>       
			<li id="MT1" data-order="1"> 
				<span class="category_bg mart"></span>
				마트
			</li>  
			<li id="PM9" data-order="2"> 
				<span class="category_bg pharmacy"></span>
				약국
			</li>  
			<li id="OL7" data-order="3"> 
				<span class="category_bg oil"></span>
				주유소
			</li>  
			<li id="CE7" data-order="4"> 
				<span class="category_bg cafe"></span>
				카페
			</li>  
			<li id="CS2" data-order="5"> 
				<span class="category_bg store"></span>
				편의점
			</li>      
		</ul>
	</div>
	<!-- right contents -->
	<div id="rightContentWrapper">
		<div id="rightContent">
			<div id="localNameDiv">
				<span id="localNameSpan">${gu } ${dong} 지역 분석</span> 
				<input type="hidden" id="addr" value="대전광역시 ${gu } ${dong}" />
				<input type="hidden" id="loc" value="${dong}"/>
				<input type="hidden" id="gu" value="${gu}"/>
				<input type="hidden" id="dl_ty" value="매매"/>
				<hr />
			</div>
			<div class="categoryDiv">
				<ul class="nav nav-tabs tab-yellow">
					<li class="nav-item">
					<a class="nav-link tab-yellow show category tagCategory" data-toggle="tab" href="#signDaily" id="popStatis">인구 통계</a></li>
					<li class="nav-item">
					<a class="nav-link tab-yellow category tagCategory"  data-toggle="tab" href="#signAgeGndr" id="nearFaci">근린 시설</a></li>
					<li class="nav-item">
					<a class="nav-link tab-yellow category tagCategory" data-toggle="tab" href="#signMonthly" id="market">물가 정보</a></li>
					<li class="nav-item"><a class="nav-link tab-yellow category" data-toggle="tab" href="#signAgeGndr" id="station">교통 정보</a></li>
				</ul>
			</div>
			<div class="contentDiv"></div>
		</div>
	</div>
</div>

<script>
		// 해당 주소에 대한 좌표값을 담을 변수
		var x;
		var y;

		// 해당 주소를 담을 값
		var addr;

		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapContainer.style.width = '650px';
		mapContainer.style.height = '1000px';

		mapOption = {
			center : new daum.maps.LatLng(36.3505393936125, 127.38483389033713), // 지도의 중심좌표
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

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();
		//지도 확대 축소 컨트롤
		var zoomControl = new daum.maps.ZoomControl();

		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var geocoder = new daum.maps.services.Geocoder();

		var addr = document.getElementById('addr').value;
		//주소로 좌표검색
		geocoder.addressSearch(addr, function(result, status) {

			//TODO : 주소로 좌표 검색...
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});

				map.setCenter(coords);

			}

		})
		
		/*----------------------- 추가 시작 -----------------------------*/
		
		
		/*----------------------- 추가 끝 -----------------------------*/

		
		


	//지도 특정 장소 검색하기
	//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();
	
	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}
	
	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

	    } else if (status === daum.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        
	    }
	}
	
	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');

	    

	    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                daum.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}
	
	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}
	
	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}
	
	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;

	    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}
	

	
	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }

	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	
	
	

	
	
	//*************지도 끝 ******************

	setContentDivByAjax('popStatis');

	$('.categoryDiv').on('click', '.category', function() {
		if(this.id == 'nearFaci'){
			$(".row").addClass("rowChange");
			$("#mapWrap").addClass("mapWrapChange");
			$("#map").addClass("mapChange");
			$("#rightContentWrapper").addClass("rightWrapChange");
			$("#rightContent").addClass("rigntContentChange");
		}else{
			$(".row").removeClass("rowChange");
			$("#mapWrap").removeClass("mapWrapChange");
			$("#map").removeClass("mapChange");
			$("#rightContentWrapper").removeClass("rightWrapChange");
			$("#rightContent").removeClass("rigntContentChange");
		}

		setContentDivByAjax(this.id);

	})

	function setContentDivByAjax(id) {

		var dong = "${dong}";
		var gu = "${gu}";
		var addr = $("#addr").val();
	/* 	if(id != "nearFaci"){
			location.reload();
		} */

		$.ajax({
			type : 'POST',
			data : {
				dong : dong,
				addr : addr
			},
			url : '/local/' + id,
			success : function(data) {
				$('.contentDiv').html(data);
			},
			complete : function() {

			}
		});

	}
</script>