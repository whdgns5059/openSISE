<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* #selBox {
	width: 100px;
	height: 25px;
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
} */
</style>

<table class="table table-striped table-hover">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>

	<c:forEach items="${pageReviewList}" var="cate">
		<tr class="content">
			<td>${cate.rnum}</td>
			<td>${cate.post_ttl}</td>
			<td>${cate.mem_nm}</td>
			<td><fmt:formatDate value="${cate.post_date}" pattern="yyyy-MM-dd" /></td>
			<td class ="hidden" >
				<label for="post_gu">${cate.post_gu}</label>
			</td>
			<td class ="hidden" >
				<label for="post_dong">${cate.post_dong}</label>
			</td>
			<td class ="hidden" >
				<label for="post_zip">${cate.post_zip}</label>
			</td>
			<td class ="hidden" >
				<label for="post_rd">${cate.post_rd}</label>
			</td>
			<td class ="hidden" >
				<label for="post_cntnt">${cate.post_cntnt}</label>
			</td>
			<td class ="hidden" >
				<label for="post_star">${cate.post_star}</label>
			</td>
			<td class ="hidden" >
				<label for="post_no">${cate.post_no}</label>
			</td>
		</tr>
	</c:forEach>
</table>
<div id="noList">
<c:if test="${reviewSize == '0'}">
	<span id="noSearch">검색 결과가 없습니다</span>
</c:if>
</div>
<div class="text-center" id="nav" >
	<ul class="pagination">
		<li><a href="javascript:ajaxCall(1);" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
		</a></li>
		<c:forEach begin="1" end="${cateCnt}" var="p">
			<li><a href="javascript:ajaxCall(${p});">${p}</a></li>
		</c:forEach>
		
		<li><a href="javascript:ajaxCall(${cateCnt});"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</div>