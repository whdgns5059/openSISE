<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<div class="admin-title">
	<h2>공지사항</h2>
	<div class="hr2">
	</div>
	<div>
		<div style="display: inline;">
			<form action="">
				<select>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text"/>
				<input type="submit" name="search" id="search" value="검색">
			</form>
		</div>
		<div style="display: inline;">
			<form action="">
				<input type="submit" value="공지등록">
			</form>
		</div>
		<table border="1">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${noticeVo.post_ttl }</td>
						<td>${noticeVo.post_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>