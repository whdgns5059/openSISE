<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
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
.middleCategory{
	width: 100%;
    height: 100%;
    float: left;
    border-left: 1px solid #e0e0e0;
    background: #ffffff;
    position: relative;
}

ul{
	list-style: none;
}

.cate{
	width: 120px;
	height: 46px;
	margin-top: 14px;
    margin-left: 20px;
}

.line{
	width: 625px;
    margin-right: 63px;
}

.title{
	margin-left: 12px;
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

</style>
<script>
	searchPlacest("대전광역시 ${dong} "+ $(".selBox").val());
	
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
	var mapTypeController = new daum.maps.MapTypeControl();
	//지도 확대 축소 컨트롤
	var zoomController = new daum.maps.ZoomControl();
	console.log("dfdfdf");
	

	map.addControl(zoomController, daum.maps.ControlPosition.RIGHT);
	map.addControl(mapTypeController, daum.maps.ControlPosition.TOPRIGHT);

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var geocoder = new daum.maps.services.Geocoder();

	var addr = "${addr}";
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
	
	//selectBox 클릭시 이벤트 발생
	$(".contentDiv").on("change",".selBox",function(){
		// select box 에서 선택한 값을 검색어로 넘겨준다.
		searchPlacest(this.value);
	});
	
	// 장소 검색 객체를 생성합니다
	var pst = new daum.maps.services.Places(); 

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	 
	var finalKeyword;

	// 키워드 검색을 요청하는 함수입니다
	function searchPlacest(keyword) {
		if(keyword == 'other'){
// 			$("#searchFaci").attr("type","text");
			finalKeyword = "대전  ${dong} " + $("#searchFaci").val();
		}else{
			finalKeyword = "대전광역시 ${dong} "+ " "+ keyword;	
			console.log(finalKeyword);
		}

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    pst.keywordSearch( finalKeyword, placesSearchCBT); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCBT(data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlacest(data);

	        // 페이지 번호를 표출합니다
	       //displayPagination(pagination);

	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === daum.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlacest(places) {
		var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	     // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	    
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	     for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarkers(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            daum.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            daum.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5 class="title">' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span class="title">' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>' + '<br>';
	    } else {
	        itemStr += '    <span class="title">' +  places.address_name  + '</span>'+ '<br>';
	    }
	                 
	      itemStr += '  <span class="tel title">' + places.phone  + '</span>' +
					'<hr class="line">'    +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarkers(position, idx, title) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
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



	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	

</script>
<div class="middleCategory">
  <div>
	 <form onsubmit="searchPlacest(); return false;">
		 <select class="selBox cate">
			<c:forEach items="${instiList}" var="insti">
				<option value="${insti.insti_nm }">${insti.insti_nm }</option>	
			</c:forEach>
				<option value="other">기타</option>	
		 </select>
			 <input type="hidden" id="searchFaci">
<!-- 			 <button type="submit" id="searchBtn">검색</button> -->
	 </form>
  </div>
  <div id="menu_wrap" class="bg_white">
       <div class="option">
           <div>
           </div>
       </div>
       <hr>
       <ul id="placesList"></ul>
       <div id="pagination"></div>
   </div>
</div>
