<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<style type="text/css">

.btn {
    width: 84px;
    border: 1px solid #ffe1af;
    border-width: 1px;
    border-bottom: 4px solid #e8a93f;
    color: #e8a93f;
    background-color: white;
    }
 .table {
 	 margin-top: 30px;
 	 background-color: white-space; 
 	 border: solid #f3af3d; 
 	 width:70%;
 	 border-top: 1px solid #eaedef;
 	 border-bottom: 1px solid #eaedef;
 	 border-right : 1px solid #ffffff;
 	 border-left : 1px solid #ffffff;
 	 border-collapse: collapse;
 	 
 }   
 .th{
 	background-color: #f3af3d;
 	color: #fbe9c4;
 }
 
 .th2{
 	color: #848484;
 }
 .admin-title{
	max-width: 85%;
    min-width: 700px;
    float: left;
    margin: 0 auto;
    margin-top: 50px;
 }
 
 
 
</style>
</head>

<body>
<div class="admin-title"  align="center" >
	<h1>나의 정보</h1>
	<table class="table" border="1">
		<tbody align="center">
			<th class="th">ID</th>
			<th class="th2"><label for="memEmail" class="control-label">${member.mem_email}</label></th>
		</tbody>
		<tbody align="center">
			<th class="th">닉네임</th>
			<th class="th2"><label for="memNm" class="control-label">${member.mem_nm}</label></th>
		</tbody>
		<tbody align="center">
			<th class="th">성별</th>
			<th class="th2">
				<c:choose>
				<c:when test="${member.mem_gndr == null}">
					<label for="memGndr" class="control-label" >선택안함</label>
				</c:when>
				<c:when test="${member.mem_gndr != null}">
					<label for="memGndr" class="control-label" >
						<c:choose>
							<c:when test="${member.mem_gndr == 'F'}">
								여자
							</c:when>
							<c:when test="${member.mem_gndr == 'M'}">
								남자
							</c:when>
						</c:choose>
					</label>
				</c:when>
			</c:choose>
			</th>
		</tbody>
		<tbody align="center">
			<th class="th">연령대</th>
			<th class="th2">
				<c:choose>
				<c:when test="${member.mem_age == null }">
					<label for="memAge" class="control-label">선택안함</label>
				</c:when>
				<c:when test="${member.mem_age != '0' }">
					<label for="memAge" class="control-label">${member.mem_age}</label>
				</c:when>
				</c:choose>
			</th>
		</tbody>
		<tbody align="center">
			<th class="th">직장정보</th>
			<th class="th2">
				<c:choose>
				<c:when test="${member.job_nm == null }">
					<label for="memJob" class="control-label">선택안함</label>
				</c:when>
				<c:when test="${member.job_nm != null }">
					<label for="memJob" class="control-label">${member.job_nm}</label>
				</c:when>
			</c:choose>
			</th>
		</tbody>
	</table>
	
	<form action="/mypage/myInfoUpdate" method="post">
	<div class="form-group" style="margin-top: 30px;">
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="hidden" name="mem_email" value="${member.mem_email}">
				<input type="hidden" name="mem_nm" value="${member.mem_nm}">
     			<button type="submit" class="btn" style="background-color: white;">수정</button>
			</div>
		</div>
		<div class="col-sm-10"></div>
	</div>
</form>

</div>
</style>