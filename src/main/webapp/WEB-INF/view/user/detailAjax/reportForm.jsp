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
	min-height: 780px;
}
.report_container {
	width:460px; 
	margin-top:20px; 
	margin-left:20px; 
	height:780px;
	z-Index: 9;
}
h4{
	font-family: 'Noto Sans KR', sans-serif;
    font-size: 25px;
	font-weight: 600;
}
.rpt_post{
	width: 460px;
	height: 28px;
}
.rpt_post_no{
	display: block;
	border: none;
	background: white;
    width: 22px;
    height: 28px;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
	font-weight: 400;
    float: left;
}
.rpt_post_noLabel{
	width: 70px;
    height: 28px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 400;
	line-height: 30px;
	color: #808080;
}
.selBox{
    width: 122px;
    height: 28px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    float: right;
    cursor: pointer;
}
.lbl{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
	color: #808080;
}
.btnClass{
	text-align: center;
	margin-top: 40px;
}
.btnY{
	width: 100px;
	background: white;
	margin-right: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
}
.btnN{
	width: 100px;
	background: white;
	margin-left: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
}
.warning{
	margin-top: 60px;
	width: 438px;
	height: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
	font-weight: 300;
	line-height: 22px;
	letter-spacing: 0px;
	color: #808080;
}
/* 모달창 */
#modal {
    display: none;
    width: 400px;
    height: 250px;
    background-color: #FFFFFF;
    position: absolute;
    margin: 0 auto;
    top: 230px;
    left: 48px;
    z-Index: 11;
    border-radius: 25px;
}
.modalTop{
    width: 100%;
    height: 41px;
    background: #f1ebe0;
    border-top-left-radius: 25px;
    border-top-right-radius: 25px;
}
.modalCont{
    width: 100%;
    height: 200px;
    padding-top: 10px;
    color: black;
    text-align: center;
}
.modalCont h3{
	padding-top: 11px;
}
.modalCont p{
	padding-top: 31px;
}
#modalOk{
    width: 58px;
    height: 32px;
    margin-top: 11px;
    border: 1px solid #d8d8d8;
    background: #f5f3f0;
    border-radius: 4px;
    font-size: 13px;
    cursor: pointer;
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
					  	<option value="" selected disabled hidden>신고분류</option>
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
			<label class="lbl">사유</label>
			<textarea class="form-control" id="rpt_cntnt" name="rpt_cntnt" rows="10"></textarea>
		</div>		
		<div class="btnClass">
			<input type="button" class="btn btnY" id="rpt_ok" value="확인"/>
			<input type="button" class="btn btnN" id="cancel" value="취소"/>
		</div>	
	</form>
	<div class="warning">
		<p>
			<b>신고 사유를 정확히 기재해 주셔야 신고접수가 완료됩니다.</b><br/><br/>
			※주의: 일부 조직적 신고나 거짓 신고는 고객의 서비스 이용에 제한을 줄 수 있으니 신중을 기해주시길 바라며, 
			명확한 사실을 기반으로 신고 해 주시길 부탁드립니다.
		</p>
	</div>
	<hr/>
</div>	
	<!-- 모달창 -->
	<div id="mask"></div>	
	<div id="modal">
		<div class="modalTop"></div>
		<div class="modalCont">
			<h3 class="warnTtl"></h3>
			<p class="warnCont"></p>
			<button id="modalOk">확인</button>
		</div>
	</div>
</body>
</html>



<script type="text/javascript">
/* 모달창 */
function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
	
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
	 
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeTo("fast", 0.6);    
	 
    //모달창을 띄운다.
    $("#modal").show();
};

	$('#cancel').on('click', function(){
		window.close();
	});

	
	$('#rpt_ok').on('click', function(){

		var rpt_post = $('#rpt_post').val();
		var rpt_ttl = $('#rpt_ttl').val();
		var rpt_classf = $('#selBox').val();

		if(rpt_ttl == '' || rpt_ttl == null){
			//검은 막 띄우기
			wrapWindowByMask();
			$('.warnTtl').html('제목 미입력');
			$('.warnCont').html('제목을 입력해 주세요.');
			//닫기 버튼을 눌렀을 때
	    	$("#modalOk").on("click", function(){
				$("#mask, #modal").hide();
	    	});
	    	rpt_ttl.focus();
			return;
		}
		
		var rpt_cntnt = $('#rpt_cntnt').val();
		
		if(rpt_cntnt == '' || rpt_cntnt == null){
			//검은 막 띄우기
			wrapWindowByMask();
			$('.warnTtl').html('내용 미입력');
			$('.warnCont').html('내용을 입력해 주세요.');
			//닫기 버튼을 눌렀을 때
	    	$("#modalOk").on("click", function(){
				$("#mask, #modal").hide();
	    	});
			return;
		}
		
		if(rpt_classf == '' || rpt_classf == null){
			//검은 막 띄우기
			wrapWindowByMask();
			$('.warnTtl').html('신고분류 미선택');
			$('.warnCont').html('신고분류를 선택해 주세요.');
			//닫기 버튼을 눌렀을 때
	    	$("#modalOk").on("click", function(){
				$("#mask, #modal").hide();
	    	});
			return;
		}
	
		var data = {
				rpt_post : rpt_post,
				rpt_ttl : rpt_ttl,
				rpt_cntnt : rpt_cntnt,
				rpt_classf : rpt_classf
		}
		
		
		$.ajax({
			
			type : 'POST',
			url : '/detail/reportInsert',
			data : data,
			success : function(data){
				if(data == '1' || data == 1){
					//검은 막 띄우기
					wrapWindowByMask();
					$('.warnTtl').html('완료');
					$('.warnCont').html('신고되었습니다.');
					//닫기 버튼을 눌렀을 때
			    	$("#modalOk").on("click", function(){
						window.close();
			    	});
				}else {
					//검은 막 띄우기
					wrapWindowByMask();
					$('.warnTtl').html('에러발생');
					$('.warnCont').html('다시 입력해 주세요.');
					//닫기 버튼을 눌렀을 때
			    	$("#modalOk").on("click", function(){
						$("#mask, #modal").hide();
			    	});
				}
			}
			
		});
		
	});
	
	
</script>