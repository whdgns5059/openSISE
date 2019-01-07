<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<style>
#insertNotice{
	padding: 12px 10px;
    width: 800px;
    height: 500px;
    border: 1px solid #d8d8d8;
    border-radius: 12px ;
    overflow: scroll;
	overflow-x: hidden;
	overflow-y: auto;
}
.inputbox{
	margin: 10px;
	width: 500px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
}
.noticefont{
	padding: 0;
	width: 800px;
	height: 40px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
}
.noticeB{
	width: 80px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
    cursor: pointer;
    margin-top:10px;
}
</style>
<script src="/SE2/js/HuskyEZCreator.js"></script>

<script type="text/javascript">
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

	$(document).ready(function(){
		
		// Editor Setting
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors, // 전역변수 명과 동일해야 함.
			elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
			sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, 
			}
		});

		var index = 1;
		
		

		// 전송버튼 클릭이벤트
		$("#savebutton").click(function(){
			if(confirm("저장하시겠습니까?")){
				// id가 smarteditor인 textarea에 에디터에서 대입
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	
				// 이부분에 에디터 validation 검증
				if(validation()) {
					$("#insert").submit();
				}
				
			}
		})

   
	});
	
	//필수값 Check
	function validation(){
		var contents = $.trim(oEditors[0].getContents());
		
		if($("#titlecheck").val()==""){
			alert("제목을 입력하세요.");
			$("#titlecheck").focus();
			return false;
		}else if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}

		return true;
	}
	
</script>
   
<div class="admin-title">
	<h2>공지사항 새글 작성</h2>
	<div class="hr2">
	</div>
	<div>
		<form action="/manage/notice/insertPost" id="insert" method="post">
			<table id="insertNotice" class="noticefont">
				<thead>
					<tr>
						<td colspan="1"> &nbsp &nbsp &nbsp 제목</td>
						<td colspan="2"><input type="text" name="post_ttl" id="titlecheck" class="inputbox"></td>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td colspan="3" style="padding-left:15px;">
								<textarea name="POST_CNTNT" id="smarteditor" rows="10"
										cols="100" style="width: 766px; height: 412px;"></textarea>
							</td>
						</tr>
				</tbody>
			</table>
		</form>
		<div>
			<button type="button" id="savebutton" class="noticeB">등록</button>
		</div>
	</div>
	
	
</div>