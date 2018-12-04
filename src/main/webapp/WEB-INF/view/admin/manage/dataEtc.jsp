<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	
	.dataEtc { width : 1500px; height: 900px;}
	
</style> 
    
<div class="dataEtc">
	
	<br/>
	<br/>
	<h2>데이터 업데이트(기타)</h2>
	<hr/>
	
	<br/>
	<form action="/manage/dataEtc/insertDataEtc" method="post" enctype="multipart/form-data">
	<table border="1" style="width:800px;">
		<thead>
			<tr>
				<th>데이터명</th>
				<th>링크주소</th>
				<th>파일</th>
				<th>DB저장</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>인구통계</td>
				<td><a href="http://www.daejeon.go.kr/sta/StaStatisticsFldList.do?menuSeq=180&colmn1Cont=C0201&colmn2Cont=C020101">대전인구통계</a></td>
				<td><input type="file" name="etcData" /></td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
			<tr>
				<td>대전 교통정보</td>
				<td><a href="ttps://www.data.go.kr/dataset/3034841/openapi.do">대전 교통정보</a></td>
				<td><input type="file" name="stationData" /></td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
			
		</tbody>
	</table>
	</form>

</div>