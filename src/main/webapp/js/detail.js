

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
	 imageOption = {offset : new daum.maps.Point(27, 100)};

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
	
	var brIndex = area.indexOf('<br>')
	
	var dl_excv_area = area.substr(0, brIndex);
	
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
var defaultarea = document.getElementsByClassName('areatab')[0].innerHTML;

settingMap();
detailInfoAjax(defaultarea);
setRadarChart();
reviewControl();
setHeart();




$('.area').on('click', '.areatab', function(){
	
	var area = this.innerHTML;
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

	for(var i = 0; i < fileInput.length; i++) {
		
		var file_path = fileInput[i].value;
		var dot_index = file_path.lastIndexOf('.');
		var ext = file_path.substr(dot_index).toLowerCase();
		
		if(!(ext == '.jpg' || ext == '.bmp' || ext == '.png' || ext == '.gif')){
			alert('jpg, bmp, png, gif 이미지만 업로드 가능합니다');
			return;
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
		$('#favorCount').html(plusNum);
		
		
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
		$('#favorCount').html(minusNum);
		
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
			,width : 400
			,readOnly: true
		});
		
	}
	
	
}

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



















































