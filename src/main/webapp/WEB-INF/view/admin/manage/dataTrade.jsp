<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<style type="text/css">
.databtn{
	width: 80px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
    cursor: pointer;
    float:right;
}
</style> 
    
<script>
	
	$(document).ready(function(){
		
		if(${param.arResult} != null || ${param.dlResult} != null){
			alert(${param.arResult} + "건의 \n건물 정보를 업데이트 하였습니다.");
			alert(${param.dlResult} + "건의 \n거래 정보를 업데이트 하였습니다.");
		}
		
	});
	

</script> 
    
<div class="admin-title">
	<h2>실거래 데이터</h2>
	<div class="hr2">
	</div>
	
	
	
	<h1><a target="_blank" href="http://rtdown.molit.go.kr">국토 교통부 실거래 정보 다운로드페이지</a></h1>
	<br/>
	<br/>
	
	<%-- 엑셀 데이터 입력용이므로 파일 전송 enctype 설정해주어야함 --%>
	<form action="/manage/dataTrade/insertData" method="post" enctype="multipart/form-data">
		
		<label>업로드 할 파일을 선택 하세요</label>
		<br/>
		<input type="file" name="tradeData" />
		<input type="submit" class="databtn" value="저장" />
		
	</form>
	
	

</div>