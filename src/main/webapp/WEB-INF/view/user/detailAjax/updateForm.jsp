<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>

<script type="text/javascript" src="/js/jquery.raty.js"></script>
<style type="text/css">
	.update_container {width : 560px; margin-top:20px; margin-left:20px;}
	.img_div { padding-left:20px !important; padding-bottom:15px;}
	.review_img {width: 300px; height:auto; display:block;}
	a {color: #FF4136 }
</style>
</head>
<body>

	<div class="update_container">
		<div>
			<h2> 리뷰수정</h2>
			<hr/>
		</div>
		<form id="reviewFrm" action="/detail/updateReview" method="post" enctype="multipart/form-data">
			<div> 
				<input type="hidden" name="post_no" value="${postVo.post_no }"/>
			</div>
			<div class="form-group">
				<label>제목</label>
				<input type="text" class="form-control" name="post_ttl" id="post_ttl" value="${postVo.post_ttl }">
			</div>	
			<div>
				<c:forEach items="${picList }" var="pVo">
					<div class="img_div">
						<div class="imgwrap">
							<img src="${pVo.pic_file_path }"/ class="review_img">
							<a href="#" class="del_a"><strong>x</strong></a>
							<input type="hidden" class="pic_no" value="${pVo.pic_no }"/>
						</div>
					</div>
				</c:forEach>	
			</div>
			<br/>
			<div class="form-group">
				<textarea class="form-control" rows="10"  id="post_contnt" name="post_cntnt"  >${postVo.post_cntnt }</textarea>
			</div>
			<div>
				<label>파일 첨부</label>
				<input type="button" class="plusfile" value="+"/>
				<input type="button" class="minusfile" value="-"/>
				<div class="inputDiv">
				</div>
			</div>
			<div class="row">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰 별점 &nbsp;&nbsp;&nbsp;</label>
				<div id="star" ></div>
					<input type="hidden" id="starRating" name="post_star" value="3"/>
					<hr/>
			</div>
			<div>
				<input type="button" class="btn" id="insertReview" value="수정" />
				<input type="button" class="btn close" id="cancelReview" class="close" value="취소" />
			</div>
		</form>
	</div>



</body>

<script type="text/javascript">

//리뷰 글작성 별
$(function() {
    $('#star').raty({
        score: ${postVo.post_star}
        ,path : "/img"
        ,width : 600
        ,click: function(score, evt) {
            $("#starRating").val(score);
            $("#displayStarRating").html(score);
        }
    });
});


$('.del_a').on('click', function(e){
	
	var pic_no = this.nextElementSibling.value;
	var imgwrap = $(this).parent();
	
	$.ajax({
		
		type : "POST",
		url : "/detail/deletePic",
		data : {
			pic_no : pic_no
		},
		success : function(data){
			if(data == "1" || data == 1){
				remove_pic_div();	
			}else{
				alert("오류 발생 다시 시도해 주세요");
			}
		}
		
		
	});
	
	function remove_pic_div(){
		$(imgwrap).html('');
	}

	e.preventDefault();
	
});


$('.plusfile').on('click', function(){

	var file_count = document.getElementsByClassName('review_img').length;
	var input_count = document.getElementsByClassName('post_img').length;
	
	file_count += input_count;
	
	if(file_count == 3){
		alert("최대 파일 개수는 3을 넘을 수 없습니다");
		return;	
	}
	
	var  nextlength = file_count + 1;
	
	$('.inputDiv').append('<input type="file" class="post_img" name="post_img" id="post_img'+nextlength+'" />');
		
	
});

$('.minusfile').on('click', function(){

		
	var file_count = document.getElementsByClassName('review_img').length;
	var input_count = document.getElementsByClassName('post_img').length;
	
	file_count += input_count;
	
	$('#post_img'+file_count).remove();
	
});


//리뷰 작성
$('#insertReview').click(function(event){
	
	var post_ttl = document.getElementById('post_ttl');

	if(post_ttl.value == null || post_ttl.value == ''){
		alert("제목을 입력해 주세요");
		return;
	}
	
	var post_contnt = document.getElementById('post_contnt');
	
	if(post_contnt.value == null || post_contnt.value == ''){
		alert("내용을 입력해 주세요");
		return;
	}
	
	var fileInput = document.getElementsByClassName('post_img');

	for(var i = 0; i < fileInput.length; i++) {
		
		var file_path = fileInput[i].value;
		var dot_index = file_path.lastIndexOf('.');
		var ext = file_path.substr(dot_index).toLowerCase();
		
		if(!(ext == '.jpg' || ext == '.bmp' || ext == '.png' || ext == '.gif')){
			alert('jpg, bmp, png, gif 이미지만 업로드 가능합니다');
			return;
		}
	}
	
	$('#reviewFrm').submit();
	
});

$('.close').click(function(){
	
	window.close();	
	
});


</script>

</html>














































