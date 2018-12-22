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
</style>
<div class="middleCategory">
	<ul class="nav nav-tabs tab-yellow">
			<li class="nav-item"><a class="nav-link tab-yellow show" data-toggle="tab" href="#signDaily">전체 인구 통계</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#signMonthly">성별 인구 통계</a></li>
			<li class="nav-item"><a class="nav-link tab-yellow" data-toggle="tab" href="#signAgeGndr">연령별 인구 통계</a></li>
	</ul>
</div>
<div class="content">

</div>