<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
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
</script>

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
<div class="text-center" id="nav" >
	<ul class="pagination">
		<li>
			<a href="javascript:reportListPage(1)" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<c:forEach begin="1" end="${pageCnt}" var="pageNum">
			<li><a href="javascript:reportListPage(${pageNum })" name="page">${pageNum }</a></li>
		</c:forEach>
		<li>
			<a href="javascript:reportListPage(${pageCnt })"aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</div>






