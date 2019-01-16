

//지도 함수 

	// 해당 주소에 대한 좌표값을 담을 변수
	var lat = document.getElementById('lat').value;
	var lng = document.getElementById('lng').value;

	// 해당 주소를 담을 값
	var addr;
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		level : 2
	// 지도의 확대 레벨
	};
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	//마커가 표시될 위치입니다 
	var markerPosition = new daum.maps.LatLng(lat, lng);

	//마커를 생성합니다
	//마커이미지 주소
	var imageSrc = '/img/placePicker.png',
	 imageSize = new daum.maps.Size(34, 50),
	 imageOption = {offset : new daum.maps.Point(17, 63)};

	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	var marker = new daum.maps.Marker({
		position : markerPosition,
		image : markerImage
	});
	
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	//주소 좌표 변환 객체
	var geocoder = new daum.maps.services.Geocoder();

	
	//toLocal 클릭시 좌표읽어서 이동
	$('.toLocal').on('click', function(){
		
		var geocoder = new daum.maps.services.Geocoder();

		var center = map.getCenter();

		var coord = new daum.maps.LatLng(center.getLat(), center.getLng());
		var callback = function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				
				var gu = result[0].address.region_2depth_name;
				var dong = result[0].address.region_3depth_name;
				var artcl_dong = $("#artcl_dong").val();
				var artcl_gu = $("#artcl_gu").val();
				var artcl_rd = $("#artcl_rd").val();
				var artcl_zip = $("#artcl_zip").val();
				var dl_ty = $("#dl_ty").val();
				var searchName = $("#loc").val();
				var building = $("#buildingss").val();
				
				console.log(building);
				console.log(searchName);
				console.log(dl_ty);

				location.href="/local/local?gu="+gu+"&dong="+dong+"&searchName="+searchName+"&dl_ty="+ dl_ty+"&building="+building;
				
			}
		};

		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		
			
	});

function detailInfoAjax(area){
	
	var artcl_gu = document.getElementById('artcl_gu').value;
	var artcl_dong = document.getElementById('artcl_dong').value;
	var artcl_zip = document.getElementById('artcl_zip').value;
	var artcl_rd = document.getElementById('artcl_rd').value;
	var dl_ty = document.getElementById('dl_ty').value;
	var dl_excv_area = area;
	
	var ajaxData = {
		artcl_gu : artcl_gu,
		artcl_dong : artcl_dong,
		artcl_zip	: artcl_zip,
		artcl_rd : artcl_rd,
		dl_ty : dl_ty,
		dl_excv_area : dl_excv_area
	}	
	
	$.ajax({
		type : 'POST',
		url : '/detail/tradeInfoAjax',
		data : ajaxData,
		success : function(data){
			$('.chartajax').html(data);
		}	
		
	});
}


//리뷰 컨트롤 
function reviewControl(){
	$('.reviewDetailWrapper').hide();
	
	$('.titleWrapper').on('click',  function(){
		
		var post = this.nextElementSibling.getElementsByClassName('reply')[0];
		var photo = this.nextElementSibling.getElementsByClassName('photo')[0];
		
		if($(this.nextElementSibling).is(':visible')){
			$(this.nextElementSibling).hide("slow");
		}else{
			$(this.nextElementSibling).show("slow");
			
			var post_no = this.getElementsByClassName('reviewNo')[0].innerHTML;
			var post_data = {post_no}
			
			$.ajax({
				type : 'POST',
				url : '/detail/selectReplyAjax',
				data : post_data,
				success : function(data){
					replySuccess(data);
				}
			});
			
			$.ajax({
				type: 'POST',
				url : '/detail/selectReviewPic',
				data : post_data,
				success : function(data){
					picSuccess(data);
				}
			});
			
			//성공후 post에 데이터를 넣는 함수
			function replySuccess(data){
				$(post).html(data);
			}
			
			//사진가져오기 성공후 데이터 넣기
			function picSuccess(data){
				$(photo).html(data);
			}
			
		}
	});
}



//리뷰 글작성 별
$(function() {
    $('#star').raty({
        score: 3
        ,path : "/img"
        ,width : 600
        ,click: function(score, evt) {
            $("#starRating").val(score);
            $("#displayStarRating").html(score);
        }
    });
});


//모달 페이지
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
   	$('.reviewWindow').show();

}

function setRadarChart(){
	
	var dealVo = {
		dl_gu : document.getElementById('artcl_gu').value,
		dl_dong : document.getElementById('artcl_dong').value,
		dl_zip : document.getElementById('artcl_zip').value,
		dl_rd : document.getElementById('artcl_rd').value,
		dl_ty : document.getElementById('dl_ty').value
	}
	console.log('here!');
	
	$.ajax({
		type : 'POST',
		url : '/detail/selectStat',
		data : dealVo,
		success : function(data){
			$('#radarChartDiv').html(data);
		}
		
		
	});
	
}

