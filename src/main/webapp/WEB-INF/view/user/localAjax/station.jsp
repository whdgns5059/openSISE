<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<div>

<h4>교통 정보</h4>	
<div class="stationDiv">
</div>


</div>


<script>

	map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);    
	
	console.log("station here!");

	
	
	function getCenterLatLng(){
		
		
		var center = map.getCenter();
		
		var lat = center.getLat();
		var lng = center.getLng();
		
		getList(lat,lng);
		
	}
	
	
	function getList(lat, lng){
		
		var ajaxFlag = true;
		
		if(ajaxFlag == true){

			ajaxFlag = false;	
			
			$.ajax({
				
				type : 'POST',
				url : '/localStation/selectStationList',
				data : {
					sttn_lat : lat,
					sttn_lng : lng
				},
				success : function(data){
					setList(data);
					$('.detail').hide();
					settingMarker();
				},
				complete : function(){
					setAjaxFlagTrue();	
				}
				
			});	
			
		}
		
		function setAjaxFlagTrue(){
			ajaxFlag = true;
		}
		
	}
	
	function setList(data){


		$('.stationDiv').html("");	
		$('.stationDiv').html(data);
			
	}
	
	
	//주소 중앙 좌표 가져오기
	getCenterLatLng();

	
	//정류장 tr 클릭시 아래 데이터 표시
	$('.stationDiv').on('click', '.sttn_nm',function(){
		
		
		var sttn_id = this.getElementsByClassName('sttn_id')[0].value;
		var class_nm = '.' + sttn_id + '_detail';
		$(class_nm).toggle('slow');
		
		var lat = this.getElementsByClassName('sttn_lat')[0].innerHTML;
		var lng = this.getElementsByClassName('sttn_lng')[0].innerHTML;
		
		panTo(lat, lng);
		
	});

	//지도 중앙 위치 변경 이벤트 리스너
	daum.maps.event.addListener(map, 'dragend', function(){
		
		
		getCenterLatLng();	
						
		settingMarker();
		
		
		
	});
	
	//부드럽게 이동
	function panTo(lat, lng){
		
		var moveLocation = new daum.maps.LatLng(lat, lng);
		
		map.panTo(moveLocation);
	}
	
	
	
	//lat, lng 의 배열
	function settingMarker(){

		
		var latArr = document.getElementsByClassName('sttn_lat');
		var lngArr = document.getElementsByClassName('sttn_lng');
		var marker_titles = document.getElementsByClassName('sttn_nm_span');
		
		//지도에 마커 찍기
		for(var i = 0 ; i < latArr.length ; i++){
			
			var marker = new daum.maps.Marker({
				map : map,
				position : new daum.maps.LatLng(latArr[i].innerText, lngArr[i].innerText),
				title : marker_titles[i].innerText
			});		
		
				
			
		}
		
	}
	
	settingMarker();
	

	
</script>