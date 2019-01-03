<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- 공지사항 제목만 나열 -->
		<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
			<tr>
				<td style="width: 20px;">${status.count }</td>
				<td>${noticeVo.post_ttl }</td>
				<br/>
			</tr>
		</c:forEach>
