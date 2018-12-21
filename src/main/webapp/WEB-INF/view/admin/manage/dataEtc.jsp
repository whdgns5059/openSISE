<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.data-updateDiv{
	width: 100%;
	height: 120px;
}
.instiDiv{
	width: 100%;
    height: 550px;
    margin-top: 30px;
}
.data-updateT{
	padding: 0;
	width: 800px;
	height: 40px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
}
.data-updateT a{
	font-style: italic;
}
.data-updateT tr td{
	padding: 0;
}
.data-updateT tr :nth-child(1){
	width: 80px;
}
.data-updateT tr :nth-child(2){
    width: 176px;
    font-size: 13px;
}
.data-updateT tr :nth-child(3){
	width: 450px;
}
label{
    color: #969696;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 18px;
    font-weight: 400;
}

/* input[type="file" i] {
	width: 400px;
} */
#insti {
/* 		border:1px solid red; */
		width: 800px;
		height:450px;
	}
	.insti {
		width: 700px;
		margin-bottom: 10px;
	}
	#instiT{
		border:1px solid black; 
		width:800px;
		height:400px;
	}
	.info tr td{
		border : 1px solid #ccc;
	}
</style>    
<script type="text/javascript">
	$(document).ready(function(){

		$("#insti_nm").on("change",function(){
			var iattr_insti = $("#insti_nm option:selected").val();
			alert(iattr_insti)
// 			alert($("#test").text());
		$("#here").val(iattr_insti);
		$("#frm").submit();
		});
		
		$("#tbody tr").on("click",function(){
			var tr = $(this);
			var td = $(tr.children()[1]).text();
// 			alert(td.text());
			$("#iattr_pare").val(td);
		});
		
		 //최상단 체크박스 클릭
	    $("#checkAll").click(function(){
	        //클릭되었으면
	        if($("#checkAll").prop("checked")){
	            //class가 instiattr인 태그들을 찾아서 checked옵션을 true로 정의
// 	            $("input[name=chk]").prop("checked",true);
	            $(".instiattr").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $(".instiattr").prop("checked",false);
	        }
	    })

	    
	    $("#del").click(function(){
	    	var checkList = "";
	    	$("input[name=chk]:checked").each(function() { 
	    		if(checkList == ""){

	    			checkList = $(this).val();
	    			} else {
	    				checkList = checkList + "," + $(this).val();
	    			}
	    	});
	    	$("#checked").val(checkList);
	    	$("#delInsti").submit();
	   });

	});
</script>
 
