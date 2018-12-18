//지도 함수 
function settingMap(){

	// 해당 주소에 대한 좌표값을 담을 변수
	var lat = document.getElementById('lat').value;
	var lng = document.getElementById('lng').value;

	// 해당 주소를 담을 값
	var addr;
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	//마커가 표시될 위치입니다 
	var markerPosition = new daum.maps.LatLng(lat, lng);
	//마커를 생성합니다
	var marker = new daum.maps.Marker({
		position : markerPosition
	});
	
	
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


				location.href="/local/local?gu="+gu+"&dong="+dong;
				
			}
		};

		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		
			
	});
}

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
		if($(this.nextElementSibling).is(':visible')){
			$(this.nextElementSibling).hide("slow");
		}else{
			$(this.nextElementSibling).show("slow");
		}
	});
}


//리뷰 별
$(function() {
    $('.starReview').raty({
        score: 3
        ,path : "/img"
        ,width : 200
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


settingMap();
reviewControl();


//최초 로딩시 ajax 호출
var defaultarea = document.getElementsByClassName('areatab')[0].innerHTML;
detailInfoAjax(defaultarea);


$('.area').on('click', '.areatab', function(){
	
	var area = this.innerHTML;
	detailInfoAjax(area);
	
});


$("#reviewWindow").hide();


//검은 막 띄우기
$(".openMask").click(function(e) {
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

