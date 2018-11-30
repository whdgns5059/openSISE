<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<style type="text/css">
	
	.dataTradeDiv { width : 1500px; height: 900px;}
	
</style> 
    
<div class="dataTradeDiv">
	
	<br/>
	<br/>
	<br/>
	
	<a href="http://rtdown.molit.go.kr">국토 교통부 실거래 정보 다운로드페이지</a>
	<br/>
	<br/>
	
	<%-- 엑셀 데이터 입력용이므로 파일 전송 enctype 설정해주어야함 --%>
	<form action="#" method="post">
		
		데이터 타입 선택 : 
		<select name="dataType">
			<option value="AT">아파트 매매</option>
			<option value="RT">연립다세대 매매</option>
			<option value="ST">단독/다가구 매매</option>
			<option value="OT">오피스텔 매매</option>
			<option value="AR">아파트 전월세</option>
			<option value="RR">연립다세대 전월세</option>
			<option value="SR">단독/다가구 전월세</option>
			<option value="OR">오피스텔 전월세</option>
			<option value="NT">상업/업무용</option>
		</select>	
		<br/>
		<br/>
		<input type="file" name="tradeData" />
		<br/>
		<input type="submit" value="DB 저장" />
		
	</form>
	
		
	

</div>