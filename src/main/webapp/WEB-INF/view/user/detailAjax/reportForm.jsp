<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<style type="text/css">
body{
	min-width: 460px;
	min-height: 600px;
}
.report_container {width:460px; margin-top:20px; margin-left:20px; height:600px;}
h4{
	font-family: 'Noto Sans KR', sans-serif;
    font-size: 25px;
	font-weight: 600;
}
.rpt_post{
	width: 460px;
}
.rpt_post_no{
	display: block;
	border: none;
	background: white;
    width: 22px;
    height: 19px;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
	font-weight: 400;
    float: left;
}
.rpt_post_noLabel{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 400;
	color: #808080;
}
.selBox{
	width: 100px;
    height: 25px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
}
.lbl{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
	color: #808080;
}
.btnClass{
	text-align: center;
}
.btnY{
	background: white;
	margin-right: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
}
.btnN{
	background: white;
	margin-left: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
}
</style>



</head>
<body>


	
<div class="report_container">
	<div>
		<h4>신고</h4>
		<hr/>
	</div>	
	<form action="/detail/reportInsert" method="post" id="rpt_frm">
		<div class="form-horizontal">
			<div class="form-group rpt_post">
				<input type="text" class="rpt_post_no" id="rpt_post" name="rpt_post" value="${rpt_post }" readonly="readonly"/>
				<label for="rpt_post" class="rpt_post_noLabel">번 게시글</label>
				<select id="selBox" class="selBox" >
					  	<option value="allCf" selected>신고분류</option>
						<c:forEach items="${rpt_cfList }" var="classf">
					  		<option value="${classf.rpt_classf }">${classf.rpt_cf_nm }</option>
						</c:forEach>
					</select>	
			</div>
		</div>
		<div class="form-group">
			<label class="lbl">제목</label>
			<input type="text" class="form-control" id="rpt_ttl" name="rpt_ttl"/>
			<br/>
			<label class="lbl">내용</label>
			<textarea class="form-control" id="rpt_cntnt" name="rpt_cntnt" rows="10"></textarea>
		</div>		
		<div class="btnClass">
			<input type="button" class="btn btnY" id="rpt_ok" value="확인"/>
			<input type="button" class="btn btnN" id="cancel" value="취소"/>
		</div>	
	</form>
</div>	
</body>
</html>



<script type="text/javascript">
	
	$('#cancel').on('click', function(){
		window.close();
	});

	
	$('#rpt_ok').on('click', function(){

		var rpt_post = $('#rpt_post').val();
		var rpt_ttl = $('#rpt_ttl').val();

		if(rpt_ttl == '' || rpt_ttl == null){
			alert('제목을 입력하세요');
			return;
		}
		
		var rpt_cntnt = $('#rpt_cntnt').val();
		
		if(rpt_cntnt == '' || rpt_cntnt == null){
			alert('내용을 입력하세요');
			return;
		}
	
		var data = {
				rpt_post : rpt_post,
				rpt_ttl : rpt_ttl,
				rpt_cntnt : rpt_cntnt
		}
		
		
		$.ajax({
			
			type : 'POST',
			url : '/detail/reportInsert',
			data : data,
			success : function(data){
				if(data == '1' || data == 1){
					alert("신고 되었습니다.");
					window.close();
				}else {
					alert("에러발생, 다시 입력해 주세요");
				}
			}
			
		});
		
	});
	
	
</script>