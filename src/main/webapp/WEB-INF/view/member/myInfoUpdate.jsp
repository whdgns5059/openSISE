<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
</style>


<div class="admin-title">
	<h1>나의 정보</h1>
	<div class="hr2">
			<form action="/board/updateFinish" method="post" >
				<!-- <input type="hidden" name="userId" value="${userVo.userId}" />-->
				<div class="form-group">
					<label for="memEmail" class="col-sm-2 control-label">ID</label>
					<!-- <label for="memEmail" class="col-sm-2 control-label">${memberVo.mem_email}</label> -->
				</div>

				<div class="form-group">
					<label for="memNm" class="col-sm-2 control-label">닉네임</label>
					<!-- <label for="memNm" class="control-label">${memberVo.mem_nm}</label> -->
				</div>
				
				<div class="form-group">
					<label for="memGndr" class="col-sm-2 control-label">성별</label>
				<!-- <label for="memGndr" class="control-label">${memberVo.mem_gndr}</label> -->	
				</div>
				
				<div class="form-group">
					<label for="memAge" class="col-sm-2 control-label">연령대</label>
					<!-- <label for="memAge" class="control-label">${memberVo.mem_age}</label> -->
				</div>
				
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">직장정보</label> 
					<select id="jobLiset" name="job">
					<!-- 	<c:forEach items="${JobLiset}" var="jobList">
							<option>${jobList.job}</option>
						</c:forEach> -->
					</select>
				</div>

				<div class="form-group">
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">수정완료</button>
						</div>
					</div>
					<div class="col-sm-10"></div>
				</div>
			</form>
		</div>
	</div>
</div>