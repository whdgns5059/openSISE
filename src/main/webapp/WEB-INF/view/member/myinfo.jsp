<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<div class="admin-title">
	<h1>나의 정보</h1>
	<div class="hr2">
		<div class="form-group">
			<label for="memEmail" class="col-sm-2 control-label">ID</label>
			<label for="memEmail" class="col-sm-2 control-label">${memberVo.mem_email}</label>
		</div>
		
		<div class="form-group">
			<label for="memNm" class="col-sm-2 control-label">닉네임</label>
			<label for="memNm" class="control-label">${memberVo.mem_nm}</label>
		</div>
		
		<div class="form-group">
			<label for="memGndr" class="col-sm-2 control-label">성별</label>
			<c:choose>
				<c:when test="${memberVo.mem_gndr == null}">
					<label for="memGndr" class="control-label" >선택안함</label>
				</c:when>
				<c:when test="${memberVo.mem_gndr != null}">
					<label for="memGndr" class="control-label" >
						<c:choose>
							<c:when test="${memberVo.mem_gndr == 'F'}">
								여자
							</c:when>
							<c:when test="${memberVo.mem_gndr == 'M'}">
								남자
							</c:when>
						</c:choose>
					</label>
				</c:when>
			</c:choose>
		</div>
		
		<div class="form-group">
			<label for="memAge" class="col-sm-2 control-label">연령대</label>
			<c:choose>
				<c:when test="${memberVo.mem_age == '0' }">
					<label for="memAge" class="control-label">선택안함</label>
				</c:when>
				<c:when test="${memberVo.mem_age != '0' }">
					<label for="memAge" class="control-label">${memberVo.mem_age}</label>
				</c:when>
			</c:choose>
		</div>
		
		<div class="form-group">
			<label for="memJob" class="col-sm-2 control-label">직장정보</label>
			<c:choose>
				<c:when test="${memberVo.job_nm == null }">
					<label for="memJob" class="control-label">선택안함</label>
				</c:when>
				<c:when test="${memberVo.job_nm != null }">
					<label for="memJob" class="control-label">${memberVo.job_nm}</label>
				</c:when>
			</c:choose>
		</div>
	
	</div>
	<form action="/mypage/myInfoUpdate" method="post">
	<div class="form-group">
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="hidden" name="mem_email" value="${memberVo.mem_email}">
     			<button type="submit" class="btn btn-default">수정</button>
			</div>
		</div>
		<div class="col-sm-10"></div>
	</div>
</form>
</div>