<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table" style="width: 800px;">
	<thead>
		<tr class="openMask">
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
	</thead>
	<tbody id="noticeModify">
		<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
			<tr class="noticeList">
				<td>${status.count }</td>
				<td class="openMask">${noticeVo.post_ttl }</td>
				<td>${noticeVo.post_date }</td>
				<td style="display: none;">${noticeVo.post_no}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>