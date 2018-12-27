<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped table-hover">
	<tr>
		<th>번호</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>

	<c:forEach items="${reviewAllList}" var="review">
		<tr class="content">
			<td>${review.rownum}</td>
			<td>${review.rpl_cntnt}</td>
			<td>${review.mem_email}</td>
			<td>${review.rpl_date}</td>
		</tr>
	</c:forEach>
</table>