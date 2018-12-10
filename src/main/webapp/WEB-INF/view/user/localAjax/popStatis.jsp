<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

setContentByAjax('totalPop');


$('.middleCategory').on('click', 'button', function(){
	
	setContentByAjax(this.id);
	
});

//차트 설정
setChart();
	
function setContentByAjax(id){
	
	$.ajax({
		type : 'POST',
		url : '/local/'+id,
		success : function(data){
			$('.content').html(data);
		}
		
		
	});	
	
}

function setChart(){
	
	var tradeChartData = {
			type: 'line',  
			title: { text: '인구통계'  },
			legend: {}, // Creates an interactive legend
			series: [  // Insert your series data here
				  { values: [28, 40, 39, 36, 12, 3, 32, 2, 12, 12, 32] }
			 	 ]
			
			
			};
			zingchart.render({ // Render Method[3]
			  id: 'myChart',
			  data: tradeChartData,
			});
	
}

	
</script>



<div class="middleCategory">
	<button id="totalPop">전체 인구 통계</button>
	<button id="genderPop">성별 인구 통계</button>
	<button id="agePop">연령별 인구 통계</button>
</div>
<div class="content"></div>