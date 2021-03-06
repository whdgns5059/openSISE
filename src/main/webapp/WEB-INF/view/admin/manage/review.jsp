<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- pagination -->
<link href="/css/pagination.css" rel="stylesheet">
<script>
	$(document).ready(function() {

		//tr mouseover 시 마우스 커서 모양 변경
		$("#reviewList").on("mouseover", ".content", function() {
			$(".content").css("cursor", "pointer");
		});

		// tr 클릭 시 해당 댓글의 위치로 이동
		$("#reviewList").on("click",".content", function() {
			var post_no = this.children[10].innerText;
			var post_ttl = this.children[1].innerText;
			var mem_email = this.children[2].innerText;
			var post_date = this.children[3].innerText;
			var post_star = this.children[9].innerText;
			var post_cntnt = this.children[8].innerText;
			var post_gu = this.children[4].innerText;
			var post_dong = this.children[5].innerText;
			var post_zip = this.children[6].innerText;
			var post_rd = this.children[7].innerText;
			
			$("#post_gu").html(post_gu);
			$("#post_dong").html(post_dong);
			$("#post_zip").html(post_zip);
			$("#post_rd").html(post_rd);
			$("#post_cntnt").html(post_cntnt);
			$("#post_star").html(post_star);
			$("#post_date").html(post_date);
			$("#mem_email").html(mem_email);
			$("#post_ttl").val(post_ttl);
			$("#post_no").html(post_no);
			$("#postNo").val(post_no);
			
			//post_no 를 파라미터로 보낸 후 첨부파일을 불러온다 
			// 모달 div 쪽에 첨부파일 셋팅
			// 그 후에 모달창 띄운다.
			$.ajax({
				type : "POST",
				data : {post_no : post_no},
				url : "/manage/review/searchPicture",
				success : function(data){
					html = "";
					html += "<label for='pic_file_nm'> 이미지 파일 <label>";
					html += "<br>";
					$.each(data.pictureList, function(index, pic){
						html += "<img src='"+pic.pic_file_path +"'>";
					});
					
					$("#img").html(html);
					$("#ex1").modal("show");
				}
			}); 
			
		});

		$("#selBox").on("change", function() {
			var selValue = $(this).val();
			if (selValue == 'date') {
				$("#searchNm").attr("type","date");
			}else{
				$("#searchNm").attr("type","text");
				$("#searchNm").val("");
			}
		});

		//검색 버튼 클릭시 분류 별 검색
		$("#search").on("click", function() {
			var searchNm = $("#searchNm").val();
			var selBox = $("#selBox").val();
			ajaxCall(1);
		});
		
		
		//신고 이력 버튼을 클릭했을 때
		$("#reportHistory").on("click",function(){
			var post_no = $("#postNo").val();
			
			 $.ajax({
				type : "POST",
				url : "/manage/review/reviewReportHistory",
				data : {post_no : post_no},
				success : function(data){
					$("#ex2").html("");
					$("#ex2").html(data);
					 $('#ex2').modal("show"); 
				}
			}); 
		});
		
		
		//강제 삭제 버튼을 클릭했을 때
		$("#compulsionDelete").on("click",function(){
			var post_no = $("#postNo").val();
			
			$.ajax({
				type : "POST",
				url : "/manage/review/deleteReivew",
				data : {post_no : post_no},
				success : function(data){
					if(data.reviewDelete > 0){
						alert("삭제되었습니다");
						
						//새로고침
						location.reload();
					}
				}
			});
		});
		
		$("#ex2").on("click","#pre", function(){
			$("#ex1").modal("show");	
		});
		
		
		

	});
	
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
        	var searchNm = $("#searchNm").val();
			var selBox = $("#selBox").val();
			 event.preventDefault();
			ajaxCall(1);
			
        }
	}
	
	function ajaxCall(pageNum){
		$("#page").val(pageNum);
	 	 var param = $("form[name=frm]").serialize();
		$.ajax({
			type : "POST",
			url : "/manage/review/search",
			data : param,
			success : function(data) {
				$("#reviewList").html("");
				$("#reviewList").html(data);
			}
		});	
	}
</script>

<style>
#selBox {
	width: 100px;
	height: 28px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
}

#search {
	width: 210px;
	height: 36px;
	align-self: center;
	margin: 0;
	padding: 0;
	border: none;
	border-bottom: 2px solid #4159a9;
}

#noSearch {
	margin-left: 380px;
}

.hidden{
	display: none;
}

.modal a.close-modal {
    position: absolute;
    top: 2.5px;
    right: 1.5px;
    display: block;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
 }
 
 .modal{
 	max-width: 800px;
 }
 
