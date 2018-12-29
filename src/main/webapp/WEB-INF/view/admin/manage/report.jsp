<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<style>
#rptCfBtn{
	width: 150px;
	background: white;
	margin-right: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	/* 신고분류 관리 */
	$('#rptCfBtn').on('click',function(){
		window.open("/manage/rptClassfForm", "new window", "width=600, height=550");
		
	});
	
});
</script>
    
<div class="admin-title">
	<h2>신고관리</h2>
	<div class="hr2">
	</div>
	
	<div>
		<button class="btn" id="rptCfBtn">신고 분류 관리</button>
	</div>
	<div>
		<table>
			
		</table>
	</div>
	
	
</div>