<div class="admin-title">
	
	<h2>데이터 업데이트(기타)</h2>
	<div class="hr2">
	</div>
	
	<div class="data-updateDiv">
		<form action="/manage/dataEtc/insertDataEtc" method="post" enctype="multipart/form-data">
		<table class="data-updateT">
			<tr>
				<td>인구통계&nbsp:</td>
				<td><a target="_blank" href="http://www.daejeon.go.kr/sta/StaStatisticsFldList.do?menuSeq=180&colmn1Cont=C0201&colmn2Cont=C020101">대전인구통계 홈페이지</a></td>
				<td><input type="file" name="etcData" /></td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
		</table>
		</form>
		
		<form action="/manage/dataEtc/insertStationData" method="post" enctype="multipart/form-data">
		<table class="data-updateT">
			<tr>
				<td>교통정보&nbsp:</td>
				<td>
					<a target="_blank" href="https://www.data.go.kr/subMain.jsp#/L3B1YnIvdXNlL3ByaS9Jcm9zT3BlbkFwaURldGFpbC9vcGVuQXBpTGlzdFBhZ2UkQF4wMTJtMSRAXnB1YmxpY0RhdGFQaz0zMDM0ODQyJEBeYnJtQ2Q9T0MwMDExJEBecmVxdWVzdENvdW50PTE1NCRAXm9yZ0luZGV4PU9QRU5BUEk=">
					대전교통정보 홈페이지</a>
				</td>
				<td>openAPI 호출</td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
		</table>
		</form>
		
		<form action="/manage/dataEtc/insertMarketData" method="post" enctype="multipart/form-data">
		<table  class="data-updateT">
			<tr>
				<td>물가정보&nbsp:</td>
				<td><a target="_blank" href="http://www.daejeon.go.kr/drh/board/boardNormalList.do?boardId=normal_1009&menuSeq=3306">대전물가정보 홈페이지</a></td>
				<td><input type="file" name="marketData" /></td>
				<td><input type="submit" value="DB 저장" /></td>
			</tr>
		</table>
		</form>
	</div>

	<div class="instiDiv">
		<!-- 시설추가 -->
		<br/>
		<label>시설 추가하기</label>
		<form id="delInsti" action="/manage/dataEtc/deletInstiAttr" method="post">
			<div style="float: right;margin-right: 130px;margin-top: 25px;">
				<input type="text" id="checked" name="checked" value=""/>
				<input id="here" type="hidden" name="instiHere" value="" >
				<button type="button" id="del" name="del">삭제</button>
			</div>
		</form>
		<div class="insti">
			<form id="frm" name="frm" action="/manage/dataEtc/selectInsti" method="post">
				시설명 : <select id="insti_nm" name="instiNm">
							<option>분류</option>
							
						<c:forEach items="${instiList }" var="instiVo" varStatus="status">
							<option value="${instiVo.insti_no}" >${instiVo.insti_nm}</option>
						</c:forEach>
						
					  </select>
					  <input id="here" type="text" name="instiHere" value="" >
			</form>
			<form action="/manage/dataEtc/insertInsti" method="post">
				시설명추가 : <input type="text" name="insti" placeholder="예:도서관"><button type="submit">추가</button>
			</form>
		</div>
		<form action="/manage/dataEtc/insertIattr" method="post">
			<div id="insti">
				<div id="instiT" style="overflow: auto;width:800px;height:350px;">
					<table class="info">
						<thead>
							<tr>
								<td>번호<input type="checkbox" id="checkAll"/></td>
								<!-- 중복제거한 컬럼명 -->
								<c:forEach items="${insti_attrList }" var="instiAttrVo" varStatus="status">
									<td>${instiAttrVo.iattr_key }</td>
								</c:forEach>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<c:if test="${instiAttrList !=null }">
									<!-- 값을 가져오는 반복문 -->
									<c:forEach items="${instiAttrList }" var="instiAttrListList" varStatus="status">
									<tr>
										<td><input type="checkbox"  name="chk" value="${instiAttrListList[0].iattr_no }" class="instiattr"/>&nbsp;${status.count }</td>
										<td style="display: none;">${instiAttrListList[0].iattr_no }</td>
<%-- 										<c:set var="loop_flag" value="false" /> --%>
<%-- 										<c:forEach items="${instiAttrListList }" var="instiAttrVo2" varStatus="statusAt"> --%>
											<!-- 중복제거한 컬럼명 -->
													<c:forEach items="${insti_attrList }" var="instiAttrVo" varStatus="status">
<%-- 														<c:if test="${fn:trim(instiAttrVo2.iattr_key) == instiAttrVo.iattr_key}"> --%>
<%-- 																<c:set var="loop_flag" value="true" /> --%>
																<td>${instiAttrVo2.iattr_key} == ${instiAttrVo.iattr_key} / ${instiAttrVo2.iattr_val}</td>
<%-- 														</c:if> --%>
													</c:forEach>
													
													<%--컬럼 메타 데이터에 일치하는 속성명이 없는 시설물 속성 공백 출력 --%>
<%-- 													<c:if test="${not loop_flag }"> --%>
<!-- 														<td>&nbsp;</td> -->
<%-- 													</c:if> --%>
													
<%-- 													<c:set var="loop_flag" value="false" /> --%>
										</c:forEach>
									</tr>
<%-- 									</c:forEach> --%>
								</c:if>
							</tr>
						</tbody>
					</table>
				</div>
				<br/>
				<div class="insti">
					속성명 : <input type="text" name="iattr_key" placeholder="예: 도서관이름">
					속성값 : <input type="text" name="iattr_val" placeholder="예: 유성도서관">
					<input type="hidden" id="iattr_pare" value="0" name="iattr_pare"/>
					<input type="hidden" value="${iattr_insti }" name="iattr_insti"/>
					<button>입력</button>
				</div>
			</div>
			
		</form>
	</div>


</div>