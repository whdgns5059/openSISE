<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<div class="admin-title">
	<h2>회원 목록 관리</h2></br>
	
	<table class="table table-striped" >
	  	<tr>
			<th>회원 번호</th>
			<th>회원 닉네임</th>
			<th>회원 이메일</th>
			<th>가입일자</th>
		</tr>
		<c:forEach items="${memberList}" var="management">
			<tr>
				<th>${management.mem_no}</th>
				<th>${management.mem_nm}</th>
				<th>${management.mem_email}</th>
				<th>${management.mem_date}</th>
				
			</tr>
		</c:forEach>
		
	</table>
	
	
	
	
	
	
</div>



