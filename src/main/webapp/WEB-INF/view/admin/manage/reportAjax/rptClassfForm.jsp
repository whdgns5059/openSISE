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
    padding: 12px 10px;
    margin-bottom: 15px;
    width: 560px;
    height: 345px;
    border: 1px solid #d8d8d8;
    border-radius: 12px 0 0 12px;
    overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
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
.classf_rVo{
    padding: 5px 0;
    width: 100%;
    height: 40px;
    display: flex;
}
.lastVo{
	padding-top: 7px;
    background: #ffe8bc;
    border-radius: 12px;
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
#classfAdd, .classfUpdate, .classfDel{
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
	width: 45px;
}
.hr2{
	width: 100%;
	margin: 0 auto;
	padding: 0;
}
</style>
<script type="text/javascript">

// 리스트 뿌리기
function rpt_cfList(){
	$.ajax({
		type : 'GET',
		url : '/manage/rpt_cfVoList',
		success : function(data){
			var html = "";
			
			for(var i = 0; i<data.rpt_cfVoList.length ; i++){
				html += '<div class="classf_rVo">';
				html += '<input type="hidden" value="'+data.rpt_cfVoList[i].rpt_classf+'"/>';
				html += '<input type="text" class="inputBox no" value="'+(i+1) +'"/>';
				html += '<input type="text" class="inputBox nm" value="'+data.rpt_cfVoList[i].rpt_cf_nm+'"/>';
				html += '<button class="classfUpdate">수정</button>';
				html += '<button class="classfDel">삭제</button>';
				html += '</div>';
			}
			// html에 적용
			$('#rpt_cfList').html(html);
		}
	});
};

// 먼저 리스트 뿌리는 함수 실행
rpt_cfList();

$(document).ready(function(){
	
	/* 신고 분류 추가하기 */
	$('#classfAdd').on('click',function(){
		var rpt_cf_nm = document.getElementById('rpt_cf_nm').value;
		var data = {rpt_cf_nm : rpt_cf_nm};
		
		$.ajax({
			type : 'POST',
			url : '/manage/insertAjax',
			data : data,
			success : function(data){
				if(data.insertCnt < 1){
					// insert 실패
					alert("insert 실패");
				}else{
					// 리스트 다시 뿌리기
					rpt_cfList();
					document.getElementById('rpt_cf_nm').value = '';
				}
			}
		});
	});
	/* 신고 분류 수정하기 */
	$('#rpt_cfList').on('click','.classfUpdate',function(){
		
		var rpt_classf = this.parentNode.childNodes[0].value;
		var rpt_cf_nm = this.parentNode.childNodes[2].value;
		var data = {rpt_classf : rpt_classf, rpt_cf_nm : rpt_cf_nm};
		
		$.ajax({
			type : 'POST',
			url : '/manage/updateAjax',
			data : data,
			success : function(data){
				if(data.updateCnt < 1){
					// update 실패
					alert("update 실패");
				}else{
					// 리스트 다시 뿌리기
					rpt_cfList();
				}
			}
		});
	});

	/* 신고 분류 삭제하기 */
	$('#rpt_cfList').on('click','.classfDel',function(){
		
		var rpt_classf = this.parentNode.childNodes[0].value;
		var data = {rpt_classf : rpt_classf};
		
		$.ajax({
			type : 'GET',
			url : '/manage/deleteAjax',
			data : data,
			success : function(data){
				if(data.deleteCnt < 1){
					// delete 실패
					alert("delete 실패");
				}else{
					// 리스트 다시 뿌리기
					rpt_cfList();
				}
			}
		});
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
	<!-- RUD 나열/수정/삭제 -->
	<div class="classf_r" id="rpt_cfList">
		
	</div>
	<!-- C 추가 -->
	<div class="classf_rVo lastVo">
		<input type="text" class="inputBox no backYellow" value=" " disabled />
		<input type="text" id="rpt_cf_nm" class="inputBox" name="rpt_cf_nm"/>
		<button id="classfAdd">추가</button>
	</div>

</div>

</body>
</html>

