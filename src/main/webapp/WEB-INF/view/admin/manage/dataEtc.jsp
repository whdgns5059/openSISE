<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	

</style> 
    
<div class="admin-title">
	
	<h2>데이터 업데이트(기타)</h2>
	<div class="hr2">
	</div>
	
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
		</tbody>
	</table>
	</form>
	
	<form action="/manage/dataEtc/insertStationData" method="post" enctype="multipart/form-data">
	<table border="1" style="width:800px;">
		<tbody>
			<tr>
				<td>교통정보</td>
				<td>
					<a href="https://www.data.go.kr/subMain.jsp#/L3B1YnIvdXNlL3ByaS9Jcm9zT3BlbkFwaURldGFpbC9vcGVuQXBpTGlzdFBhZ2UkQF4wMTJtMSRAXnB1YmxpY0RhdGFQaz0zMDM0ODQyJEBeYnJtQ2Q9T0MwMDExJEBecmVxdWVzdENvdW50PTE1NCRAXm9yZ0luZGV4PU9QRU5BUEk=">
					대전교통정보</a>
				</td>
				<td><input type="file" name="stationData" /></td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
		</tbody>
	</table>
	</form>
	
	<form action="/manage/dataEtc/insertMarketData" method="post" enctype="multipart/form-data">
	<table border="1" style="width:800px;">
		<tbody>
			<tr>
				<td>물가정보</td>
				<td><a href="http://www.daejeon.go.kr/drh/board/boardNormalList.do?boardId=normal_1009&menuSeq=3306">대전물가정보</a></td>
				<td><input type="file" name="marketData" /></td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
		</tbody>
	</table>
	</form>

</div>