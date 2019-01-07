<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.dataEtcB{
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
.dataEtcf{
	padding: 0;
	width: 800px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
}
.dataEtcbtn{
	width: 60px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
    cursor: pointer;
    margin-bottom: 10px;
    margin-left:5px;
}
.selBox {
	margin-right: 10px;
	width: 100px;
	height: 30px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
}
.inputbox{
	margin-right: 10px;
	margin-top: 10px;
	width: 200px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
}
.data-updateDiv{
	width: 100%;
	height: 120px;
}
.instiDiv{
	width: 100%;
    height: 550px;
    margin-top: 10px;
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
}
#instiT{
	padding: 12px 10px;
    width: 560px;
    height: 345px;
    border: 1px solid #d8d8d8;
    border-radius: 12px ;
    overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
}
.info tr td{
	border-top : 1px solid #ccc;
}
</style>    
<script type="text/javascript">
	$(document).ready(function(){

		$(".dataEtcB").click(function(){
			if($(".dataEtcFile").val()==""){
				alert("파일을 선택해주세요");
			}
		});
		
		var insti_nm="";
		
		$("#insti_nm").on("change",function(){
			var iattr_insti = $("#insti_nm option:selected").val();
			insti_nm = $("#insti_nm option:selected").text();
// 			alert("시설ID:"+iattr_insti)
		$(".here").val(iattr_insti);
// 		alert("here값 : " +$(".here").val());
		$("#frm").submit();
		});
		
		$("#tbody tr").on("click",function(){
			if($( this ).css( "background-color") != "rgb(244, 244, 244)"){
				 $( this ).css( "background-color", "#f4f4f4" ); 
				 $( this).children("td").css( "cursor", "pointer" ); 
				 $(this).siblings().css("background-color", "white");
				var tr = $(this);
				var td = $(this).children()[2].textContent;
//	 			alert(td);
				$("#iattr_pare").val(td);
			}else{
				$( this ).css( "background-color", "#ffffff" ); 
				 $( this).children("td").css( "cursor", "pointer" ); 
				 $(this).siblings().css("background-color", "white");
				var tr = $(this);
				var td = $(this).children()[2].textContent;
//	 			alert(td);
				$("#iattr_pare").val("");
			}
			
			
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

	    //삭제버튼 클릭시
	    $("#del").click(function(){
// 	    	alert("del");
	    	var checkList = "";
	    	$("input[name=chk]:checked").each(function() { 
	    		if(checkList == ""){

	    			checkList = $(this).parent().siblings().eq(1).text();
	    			} else {
	    				checkList = checkList + "," + $(this).parent().siblings().eq(1).text();
	    			}
	    	});
	    	$("#checked").val(checkList);
	    	
	    	//iattr_no or iattr_pare값 저장
			var param = $("form[name=delInsti]").serialize();
	    	
	    	$.ajax({
				type : "POST",
				url : "/manage/dataEtc/deletInstiAttr",
				data : param,
				success : function(data){
					var html = data;
					$("#tbody").html(html);
				}
			
			});
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
				<td class="dataEtcFile"><input type="file" name="etcData" /></td>
				<td><input type="submit" value="DB 저장" class="dataEtcB"/></td>
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
				<td><input type="submit" value="DB 저장" class="dataEtcB"/></td>
			</tr>
		</table>
		</form>
		
		<form action="/manage/dataEtc/insertMarketData" method="post" enctype="multipart/form-data">
		<table  class="data-updateT">
			<tr>
				<td>물가정보&nbsp:</td>
				<td><a target="_blank" href="http://www.daejeon.go.kr/drh/board/boardNormalList.do?boardId=normal_1009&menuSeq=3306">대전물가정보 홈페이지</a></td>
				<td class="dataEtcFile"><input type="file" name="marketData" /></td>
				<td><input type="submit" value="DB 저장" class="dataEtcB"/></td>
			</tr>
		</table>
		</form>
	</div>

	<div class="instiDiv">
		<!-- 시설추가 -->
		<br/>
		<label>시설 추가하기</label>
		<form id="delInsti" name="delInsti">
			<div style="float: right;margin-right: 130px;margin-top: 25px;">
				<input type="hidden" id="checked" name="checked" value=""/>
				<input class="here" type="hidden" name="instiHere" value="${iattr_insti }" >
				<button type="button" id="del" name="del" class="dataEtcbtn">삭제</button>
			</div>
		</form>
		<div class="insti dataEtcf">
			<form id="frm" name="frm" action="/manage/dataEtc/selectInsti" method="post">
				시설명  : &nbsp <select id="insti_nm" class="selBox" name="instiNm">
							<option>분류</option>
							
						<c:forEach items="${instiList }" var="instiVo" varStatus="status">
							<option value="${instiVo.insti_no}" >${instiVo.insti_nm}</option>
						</c:forEach>
						
					  </select>
					  <input class="here" type="hidden" name="instiHere" value="" >
			</form>
			<form action="/manage/dataEtc/insertInsti" method="post">
				시설명추가 : &nbsp<input type="text" class="inputbox" name="insti" placeholder="예:도서관"><button type="submit" class="dataEtcbtn">추가</button>
			</form>
		</div>
		<form action="/manage/dataEtc/insertIattr" method="post">
			<div id="insti">
				<div id="instiT" style="overflow: auto;width:800px;height:350px;">
					<table class="table info" >
						<thead>
							<tr>
								<td><input type="checkbox" id="checkAll"/></td>
								<!-- 중복제거한 컬럼명 -->
								<c:forEach items="${insti_attrList }" var="instiAttrVo" varStatus="status">
									<td>${instiAttrVo.iattr_key }</td>
								</c:forEach>
							</tr>
						</thead>
						<tbody id="tbody">
								<c:if test="${instiAttrList !=null }">
									<!-- 값을 가져오는 반복문 -->
									<c:forEach items="${instiAttrList }" var="instiAttr_List" varStatus="status">
										<c:choose>
											<c:when test="${instiAttrList[status.index].groupno != instiAttrList[status.index-1].groupno}">
												<tr>
													<td><input type="checkbox"  name="chk" value="${instiAttr_List.groupno }" class="instiattr"/></td>
													<td>${instiAttr_List.iattr_val}</td>
													<td style="display: none;">${instiAttr_List.iattr_no }</td>
													<td style="display: none;">${instiAttr_List.iattr_pare }</td>
											</c:when>
											<c:when test="${instiAttrList[status.index].groupno == instiAttrList[status.index-1].groupno}">
												<c:if test="${instiAttrList[status.index].groupno == instiAttrList[status.index+1].groupno}">
													<td>${instiAttr_List.iattr_val}</td>
													<td style="display: none;">${instiAttr_List.iattr_no }</td>
													<td style="display: none;">${instiAttr_List.iattr_pare }</td>
												</c:if>
												<c:if test="${instiAttrList[status.index].groupno != instiAttrList[status.index+1].groupno}">
													<td>${instiAttr_List.iattr_val}</td>
													<td style="display: none;">${instiAttr_List.iattr_no }</td>
													<td style="display: none;">${instiAttr_List.iattr_pare }</td>
												</tr>
												</c:if>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:if>
						</tbody>
					</table>
				</div>
				<br/>
				<div class="insti dataEtcf" >
					속성명 : &nbsp <input type="text" name="iattr_key" class="inputbox" placeholder="예: 도서관이름">
					속성값 : &nbsp <input type="text" name="iattr_val" class="inputbox" placeholder="예: 유성도서관">
					<input type="hidden" id="iattr_pare" value="0" name="iattr_pare"/>
					<c:choose>
						<c:when test="${iattr_insti==null }">
							<input type="hidden" value="0" name="iattr_insti"/>
						</c:when>
						<c:when test="${iattr_insti!=null }">
							<input type="hidden" value="${iattr_insti }" name="iattr_insti"/>
						</c:when>
					</c:choose>
					<button class="dataEtcbtn">입력</button>
				</div>
			</div>
			
		</form>
	</div>


</div>