//최초 로딩시 ajax 호출
var defaultarea = document.getElementsByClassName('selVal')[0].value;

detailInfoAjax(defaultarea);
setRadarChart();
reviewControl();
setHeart();




$('.area').on('click', '.areatab', function(){
	
	var area = this.getElementsByClassName('selVal')[0].value
	detailInfoAjax(area);
	
});


$("#reviewWindow").hide();

//mask  띄우기!
//검은 막 띄우기
$(".openMask").click(function(e) {
	
	var mem_no = $('#mem_no').val();
	
	if(mem_no == "" || mem_no == null){
		alert("로그인을 먼저 해주세요");
		return;
	}
	
	e.preventDefault();
	wrapWindowByMask();
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


//리뷰 작성
$('#insertReview').click(function(event){
	
	var post_ttl = document.getElementById('post_ttl');

	if(post_ttl.value == null || post_ttl.value == ''){
		alert("제목을 입력해 주세요");
		return;
	}
	
	var post_contnt = document.getElementById('post_contnt');
	
	if(post_contnt.value == null || post_contnt.value == ''){
		alert("내용을 입력해 주세요");
		return;
	}
	
	var fileInput = document.getElementsByClassName('post_img');

	var extFlag = true;

	if(fileInput[0].value != ""){
		
		for(var i = 0; i < fileInput.length; i++) {
			
			var file_path = fileInput[i].value;
			var dot_index = file_path.lastIndexOf('.');
			var ext = file_path.substr(dot_index).toLowerCase();
			
			if(!(ext == '.jpg' || ext == '.bmp' || ext == '.png' || ext == '.gif')){
				alert('jpg, bmp, png, gif 이미지만 업로드 가능합니다');
				return;
			}
		}
	}
	
	$('#reviewFrm').submit();	
		
		
	
});


//리뷰 작성시 파일 첨부 갯수 변화
$('.plusfile').on('click', function(){
	
	var post_img = $('.post_img');
	
	
	if(post_img.length == 3){
		alert('이미지는 최대 3장까지 입니다.');
		return;
	}
	
	var nowlength = post_img.length;
	var nextlength = nowlength + 1;
	
	$('.inputDiv').append('<input type="file" class="post_img" name="post_img" id="post_img'+nextlength+'" />');
	
	
})

//리뷰 작성시 파일 첨부 갯수 변화
$('.minusfile').on('click', function(){
	
	var post_img = document.getElementsByClassName('post_img');
	
	
	if(post_img.length == 1){
		alert('이미지는 최소 1장 입니다.');
		return;
	}
	
	var nowlength = post_img.length;
	var nextlength = nowlength + 1;
	
	$('#post_img'+nowlength).remove();
	
	
})



function getPost_no(rpl_post){
	
	var post_noArr = $('.post_noChk');
	
	for(var i = 0; i < post_noArr.length; i++){
		if(post_noArr[i].value == rpl_post){
			return post_noArr[i];
		}
	}
	
}

//댓글 작성
$('.writeReply').on('click', '.insertReply', function(){
 
	var mem_no = $('#mem_no').val();
	
	if(mem_no == "" || mem_no == null){
		alert("로그인을 먼저 해주세요");
		return;
	}
	
	
	
	var rpl_cntnt = this.previousElementSibling.getElementsByClassName('replyInput')[0].value;
	var rpl_post= this.previousElementSibling.getElementsByClassName('post_no')[0].value;
	
	if(rpl_cntnt == null || rpl_cntnt == ''){
		alert('댓글 내용을 입력해 주세요');
		return;
	}
	
	$.ajax({
		
		type:'POST',
		url : '/detail/insertReply',
		data : {
			rpl_cntnt : rpl_cntnt,
			rpl_post : rpl_post
		},
		success : function(data){
			var post_no = getPost_no(rpl_post);
			$(post_no.nextElementSibling).html(data);
		}
	});
	
	
	//리뷰 클래스중에서 포스트와같은 div 가져오기
	//리플이 담겨야 하는 div 위에 chk용 postID가 존재..
	function getPost_no_insert(){
		
		var post_noArr = $('.post_noChk');
		
		for(var i = 0; i < post_noArr.length; i++){
			if(post_noArr[i].value == rpl_post){
				return post_noArr[i];
			}
		}
		
	}
	
	
});



//댓글 삭제
$('.reply').on('click', '.deleteReply',  function(e){
	
	e.preventDefault();
	
	var rpl_no = this.getElementsByClassName('rpl_no')[0].value;
	var rpl_post = this.getElementsByClassName('rpl_post')[0].value;

	$.ajax({
		
		type : 'POST',
		url : '/detail/deleteReply',
		data : {
			rpl_no : rpl_no,
			rpl_post : rpl_post
		},
		success : function(data){
			var post_no = getPost_no(rpl_post);
			$(post_no.nextElementSibling).html(data);	
		}
		
	});
	
	//리뷰 클래스중에서 포스트와같은 div 가져오기
	//리플이 담겨야 하는 div 위에 chk용 postID가 존재..

	
	
});


//리뷰 삭제
$('.deleteReview').on('click', function(){
	
	var post_no = this.getElementsByClassName('post_no')[0].value;
	var dl_ty = this.getElementsByClassName('dl_ty')[0].value;
	location.href = '/detail/deleteReview?post_no='+post_no+'&dl_ty='+dl_ty;
	
});

//찜하기 하트 상태
function setHeart(){
	
	var favor_no = $('#favor_no').val();
	
	if(favor_no != ""){
		$('.heartimg').attr({ src : "/img/heart.png"});
	}else{
		$('.heartimg').attr({ src : "/img/heart-outline.png"});
	}
	
}



//클릭시 상태에 따라서 인서트/딜리트
$('.like').on('click', '.heartimg', function(){
	
	var img_src = this.getAttribute('src');
	
	if(img_src == "/img/heart-outline.png"){
	
		var favor_mem  = document.getElementById('mem_no').value;
		var favor_gu   = document.getElementById('artcl_gu').value;
		var favor_dong = document.getElementById('artcl_dong').value;
		var favor_zip  = document.getElementById('artcl_zip').value;
		var favor_rd   = document.getElementById('artcl_rd').value;
		var favor_ty   = document.getElementById('dl_ty').value;
		
		if(favor_mem == ""){
			alert("로그인을 하셔야 합니다");
			return;
		}
		
		var favorVo = {
			favor_mem  : favor_mem,
			favor_gu   : favor_gu,
			favor_dong : favor_dong,
			favor_zip  : favor_zip,
			favor_rd   : favor_rd,
			favor_ty   : favor_ty
		}
	
		$.ajax({
			type : 'POST',
			url : '/detail/insertFavor',
			data : favorVo,
			success: function(){ }
		});
		alert("찜목록에 넣었습니다");
		$('.heartimg').attr({ src : "/img/heart.png"});
		
		var num = document.getElementById('favorCount').innerHTML;
		var plusNum = parseInt(num) + 1;
		$('#favorCount').html(plusNum + '명이 해당 매물을 찜 했습니다.');
		
		
	}else {
		
		var favor_no = document.getElementById('favor_no').value;
		
		$.ajax({
			type : 'POST',
			url : '/detail/deleteFavor',
			data : {
				favor_no : favor_no
			},
			success : function(){ }
		});
		alert("찜목록에서 제거하였습니다");
		$(this).attr({ src : "/img/heart-outline.png"});
		
		var num = document.getElementById('favorCount').innerHTML;
		var minusNum = parseInt(num) -1;
		$('#favorCount').html(minusNum + '명이 해당 매물을 찜 했습니다.');
		
	}
	
	
	
});



//리뷰 별점

var starReview = document.getElementsByClassName('starReview');
setReviewStar(starReview);

function setReviewStar(starReview){
	
	for(var i = 0;  i < starReview.length ; i++){
		
		$(starReview[i]).raty({
			score : starReview[i].nextElementSibling.getElementsByClassName('reviewStarInput')[0].value
			,path : "/img"
			,width : "50%"
			,height : 45
			,readOnly: true
		});
		
	}
	
	
}

$('.reportDiv').hover(function(){
	this.style.cursor = 'pointer';
});

/* REPORT 신고 */
$('.reportDiv').on('click', function(e){
	
	var mem_no = $('#mem_no').val();
	
	if(mem_no == "" || mem_no == null){
		alert("로그인을 먼저 해주세요");
		return;
	}
	
	var rpt_post = this.getElementsByClassName('rpt_post')[0].value;
	
	//TODO : 신고기능 추가..
	//어떻게 추가해야하지....??????????
	//팝업을 이용하면 될듯 ? 
	 var newWindow = window.open("/detail/reportForm?rpt_post="+rpt_post, "new window", "width=500, height=800");
	
});


//리뷰 수정

$('.updateReview').on('click', function(){
	
	
	var post_no = this.getElementsByClassName('post_no')[0].value;
	
	var newWindow = window.open("/detail/updateReviewForm?post_no="+post_no, "new window", "width=600, height=800, location=no");
	
	var timer = setInterval(checkPopup, 500);
	
	function checkPopup(){
		
		if(newWindow.closed){
			
			clearInterval(timer);
			location.reload();
			
		}
		
		
	}
	

	
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














































