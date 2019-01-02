<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- pagination -->
<link href="/css/pagination.css" rel="stylesheet">

<style>
#rptCfBtn{
	width: 150px;
	background: white;
	margin-right: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
	font-weight: 500;
}
.rpt_search{
    margin: 40px 0 15px 0;
    width: 100%;
    height: 30px;
    display: flex;
}
#selBox {
	margin-right: 10px;
	width: 100px;
	height: 30px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
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
#noSearch {
	margin-left: 380px;
}
th{
	text-align: center;
}
th:nth-child(1), th:nth-child(5){
	width: 60px;
}
th:nth-child(2){
	width: 510px;
}
th:nth-child(4){
	width: 120px;
}
td:nth-child(1), td:nth-child(3),td:nth-child(4),td:nth-child(5){
	text-align: center;
}
td{
	cursor: pointer;
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
 .modalTop{
 	width: 100%;
 	height: 25px;
 }
 .rpt_date{
 	float: left;
 }
.selBox{
	float: right;
}
#rpt_no{
    display: block;
    border: none;
    background: none;
    width: 22px;
    height: 28px;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
    font-weight: 400;
    float: left;
}
.rpt_noLabel{
    width: 70px;
    height: 28px;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 30px;
    color: #808080;
}
#rpt_cf_nm{
    float: right;
    width: 120px;
    border: none;
    background: none;
}
.btnClass{
	text-align: center;
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
</style>
<script type="text/javascript">
$(document).ready(function(){
	/* 신고분류 관리 */
	$('#rptCfBtn').on('click',function(){
		window.open("/manage/rptClassfForm", "new window", "width=600, height=550");
		
	});
	
	// 해당 글 modal창 띄우기
	$("#reportList").on("click",".content", function() {
		var rpt_no = this.children[0].innerText;
		var rpt_post = this.children[5].innerText;
		var rpt_cntnt = this.children[6].innerText;
		var rpt_date = this.children[3].innerText;
		var rpt_cf_nm = this.children[2].innerText;
		var rpt_mem = this.children[7].innerText;
		var rpt_ttl = this.children[1].innerText;
		var rpt_exst = this.children[4].innerText;
		
		$("#rpt_no").html(rpt_no);
		$("#rpt_post").html(rpt_post);
		$("#rpt_cntnt").html(rpt_cntnt);
		$("#rpt_date").html(rpt_date);
		$("#rpt_cf_nm").html(rpt_cf_nm);
		$("#rpt_mem").html(rpt_mem);
		$("#rpt_ttl").html(rpt_ttl);
		// 처리여부 
		if(rpt_exst == 'Y'){
			$('#rpt_exst').val('Y').prop("selected", true);
		}else if(rpt_exst == 'N'){
			$('#rpt_exst').val('N').prop("selected", true);
		}
		
		$(".modal").modal("show");
	});
	
	// 검색 버튼 클릭시 분류 별 검색
	$("#search").on("click", function() {
		/* var searchNm = $("#searchNm").val();
		var selBox = $("#selBox").val(); */
		reportListPage(1);
	});
	
	function reportListPage(pageNum){
		// 선택한 페이지 번호
	 	$("#page").val(pageNum);
		// form 전체 보내기
	 	 var param = $("form[name=frm]").serialize();
		
		$.ajax({
			type : "POST",
			url : "/manage/reportListAjax",
			data : param,
			success : function(data) {
				// 먼저 현재 html을 지우고
				$("#reportList").html("");
				// 결과에 따른 새로운 html 쓰기
				$("#reportList").html(data);
			}
		});
	}
	
	// 모달 닫기
	$('#cancel').on('click',function(){
		$('.modal').hide();
		$('.blocker').hide();
	});
	
});
</script>
    
<div class="admin-title">
	<h2>신고관리</h2>
	<div class="hr2">
	</div>
	
	<!-- 신고 분류 관리용 창으로 이동 -->
	<div>
		<button class="btn" id="rptCfBtn">신고 분류 관리</button>
	</div>
	
	<!-- 검색하기 -->
	<div class="rpt_search">
		<form id="frm" method="post" name="frm">
			<!-- 현재 선택한 페이지 번호 -->
			<input type="hidden" id="page" name="page">
			<!-- 신고글은 10개씩 보여줌 -->
			<input type="hidden" id="pageSize" name="pageSize" value="10">
			<!-- 검색 필터 -->
			<select id="selBox" name="selBox">
				<option value="all">전체</option>
				<option value="rpt_no">신고번호</option>
				<option value="rpt_post">게시글번호</option>
				<option value="rpt_cf_nm">신고분류</option>
				<option value="rpt_ttl">제목</option>
				<option value="rpt_cntnt">내용</option>
				<option value="rpt_mem">작성자</option>
				<option value="rpt_exst">처리여부</option>
			</select>
			<!-- 검색어 -->
			<input type="text" id="searchNm" name="searchNm" />
			<button type="button" id="search">검색</button>
		</form>
	</div>
	
	<!-- 신고글 리스트 -->
	<div id="reportList">
		<table class="table table-striped table-hover">
			<tr class="rptTblTtl">
				<th>no.</th>
				<th>제목</th>
				<th>분류</th>
				<th>작성일</th>
				<th>처리</th>
			</tr>
			<c:forEach items="${reportVoList}" var="report">
				<tr class="content">
					<td>${report.rpt_no}</td>
					<td>${report.rpt_ttl}</td>
					<td>${report.rpt_cf_nm}</td>
					<td><fmt:formatDate value="${report.rpt_date}" pattern="yyyy-MM-dd" /></td>
					<td>${report.rpt_exst}</td>
					<td class ="hidden" >
						<label for="rpt_post">${report.rpt_post}</label>
					</td>
					<td class ="hidden" >
						<label for="rpt_cntnt">${report.rpt_cntnt}</label> 
					</td>
					<td class ="hidden" >
						<label for="rpt_mem">${report.rpt_mem}</label>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 검색결과가 없을 시 -->
		<c:if test="${reportVoList eq null}">
			<div id="noList">
				<span id="noSearch">검색 결과가 없습니다</span>
			</div>
		</c:if>
		
		<!-- 페이징 처리 -->
		<div class="text-center" >
			<ul class="pagination">
				<li>
					<a href="javascript:reportListPage(1)" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach begin="1" end="${pageCnt}" var="pageNum">
					<li><a href="javascript:reportListPage(${pageNum })">${pageNum }</a></li>
				</c:forEach>
				<li>
					<a href="javascript:reportListPage(${pageCnt })"aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 모달창 -->
	<!-- 신고글 상세 보기 -->
	<div id="ex1" class="modal report_container">
		<div class="modalTop">
			<p class="rpt_date">신고한 날짜</p>
			<select id="rpt_exst" class="selBox" >
				<option value="Y" >처리완료</option>
				<option value="N" >미처리</option>
			</select>
		</div>	
		<hr/>
		<form action="/detail/reportInsert" method="post" id="rpt_frm">
			<div class="form-horizontal">
				<div class="form-group rpt_post">
					<input type="text" id="rpt_no" name="rpt_no" value="${rpt_no }" readonly disabled/>
					<label for="rpt_post" class="rpt_noLabel"></label>
					<input type="text" id="rpt_cf_nm" name="rpt_cf_nm" value="${rpt_cf_nm }" readonly disabled/>
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
	</div>	
	
</div>
























