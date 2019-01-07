<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/css/main.css" rel="stylesheet" />
<link href="/css/boostratp_slider_css_js/css/bootstrap-slider.css" rel="stylesheet" />
<script type="text/javascript" src="/css/boostratp_slider_css_js/js/bootstrap-slider.js"></script>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script type="text/javascript">
	//36.3505393936125,127.38483389033713
	$(document).ready(function() {
		
		var jsonLatLng;
		//처음에는 무조건 매매가 이므로 월세 div는 숨겨준다.
		$("#rnt").hide();
		sliderPrice(0, 300000);
		
		var map;
		
		/* var dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
		$("#buildT").html(dl_Type); */
		dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
		$("#buildT").html(dl_Type);
		$("#dl_ty").val(dl_Type);
		
		//지도 셋팅
		settingMap(0,0);
		
		function sliderPrice(miniMum, maxiMum){
		   $("#slider-price").slider({
			   range : "max",
			   min : miniMum,
			   max : maxiMum,
			   value : 0,
			   step : 100,
			   orientation : "horizontal",
			   animate : "slow",
		   });
		}
		
		function sliderRnt(miniMum, maxiMum){
			$("#slider-rnt").slider({
				range : "max",
				min : miniMum,
				max : maxiMum,
				value : 0,
				step :10,
				orientation : "horizontal",
				animate : "slow"
			});
		}
		
		$(".divHeight").on("change", "#slider-price",function(){
			var priceRange = $("#slider-price").val();
			$("#dl_price1").val(priceRange[0]);
			$("#dl_price2").val(priceRange[1]);
			if(priceRange[0] >= 10000){
				$(this).slider("option","step", "10000");
			}
			if(priceRange[1] == 300000 ){
				$("#dlPrice").val(priceRange[0] + "만원  ~ 무제한 ");
			}else{
				if(priceRange[0] < 10000){
					if(priceRange[1] < 10000){
						$("#dlPrice").val(priceRange[0] + "만원  ~ " + priceRange[1] + "만원");
					}else{
						$("#dlPrice").val(priceRange[0] + "만원  ~ " + priceRange[1] + "억");
					}
				}else{
					if(priceRange[1] < 10000){
						$("#dlPrice").val(priceRange[0] + "억  ~ " + priceRange[1] + "만원");
					}else{
						$("#dlPrice").val(priceRange[0] + "억 ~ " + priceRange[1] + "억");
					}
				}
			}
		});
		
		//월세일때의 가격 변화
		$(".divHeight").on("change", "#slider-rnt",function(){
			var priceRange = $("#slider-rnt").val();
			$("#dl_rnt1").val(priceRange[0]);
			$("#dl_rnt2").val(priceRange[1]);
			if(priceRange[1] == 1000 ){
				$("#dlRnt").val(priceRange[0] + "만원  ~ 무제한 ");
			}else{
				$("#dlRnt").val(priceRange[0] + "만원  ~ " + priceRange[1] + "만원");
			}
		});
		
		//가격 ajax 처리
		 $(".divHeight").on("slideStop","#slider-price",function(){
			getArticleList();
		});
		$(".divHeight").on("slideStop","#slider-rnt",function(){
			getArticleList();
		}); 
		
		

		/*전/월/매 ajax 처리*/
		$(".dlSelector").on("click", function(){
			dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			$("#buildT").html(dl_Type);
			$("#ty").val(dl_Type);
			$("#dl_ty").val(dl_Type);
			$("#dl_t").val(dl_Type);
			
			getArticleList();
			
			if(dl_Type == '매매'){
				$("#priceTitle").html("매매가");
				sliderPrice(0,300000);
				$("#rnt").hide();
				$(".divHeight").css("height", "140px");
				$("#dlPrice").val("");
				$("#dlRnt").val("");
			}else if(dl_Type == '월세'){
				sliderPrice(0,100000);
				sliderRnt(0,1000);
				$(".divHeight").css("height", "260px");
				$("#rnt").show();
				$("#dlPrice").val("");
				$("#dlRnt").val("");
			}else {
				sliderPrice(0,100000);
				$("#priceTitle").html("보증금");
				$("#rnt").hide();
				$(".divHeight").css("height", "140px");
				$("#dlPrice").val("");
				$("#dlRnt").val("");
			}
			
		}); 
		
		
		/*단/다세대 ajax 처리*/
		$(".houseSelector").on("click", function(){
			building = document.querySelector('input[name="house"]:checked').value;
			$("#buildings").val(building);
			console.log($("#buildings").val());
			if(building == "single"){
				$("#houseType").html("단독");
			}else if(building == "multi"){
				$("#houseType").html("다세대");
			}else if(building == "multip"){
				$("#houseType").html("연립");
			}else{
				$("#houseType").html("전체");
			}
			getArticleList();
		});
		
		/*평(형)수 ajax 처리*/
		$(".areaSelector").on("click",function(){
			dl_excv_area = document.querySelector('input[name="area"]:checked').value;
			if(dl_excv_area == "0"){
				$("#excv_area").html("전체");
			}else if(dl_excv_area == "60"){
				$("#excv_area").html(dl_excv_area+"평대 이상");
			}else{
				$("#excv_area").html(dl_excv_area+"평대");
			}
			
			$("#dl_excv_area").val(dl_excv_area);
			getArticleList();
			
		});
		
		/*준공년도 ajax 처리*/
		$(".yearSelector").on("click",function(){
			artcl_const_y = document.querySelector('input[name="year"]:checked').value;
			if(artcl_const_y == "all"){
				$("#const_y").html("무관");
			}else{
				$("#const_y").html(artcl_const_y+"년 이하");
			}
			$("#artcl_const_y").val(artcl_const_y);
			getArticleList();
			
		});
		
		//가격 ajax 처리
		$(".priceSelector").on("click",function(){
			dl_price = document.querySelector('input[name="price"]:checked').value;
		});
		
		
		
		/*검색버튼 ajax 처리*/
		$("#search").on("click",function(){
			dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			$("#dl_ty").val('매매');
			
			
			//검색 시 check된 필터 모두 초기화
			$("#allArea").prop("checked",true);
			$("#maemae").prop("checked", true);
			$("#all").prop("checked", true);
			$("#ignore").prop("checked", true);
			$("#slider-bar").html("");
			
			//필터 innerHTML 재정의
			$("#houseType").html("주거형태");
			$("#buildT").html('매매');
			$("#excv_area").html('평(형)수');
			$("#const_y").html('준공년도');
			
			
			$("#dl_excv_area").val("");
			$("#artcl_const_y").val("");
			$("#dl_price1").val("");
			$("#dl_price2").val("");
			$("#dl_rnt1").val("");
			$("#dl_rnt2").val("");

			
			getArticleList();
			
		});
		
		
		/*------------- 해당 매물 mouseover시 중심 좌표 이동---------*/
		$(".main-right").on("mouseover",".article",function(){
			var x = this.getElementsByClassName("lat")[0].value;	// mouseOver가 된 해당 매물의 위도
			var y = this.getElementsByClassName("lng")[0].value;	// mouseOver가 된 해당 매물의 경도
			
			var moveLatLng = new daum.maps.LatLng(x, y);
			map.panTo(moveLatLng);
			
			//settingMap(x,y);
		});
		/*------------- 해당 매물 mouseover시 중심 좌표 이동 끝---------*/
		
		
		/*------------- 해당 매물 클릭 시 상세정보로 이동 ---------------*/
		$(".main-right").on("click",".article",function(){
			$("#artcl_gu").val(this.getElementsByTagName("input")[2].value);
			$("#artcl_dong").val(this.getElementsByTagName("input")[3].value);
			$("#artcl_zip").val(this.getElementsByTagName("input")[4].value);
			$("#artcl_rd").val(this.getElementsByTagName("input")[5].value);
			$("#frmDetail").submit();
		});
		/*------------- 해당 매물 클릭 시 상세정보로 이동 끝 ---------------*/
		
		
		
		function settingMap(x,y){
			var lat;
			var lng;
			if ($("#loc").val() == "") {
				// 검색값이 없을 때 시청으로 기본 좌표값 설정
				lat = 36.3505393936125;
				lng = 127.38483389033713;
			}else if($("#listSize").val() == "0"){
				
				if($(".lat").val()== null || $(".lat").val() == ""){
					lat = 36.3505393936125;
					lng = 127.38483389033713;
				}else{
					lat = $("#latX").val();
					lng = $("#lngY").val();
				}
			}else if(x == 0 && y == 0) {
				// 해당 주소에 대한 좌표값을 담을 변수
				lat = $(".lat").val(); //위도
				lng = $(".lng").val(); //경도
			}else{
				lat = x;
				lng = y;
			}
			
			// 해당 주소를 담을 값
			var addr;

			/*------------ 지도생성 코드 ----------------*/
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			/*------------- 지도 생성 코드 끝 ----------------*/
			
			/*---------- 마커 클러스터러 생성 -------------*/
			  // 마커 클러스터러를 생성합니다 
		    var clusterer = new daum.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 4 // 클러스터 할 최소 지도 레벨 
		    });
			
			/*---------- 마커 클러스터러 생성 끝 -----------*/
			
			/*------------- 마커 생성 코드 ----------------*/

			var positions = setLatlngArr();
			
			var positiont = markerLatLngArr();
			var totalObj = new Object();
			totalObj.positions = positiont;
			console.log(positiont);
		/* 	jsonLatLng = JSON.stringify(totalObj);
			console.log(jsonLatLng); */
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			
			//마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(lat, lng);
			var marker;
			var markerPos = [];
			for(var i =0; i<positions.length; i++){
				//마커를 생성합니다
					//마커이미지 주소
					var imageSrc = '/img/placePicker.png',
					 imageSize = new daum.maps.Size(34, 50),
					 imageOption = {offset : new daum.maps.Point(27, 80)},
					 imageValue = positions[i];

					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption, imageValue);
				
					marker = new daum.maps.Marker({
					position : positions[i],
					image : markerImage
					});
				
				markerPos.push(marker);
				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				markerClick(marker);
			}
			clusterer.addMarkers(markerPos);
			
			/*-------------- 마커 클릭 이벤트 시작 -----------*/
			function markerClick(marker){
				// 마커에 클릭이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
				      // 마커 위에 인포윈도우를 표시합니다
	// 			      infowindow.open(map, marker);  
				    // var latlng =  mouseEvent.latLng;
// 				     alert("클릭이 된것이냥");
				});

				daum.maps.event.addListener(marker, 'mouseover', function() {
				      // 마커 위에 인포윈도우를 표시합니다
	// 			      infowindow.open(map, marker);  
				    // var latlng =  mouseEvent.latLng;
// 				     alert("over 된것이냥");
				});
			}
			/*-------------- 마커 클릭 이벤트 끝 -----------*/
			
		
			/*--------------- 마커 클러스터러 데이터 가져오기 시작 --------*/
			
  		    	/*  var markers = $(positiont).map(function(i, position) {
 		            return new daum.maps.Marker({
 		                position : new daum.maps.LatLng(position.lat, position.lng)
 		            });
 		        });
  		    	 
		        // 클러스터러에 마커들을 추가합니다
  		    	clusterer.addMarkers(markers); */
		       
			/*-------------- 마커 클러스터러 데이터 가져오기 끝 -----------*/
			
			//toLocal 클릭시 좌표읽어서 이동
			$('.toLocal').on('click',function(){
				console.log("클림됨");
				var geocoder = new daum.maps.services.Geocoder();

				var center = map.getCenter();

				var coord = new daum.maps.LatLng(center.getLat(), center.getLng());
				var callback = function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						
						var gu = result[0].address.region_2depth_name;
						var dong = result[0].address.region_3depth_name;


						location.href="/local/local?gu="+gu+"&dong="+dong;
						
					}
				};

				geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			});
			

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
			            marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

			            // 마커와 검색결과 항목을 클릭 했을 때
			            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			            (function(marker, place) {
			                daum.maps.event.addListener(marker, 'click', function() {
			                	alert("마커 클릭시 이벤트 발생 실행??")
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
			
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
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
		}
		
		function getArticleList(){
			console.log($("#buildings").val());
		 	var param = $("form[name=frm]").serialize();
		 	var building = document.getElementById("buildings").value;
		 	var searchName = document.getElementById("loc").value;
		 	var dl_ty = document.getElementById("dl_ty").value;
		 	var dl_excv_area = document.getElementById("dl_excv_area").value;
		 	var artcl_const_y = document.getElementById("artcl_const_y").value;
		 	var dl_price1 = document.getElementById("dl_price1").value;
		 	var dl_price2 = document.getElementById("dl_price2").value;
		 	var dl_rnt1 = document.getElementById("dl_rnt1").value;
		 	var dl_rnt2 = document.getElementById("dl_rnt2").value;
		 	
		 	console.log("dl_price1 : "+ dl_price1);
		 	console.log("dl_price2 : "+ dl_price2);
		 	console.log("dl_rnt1 : " + dl_rnt1) 
		 	console.log("dl_rnt2 : " + dl_rnt2) 
		 	
		 	var ajaxFlag = true;
		 	
		 	if(ajaxFlag == true){
		 		
		 		ajaxFlag = false;
		 		
		 		$.ajax({
					type : "POST",
					url : "/main/mainAjax",
					data : {building : building, searchName : searchName, 
							dl_ty : dl_ty, dl_excv_area : dl_excv_area, 
							artcl_const_y : artcl_const_y, dl_price1 : dl_price1, 
							dl_price2 : dl_price2, dl_rnt1 :dl_rnt1 ,dl_rnt2 : dl_rnt2},
					success : function(data){
						$(".main-right").html("");
						$(".main-right").html(data);
						settingMap(0,0);
					},
					complete : function(){
						setAjaxFlagChange();
					}
				});	
		 	}
		}
		
		function setAjaxFlagChange(){
			ajaxFlag = true;
		}
		
		
		/*검색한 좌표들을 배열에 담아준다*/
		function setLatlngArr() {
			/* console.log(lat[0]);
			console.log(lng[0]); */
			var lat = document.getElementsByClassName("lat");
			var lng = document.getElementsByClassName("lng");
			var position = [];
			for (var i = 0; i < lat.length; i++) {
				position[i] = new daum.maps.LatLng(lat[i].value, lng[i].value);
			}
			return position;
		}
		
		function markerLatLngArr(){
			var latt = document.getElementsByClassName("lat");
			var lngt = document.getElementsByClassName("lng");
			var position = [];
			
			for (var i = 0; i < latt.length; i++) {
				let pos = {lat:latt[i].value, lng:lngt[i].value};
// 				position.push(pos);
				position[i] = pos;
			}
			console.log("position : " + position);
			
			return position;
		}

		
		
		
	});
	
	function onKeypress(){
		if (window.event.keyCode == 13) {
			dl_Type = document.querySelector('input[name="buildingType"]:checked').value;
			$("#dl_ty").val('매매');
			
			//검색 시 check된 필터 모두 초기화
			$("#allArea").prop("checked",true);
			$("#maemae").prop("checked", true);
			$("#all").prop("checked", true);
			$("#ignore").prop("checked", true);
			$("#slider-bar").html("");
			
			//필터 innerHTML 재정의
			$("#houseType").html("주거형태");
			$("#buildT").html('매매');
			$("#excv_area").html('평(형)수');
			$("#const_y").html('준공년도');
			
			
			$("#dl_excv_area").val("");
			$("#artcl_const_y").val("");
			$("#dl_price1").val("");
			$("#dl_price2").val("");
			$("#dl_rnt1").val("");
			$("#dl_rnt2").val("");

			
			getArticleList();
		}
	}
	
	
	

	
	
</script>


<!-- left contents -->
<div class="main-left">
	<input type="hidden" id ="latX" value="${buildingSaleList[0].artcl_lat}">
	<input type="hidden" id ="lngY" value="${buildingSaleList[0].artcl_lng}">
	<!-- 검색 조건 -->
	<div class="search-filt">
		<!-- 검색어 -->
		<div class="search">
			<input type="hidden" id="dl_type" name="dl_type" value="${dlType}"> 
			<form method="post" name="frm">
				<input type="text" class="search-box" placeholder="지역명, 아파트명" name="searchName" id="loc" value="${searchName}" onkeypress="onKeypress();" > 
				<input type="hidden" id="buildings" name="building" value="${building}">
				<input type="hidden" id="dl_ty" name="dl_ty" value ="${dlType}"> 
				<input type="hidden" id="dl_excv_area" name="dl_excv_area"> 
				<input type="hidden" id="artcl_const_y" name="artcl_const_y"> 
				<input type="hidden" id="dl_price1" name="dl_price1"/>
				<input type="hidden" id="dl_price2" name="dl_price2"/>
				<input type="hidden" id="dl_rnt1" name="dl_rnt1"/>
				<input type="hidden" id="dl_rnt2" name="dl_rnt2"/> 
				<button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
			</form>
		</div>

		<!-- 필터 -->
		<div class="filters-div">
			<ul class="nav nav-tabs">
				<li id="cameraDiv">
					<form action="/main/searchCam" method="post" id="cam_form" enctype="multipart/form-data">
						<img  src="../img/pictures.png" id="camera" />
						<input type="hidden" id="search_cam" name="search_cam" />
						<input type="hidden" id="cam_buildings" name="building" value="${building}">
						<input type="hidden" id="cam_dl_ty" name="dl_ty" value ="${dlType}"> 
						<input type="hidden" id="cam_dl_excv_area" name="dl_excv_area"> 
						<input type="hidden" id="cam_artcl_const_y" name="artcl_const_y"> 
						<input type="hidden" id="cam_dl_price1" name="dl_price1"/>
						<input type="hidden" id="cam_dl_price2" name="dl_price2"/>
						<input type="hidden" id="cam_dl_rnt1" name="dl_rnt1"/>
						<input type="hidden" id="cam_dl_rnt2" name="dl_rnt2"/> 
						
						<input type="hidden" id="cam_submit" class="btn search_cam" value="사진검색"/>
					</form>
				</li>
				<c:if test="${building == 'house'}">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" id="houseType">주거형태</a>
						<div class="dropdown-menu">
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" class="custom-control-input houseSelector" id="single" name="house" value="single" /> 
									<label class="custom-control-label" for="single">&nbsp&nbsp단독</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" class="custom-control-input houseSelector" id="multi" name="house" value="multi" /> 
									<label class="custom-control-label" for="multi">&nbsp&nbsp다세대</label>
								</a>
							</div>
							
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" class="custom-control-input houseSelector" id="multip" name="house" value="multip"/> 
									<label class="custom-control-label" for="multip">&nbsp&nbsp연립</label>
								</a>
							</div>
							<div class="custom-control custom-checkbox">
								<a class="dropdown-item" href="#"> 
									<input type="radio" checked="checked" class="custom-control-input houseSelector" id="all" name="house" value="all" /> 
									<label class="custom-control-label" for="all">&nbsp&nbsp전체</label>
								</a>
							</div>
						</div>
					</li>
				</c:if>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false"><span id="buildT">전/월/매</span></a>
					<div class="dropdown-menu" id="dlType">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio"  class="custom-control-input dlSelector" id="jeonse" name="buildingType" value="전세"/> 
								<label class="custom-control-label" for="jeonse">&nbsp&nbsp전세</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio"  class="custom-control-input dlSelector" id="wolse" name="buildingType" value="월세"/> 
								<label class="custom-control-label" for="wolse">&nbsp&nbsp월세</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" checked="checked" class="custom-control-input dlSelector" id="maemae" name="buildingType" value="매매"/> 
								<label class="custom-control-label" for="maemae">&nbsp&nbsp매매</label>
							</a>
						</div>
					</div></li>
					<!-- 가격 수정 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">가격</a>
					<div class="dropdown-menu divHeight">
						<h4 id="priceTitle">매매가</h4>
						<div id="slider-price"></div>
						<input type="text" readonly="readonly" id="dlPrice">
						<hr>
						<div id="rnt">
						<h4>월세</h4>
						<div id="slider-rnt"></div>
						<input type="text" readonly="readonly" id="dlRnt">
						</div>
					</div>
					</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false" id="excv_area">평(형)수</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="tenArea" name="area" value="10"/> 
								<label class="custom-control-label" for="tenArea">&nbsp&nbsp10평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="secArea" name="area" value="20"/> 
								<label class="custom-control-label" for="secArea">&nbsp&nbsp20평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="thirArea" name="area" value="30"/> 
								<label class="custom-control-label" for="thirArea">&nbsp&nbsp30평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="fourArea" name="area" value="40"/> 
								<label class="custom-control-label" for="fourArea">&nbsp&nbsp40평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="fifArea" name="area" value="50"/> 
								<label class="custom-control-label" for="fifArea">&nbsp&nbsp50평대</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " id="sixArea" name="area" value="60"/> 
								<label class="custom-control-label" for="sixArea">&nbsp&nbsp60평 이상</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input areaSelector " checked="checked" id="allArea" name="area" value="0"/> 
								<label class="custom-control-label" for="allArea">&nbsp&nbsp전체</label>
							</a>
						</div>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false" id="const_y">준공년도</a>
					<div class="dropdown-menu">
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " id="fiveYear" name="year" value="5"/> 
								<label class="custom-control-label" for="fiveYear">&nbsp&nbsp5년 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " id="tenYear" name="year" value="10"/> 
								<label class="custom-control-label" for="tenYear">&nbsp&nbsp10년 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " id="fifYear" name="year" value="15"/> 
								<label class="custom-control-label" for="fifYear">&nbsp&nbsp15년 이하</label>
							</a>
						</div>
						<div class="custom-control custom-checkbox">
							<a class="dropdown-item" href="#"> 
								<input type="radio" class="custom-control-input yearSelector " checked="checked" id="ignore" name="year" value="all"/> 
								<label class="custom-control-label" for="ignore">&nbsp&nbsp무관</label>
							</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- 지도 -->
	<div id="mapWrap">
		<div id="map"></div>
		<div class="toLocal">
			<img src="/img/to_local.png" width="280" height="200"/>
		</div>
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
</div>

<!-- right contents -->
<!-- <div id="sensor">  -->
<div class="main-right">
	<!-- 매물리스트 들어가는 자리 -->
	
	<div id="lngLat">
		<input type="hidden" id="listSize" value="${buildingSaleListSize}" />
	</div>
<!-- 매물리스트  -->
	<div class="articles">
	<form action="/detail/info" id="frmDetail">
		<input type="hidden" id="artcl_gu" name="artcl_gu">
		<input type="hidden" id="artcl_dong" name="artcl_dong">
		<input type="hidden" id="artcl_zip" name="artcl_zip">
		<input type="hidden" id="artcl_rd" name="artcl_rd">
		<input type="hidden" id="ty" name="dl_ty" value ="${dlType}">
	</form>
		<c:choose>
			<c:when test="${buildingSaleListSize != 0}">
				<c:forEach items="${buildingSaleList}" var="build">
					<div class="article">
						<input type="hidden" class="lat" value="${build.artcl_lat}">
						<input type="hidden" class="lng" value="${build.artcl_lng}">
						<input type="hidden" id="gu" value="${build.artcl_gu}">
						<input type="hidden" id="dong" value="${build.artcl_dong}">
						<input type="hidden" id="zip" value="${build.artcl_zip}">
						<input type="hidden" id="rd" value="${build.artcl_rd}">
						<c:choose>
							<c:when test="${building == 'apt'}">
								<h4 class="clickDetail">${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${building == 'house'}">
								<c:choose>
									<c:when test="${build.artcl_bc == 'multi'}">
										<h4 class="clickDetail">${build.artcl_rd}</h4><span>다세대</span>
									</c:when>
									<c:when test="${build.artcl_bc == 'multip'}">
										<h4 class="clickDetail">${build.artcl_nm}</h4><span>연립</span>
									</c:when>
									<c:when test="${build.artcl_bc == 'single'}">
										<h4 class="clickDetail">${build.artcl_rd}</h4><span>단세대</span>
									</c:when>
								</c:choose>
								<br>
							</c:when>
							<c:when test="${building == 'office'}">
								<h4 class="clickDetail">${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${building == 'store'}">
								<h4 class="clickDetail">${build.artcl_rd}</h4>
							</c:when>
						</c:choose>
						<label class="address">대전광역시 ${build.artcl_gu} ${build.artcl_dong} ${build.artcl_rd} ${build.artcl_rd_detail}</label><br />
						<!-- 평균 시세는 근 3개월 간의 시세를 평균으로 낸다. -->
						<c:choose>
							<c:when test="${build.dl_ty == '매매' }">
								<label class="avg-price">평당 평균가&nbsp&nbsp${build.avg_dl}만원</label>
							</c:when>
							<c:when test="${build.dl_ty == '전세' }">
								<label class="avg-price">평균 전세가 &nbsp&nbsp${build.dl_depos}만원</label>
							</c:when>
							<c:when test="${build.dl_ty == '월세' }">
								<label class="avg-price">평균 보증금&nbsp ${build.dl_depos}만원 <br> 평균 월세가 &nbsp ${build.dl_rnt}만원</label>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
			검색 결과가 없습니다.(돋보기 그림 추가 + 글씨크기 키우고 색은 옅은 회색)
		</c:otherwise>
		</c:choose>
	</div>
	<!-- 지역분석 버튼 -->
	<!-- <div class="area-analysis">
		2
	</div> -->
	</div>
<!-- </div> 
 -->







<script>
	
	//마우스 커서
	$('#cameraDiv').hover(function(){
		this.style.cursor = 'pointer';
	});
	
	
	//이미지 클릭시 인풋 보이게..
	$('#camera').click(function(){
		
		var type = $('#search_cam').attr('type');
	
		if(type == 'hidden'){
			$('#search_cam').attr('type', 'file');
			$('#cam_submit').attr('type', 'submit');
		}else {
			$('#search_cam').attr('type', 'hidden');
			$('#cam_submit').attr('type', 'hidden');
		}
		
		
	});
	
	
	
	
	
		





		
	
</script>



















