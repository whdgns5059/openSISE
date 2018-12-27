<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<div>
	
<div class="stationDiv">
</div>


</div>


<script>

	
	function getCenterLatLng(){
		
		
		var center = map.getCenter();
		
		var lat = center.getLat();
		var lng = center.getLng();
		
		getList(lat,lng);
		
	}
	
	function getList(lat, lng){
		
		$.ajax({
			
			type : 'POST',
			url : '/localStation/selectStationList',
			data : {
				sttn_lat : lat,
				sttn_lng : lng
			},
			success : function(data){
				setList(data);
			}
			
		});	
		
	}
	
	function setList(data){
		
		$('.stationDiv').html(data);
			
	}

	getCenterLatLng();

</script>