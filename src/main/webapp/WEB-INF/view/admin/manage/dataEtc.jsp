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
/* 	width: 80px; */
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
    margin-bottom: 20px;
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
		var fName= "";
		var marketname="";
		
		var success = $("#success").val();
		
		$("#humanClick").click(function(){
			fName =$('input[name=etcData]').val();
			if(fName=="" ){
				alert("파일을 선택해주세요");
			}
			$("#Hsfile").val(fName);
			
		});
		
		
		$("#marketClick").click(function(){
			marketname = $('input[name=marketData]').val();
			if(marketname==""){
				alert("파일을 선택해주세요");
			}
		});
		
		if(success == '0'){
			alert("중복된 데이터 입니다.");
		}else if(success ==''){
			
		}else{
			alert(success + "건의 \n정보를 업데이트 하였습니다.");
		}
		
		
		$("#station").click(function(){
			if(confirm("저장하시겠습니까?")==true){
				$("#stations").submit();
			};
		})
		
		var insti_nm="";
		
		$("#insti_nm").on("change",function(){
			var iattr_insti = $("#insti_nm option:selected").val();
			insti_nm = $("#insti_nm option:selected").text();
// 			alert("시설ID:"+iattr_insti)
		$(".here").val(iattr_insti);
// 		alert("here값 : " +$(".here").val());
		$("#instiNo").val(iattr_insti);
		});
		
		$("#del").click(function(){
			$("#delInsti").submit();
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


	});
	


</script>
 
<div class="admin-title">
	
	<h2>데이터 업데이트(기타)</h2>
	<div class="hr2">
	</div>
	
	<input type="hidden" id="success" value="${param.success }">
	
	<div class="data-updateDiv">
		<form action="/manage/dataEtc/insertDataEtc" method="post" enctype="multipart/form-data">
		<table class="data-updateT">
			<tr>
				<td>인구통계&nbsp:</td>
				<td><a target="_blank" href="http://www.daejeon.go.kr/sta/StaStatisticsFldList.do?menuSeq=180&colmn1Cont=C0201&colmn2Cont=C020101">대전인구통계 홈페이지</a></td>
				<td class="dataEtcFile" id="Hsfile"><input type="file" name="etcData" id="human" /></td>
				<td><input type="submit" value="DB 저장" class="dataEtcB" id="humanClick"/></td>
			</tr>
		</table>
		</form>
		
		<form id="stations" action="/manage/dataEtc/insertStationData" method="post" enctype="multipart/form-data">
		<table class="data-updateT">
			<tr>
				<td>교통정보&nbsp:</td>
				<td>
					<a target="_blank" href="https://www.data.go.kr/subMain.jsp#/L3B1YnIvdXNlL3ByaS9Jcm9zT3BlbkFwaURldGFpbC9vcGVuQXBpTGlzdFBhZ2UkQF4wMTJtMSRAXnB1YmxpY0RhdGFQaz0zMDM0ODQyJEBeYnJtQ2Q9T0MwMDExJEBecmVxdWVzdENvdW50PTE1NCRAXm9yZ0luZGV4PU9QRU5BUEk=">
					대전교통정보 홈페이지</a>
				</td>
				<td>openAPI 호출</td>
				<td><input type="button" value="DB 저장" class="dataEtcB" id="station"/></td>
			</tr>
		</table>
		</form>
		
		<form action="/manage/dataEtc/insertMarketData" method="post" enctype="multipart/form-data">
		<table  class="data-updateT">
			<tr>
				<td>물가정보&nbsp:</td>
				<td><a target="_blank" href="http://www.daejeon.go.kr/drh/board/boardNormalList.do?boardId=normal_1009&menuSeq=3306">대전물가정보 홈페이지</a></td>
				<td class="dataEtcFile"><input type="file" name="marketData" /></td>
				<td><input type="submit" value="DB 저장" class="dataEtcB" id="marketClick"/></td>
			</tr>
		</table>
		</form>
	</div>

	<div class="instiDiv">
		<!-- 시설추가 -->
		<br/>
		<label>시설 추가하기</label>
<!-- 		<form id="delInsti" name="delInsti"> -->
<!-- 			<div style="float: right;margin-right: 130px;margin-top: 25px;"> -->
<!-- 				<input type="hidden" id="checked" name="checked" value=""/> -->
<%-- 				<input class="here" type="hidden" name="instiHere" value="${iattr_insti }" > --%>
<!-- 				<button type="button" id="del" name="del" class="dataEtcbtn">삭제</button> -->
<!-- 			</div> -->
<!-- 		</form> -->
		<div class="insti dataEtcf">
			<form id="frm" name="frm" action="/manage/dataEtc/selectInsti" method="post" style="display: inline;">
				시설목록 :  <select id="insti_nm" class="selBox" name="instiNm" style="width: 200px;">
							<option>분류</option>
							
						<c:forEach items="${instiList }" var="instiVo" varStatus="status">
							<option value="${instiVo.insti_no}" >${instiVo.insti_nm}</option>
						</c:forEach>
						
					  </select>
					  <input class="here" type="hidden" name="instiHere" value="" >
			</form>
			<form id="delInsti" name="delInsti" action="/manage/dataEtc/deletInstiAttr" method="post" style="display: inline;">
					<input  id="instiNo" type="hidden" name="insti_no" value="" >
					<button type="button" id="del" name="del" class="dataEtcbtn">삭제</button>
			</form>
			<div style="width: auto;">
				<form  action="/manage/dataEtc/insertInsti" method="post">
					새시설명 : &nbsp<input type="text" class="inputbox" name="insti" placeholder="예:도서관"><button type="submit" class="dataEtcbtn">추가</button>
				</form>
			</div>
			
		</div>
	</div>


</div>