.btn {
    width: 130px;
    border: 1px solid #f7c97b;
    border-width: 1px;
    border-bottom: 4px solid #dc8c07;
    color: white;
    text-transform: uppercase;
    background-color: #e8a93f;
}

.bt {
    margin-left: 227px;
    margin-top: 35px;
}

#ex2{
	width: 817px;
    height: 646px;
}

#searchNm{
	margin-right: 10px;
    width: 300px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
}

#search {
    width: 60px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
    cursor: pointer;
}

#frm{
	margin-top: 15px;
    margin-bottom: 17px;
}

</style>

<div class="admin-title">
	<h2>리뷰관리</h2>
	<div class="hr2">
		<form id="frm" method="post" name="frm">
			<input type="hidden" id="page" name="page">
			<input type="hidden" id="pageSize" name="pageSize" value="10">
			<select id="selBox" name="selBox">
				<option value="all">전체</option>
				<option value="rwNum">리뷰 번호</option>
				<option value="email">작성자</option>
				<option value="date">날짜</option>
			</select> 
			<input type="text" id="searchNm" name="searchNm" onkeypress="enterkey();"  />
			<input type="button" id="search" value="검색"/>
		</form>
		<div id="reviewList">
			<table class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${pageReviewList}" var="review">
					<tr class="content">
						<td>${review.rnum}</td>
						<td>${review.post_ttl}</td>
						<td>${review.mem_nm}</td>
						<td><fmt:formatDate value="${review.post_date}" pattern="yyyy-MM-dd" /></td>
						<td class ="hidden" >
							<label for="post_gu">${review.post_gu}</label>
						</td>
						<td class ="hidden" >
							<label for="post_dong">${review.post_dong}</label>
						</td>
						<td class ="hidden" >
							<label for="post_zip">${review.post_zip}</label>
						</td>
						<td class ="hidden" >
							<label for="post_rd">${review.post_rd}</label>
						</td>
						<td class ="hidden" >
							<label for="post_cntnt">${review.post_cntnt}</label>
						</td>
						<td class ="hidden" >
							<label for="post_star">${review.post_star}</label>
						</td>
						<td class ="hidden" >
							<label for="post_no">${review.post_no}</label>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${reviewSize == '0'}">
				<div id="noList">
					<span id="noSearch">검색 결과가 없습니다</span>
				</div>
			</c:if>
			<div class="text-center" id="nav" >
				<ul class="pagination">
					<li><a href="javascript:ajaxCall(1);" aria-label="Previous" <c:if test="${pageCnt == 1}"> onclick="return false;" </c:if>>
							<span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach begin="1" end="${pageCnt}" var="p">
						<li><a href="javascript:ajaxCall(${p});">${p}</a></li>
					</c:forEach>
					
					<li><a href="javascript:ajaxCall(${pageCnt});"	aria-label="Next" <c:if test="${pageCnt == 1}"> onclick="return false;" </c:if>><span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="ex1" class="modal">	
	<br>
	<h3 align="center" >리뷰 상세 정보</h3></br>
  	<div class="form-group">
		<label for="post_no" >no. </label>
		<label for="post_no" class="control-label" id="post_no"></label>
		
	</div>
	<div class="form-group">
		<label for="post_date" >작성 날짜</label> 
		<label for="post_date" class="control-label" id="post_date"></label>
	</div>
  	<div class="form-group">
		<label for="mem_email" >작성자 </label>
		<label for="mem_email" class="control-label" id="mem_email"></label>
		<hr>
	</div>
  	<div class="form-group">
		<label for="post_ttl" >제목</label>
		<br>
<!-- 		<label for="post_ttl" class="control-label" id="post_ttl"></label> -->
		<input type="text" readonly="readonly" class="form-control" id="post_ttl" disabled="disabled"/> 
	</div>
	
	<div class="form-group" id="img">
		
	</div>
	<div class="form-group">
		<label for="post_cntnt" >내용</label>
		<br>
		<textarea rows="10" readonly="readonly" disabled="disabled" id="post_cntnt" class="form-control"></textarea>
	</div>
	<div class="form-group">
		<label for="post_star" >별점</label>
		<label for="post_star" class="control-label" id="post_star"></label>
	</div>
	<div class="form-group bt">
		<button class="btn" id="compulsionDelete">강제 삭제</button>
		<button class="btn" id="reportHistory">신고 이력 확인</button>
		<input type="hidden" id="postNo" name="post_no">
	</div>
</div>
<div id="ex2" class="modal">

</div>