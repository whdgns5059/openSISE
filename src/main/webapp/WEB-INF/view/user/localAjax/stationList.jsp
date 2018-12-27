<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.table_container {margin-top: 40px; margin-left : 100px; width: 500px;}
	.bus_tp {width:100px;}
	.sttn_lat {display:none;}
	.sttn_lng {display:none;}

</style>
  
<div class="table_container">
	<table class="table table-hover table-stripe table-condensed">
		<thead>
			<tr>
				<td colspan="3" class="orange">
					<strong>버스 정보</strong>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr class="sttn_nm">
				<td colspan="2">
					<span class="sttn_nm_span">${stationList[0].sttn_nm}</span>
					<input type="hidden" class="sttn_id" value="${stationList[0].sttn_id }"/>
				</td>
				<td class="sttn_lat">${stationList[0].sttn_lat }</td>
				<td class="sttn_lng">${stationList[0].sttn_lng }</td>
			</tr>
			<tr class="${stationList[0].sttn_id}_detail detail">
				<td class="bus_tp">
					${stationList[0].bus_tp}
				</td>
				<td colspan="2">${stationList[0].bus_no}</td>
			</tr>
			<c:forEach items="${stationList }" var="sttn" begin="1" varStatus="s">
				<c:if test="${sttn.sttn_id != stationList[s.index-1].sttn_id}">
					<tr class="sttn_nm">
						<td colspan="2">
							<span class="sttn_nm_span">${sttn.sttn_nm }</span>
							<input type="hidden" class="sttn_id" value="${sttn.sttn_id }"/>
						</td>
						<td class="sttn_lat">${sttn.sttn_lat }</td>
						<td class="sttn_lng">${sttn.sttn_lng }</td>
					</tr>
				</c:if>
				<tr class="${sttn.sttn_id}_detail detail">
					<td class="bus_tp">${sttn.bus_tp}</td>
					<td colspan="2">${sttn.bus_no }</td>
				</tr>
			</c:forEach>
		</tbody>
	
	</table>

</div>


<script>
	
	
	$('.detail').hide();
	
	$('.sttn_nm').on('click', function(){
		
		console.log('버스 클릭!');
		
		var sttn_id = this.getElementsByClassName('sttn_id')[0].value;
		var class_nm = '.' + sttn_id + '_detail';
		$(class_nm).toggle('slow');
		
		var lat = this.getElementsByClassName('sttn_lat')[0].innerHTML;
		var lng = this.getElementsByClassName('sttn_lng')[0].innerHTML;
		panTo(lat, lng);
		
	});
	
	daum.maps.event.addListener(map, 'dragend', function(){
		
		delMarkers();
		getCenterLatLng();	
		
	});
	
	
	function panTo(lat, lng){
		
		var moveLocation = new daum.maps.LatLng(lat, lng);
		
		map.panTo(moveLocation);
	}
	
	var markers = [];
	
	//lat, lng 의 배열
	function settingMarker(){

		console.log("마커!");
		
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
		
			markers.push(marker);
				
			
		}
		
	}
	
	
	//마커지우기
	function delMarkers(){
		for(var i = 0 ; i < markers.length ; i++){
			markers[i].setMap(null);
		}
	}
	
	
	
	settingMarker();
		
	
	

</script>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	