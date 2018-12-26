<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<style type="text/css">
	.report_container {width:460px; margin-top:20px; margin-left:20px;}
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
			<div class="form-group">
				<label for="rpt_post">신고 게시글 번호</label>	
				<input type="text" class="form-control" id="rpt_post" name="rpt_post" value="${rpt_post }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" id="rpt_ttl" name="rpt_ttl"/>
			<br/>
			<label>내용</label>
			<textarea class="form-control" id="rpt_cntnt" name="rpt_cntnt" rows="10"></textarea>
		</div>		
		<div>
			<input type="button" class="btn" id="rpt_ok" value="확인"/>
			<input type="button" class="btn" id="cancel" value="취소"/>
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