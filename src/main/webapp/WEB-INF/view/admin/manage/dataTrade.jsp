<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<style type="text/css">
	
</style> 
    
<script>
	
	$(document).ready(function(){
		
		if(${insertArticleListResult} != null || ${insertDealListResult} != null){
			alert(${insertArticleListResult} + "건의 \n건물 정보를 업데이트 하였습니다.");
			alert(${insertDealListResult} + "건의 \n거래 정보를 업데이트 하였습니다.");
		}
		
	});
	

</script> 
    
<div class="admin-title">
	<h2>실거래 데이터</h2>
	<div class="hr2">
	</div>
	

	
	<a href="http://rtdown.molit.go.kr">국토 교통부 실거래 정보 다운로드페이지</a>
	<br/>
	<br/>
	
	<%-- 엑셀 데이터 입력용이므로 파일 전송 enctype 설정해주어야함 --%>
	<form action="/manage/dataTrade/insertData" method="post" enctype="multipart/form-data">
		
		데이터의 종류를 자동으로 구분합니다. 
		예외처리 안되어있음..
		<br/>
		<br/>
		<input type="file" name="tradeData" />
		<br/>
		<input type="submit" value="DB 저장" />
		
	</form>
	
		
	

</div>