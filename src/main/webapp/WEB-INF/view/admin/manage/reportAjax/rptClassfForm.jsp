<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고분류 관리</title>
<style>
body{
	min-width: 600px;
	min-height: 550px;
}
.rptClassf_wrap{
	width: 600px;
	height: 550px;
	padding: 20px;
}
h3{
	padding-left: 10px;
}
.classf_c{
	width: 560px;
	height: 30px;
}
.classf_r{
    padding: 5px 10px;
    width: 560px;
    height: 400px;
    border: 1px solid #d8d8d8;
    border-radius: 12px;
}
.classf_rVo{
    padding: 5px 0;
    width: 100%;
    height: 40px;
    display: flex;
    overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
}
.classf_rVo:nth-child(1){
	padding-top: 7px;
    background: #ffe8bc;
    border-radius: 12px;
}
::-webkit-scrollbar {
	width: 16px;
}

::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background-color: #ffae24;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #4159a9;
}
.classf_rTtl{
    margin-top: 30px;
	padding-left: 10px;
	width: 560px;
	height: 30	px;
	line-height: 30px;
}
.bTag:nth-child(1){
	margin-left: 5px;
}
.bTag:nth-child(2){
	margin-left: 15px;
	
}
.bTag{
	width: 40px;
    height: 25px;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
    color: #808080;
}
#classfAdd, #classfUpdate, #classfDel{
    margin-left: 10px;
	width: 50px;
    height: 25px;
    cursor: pointer;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 12px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
}
#classfAdd{
    background: white;
}
.inputBox{
	padding-left: 5px;
	width: 350px;
    height: 25px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	font-family: 'Noto Sans KR', sans-serif;
}
.no{
	width: 35px;
	border: none;
}
.backYellow{
	background-color: #ffe8bc;
}
.hr2{
	width: 100%;
	margin: 0 auto;
	padding: 0;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	/* 신고 분류 추가하기 */
	$('#classfAdd').on('click',function(){
		
		var rpt_cf_nm = $('#rpt_cf_nm').value;
		var data = {rpt_cf_nm : rpt_cf_nm};
		
		$.ajax({
			type : 'POST',
			url : '/manage/insertAjax',
			data : data,
			success : function(data){
				if(data < 1){
					// insert 실패
					alert("insert 실패");
				}else{
				// 리스트 다시 뿌리기
					
				}
			}
		});
	});
	
	/* 신고 분류 삭제하기 */
	$('#classfDel').on('click',function(){
		
		var rpt_cf_nm = "";
		<%--var ageData = {rpt_cf_nm : rpt_cf_nm};
		
		$.ajax({
			type : 'POST',
			url : '/statis/intrstAgeAjax',
			data : ageData,
			success : function(data){
				// 연령별 관심사 그래프
				$('#intrstAgeG').html(data);
			}
		});--%>
	});
	
});
</script>
</head>
<body>

<div class="rptClassf_wrap">
	<h3>신고분류 관리</h3>
	<hr/>
	<div class="classf_rTtl">
		<b class="bTag no">no.</b>
		<b class="bTag nm mrgn-l">신고분류명</b>
	</div>
	<div class="classf_r">
		<!-- C 추가 -->
		<div class="classf_rVo">
			<input type="text" class="inputBox no backYellow" value=" "/>
			<input type="text" id="rpt_cf_nm" class="inputBox" name="rpt_cf_nm"/>
			<button id="classfAdd">추가</button>
		</div>
		<br/>
		<!-- RUD 나열/수정/삭제 -->
		<c:forEach items="${rpt_cfVoList }" var="vo">
			<div class="classf_rVo">
				<input type="text" class="inputBox no" value="${vo.rpt_classf }"/>
				<input type="text" class="inputBox nm" value="${vo.rpt_cf_nm }"/>
				<button id="classfUpdate">수정</button>
				<button id="classfDel">삭제</button>
			</div>
		</c:forEach>
	</div>

</div>

</body>
</html>

