<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 

<style>
	.popupPadding { padding: 20px;}
</style>
<div class="popupPadding">
	<h3>전체 실거래 정보</h3>
</div>
<div class="row">
	<div class="col-md-8">
		<table class="table table-striped table-hover">
			<thead>
				<c:choose>
					<c:when test="${dl_ty == '매매'}">
						<tr>
							<td>거래일</td>
							<td>매매가</td>
							<td>층</td>
						</tr>
					</c:when>
					<c:when test="${dl_ty == '전세'}">
						<tr>
							<td>거래일</td>
							<td>전세가</td>
							<td>층</td>
						</tr>
					</c:when>
					<c:when test="${dl_ty == '월세'}">
						<tr>
							<td>거래일</td>
							<td>보증금</td>
							<td>월세</td>
							<td>층</td>
						</tr>
					</c:when>
				</c:choose>
			</thead>	
			<tbody>
				<c:choose>
					<c:when test="${dl_ty == '매매'}">
						<c:forEach items="${dealListByArea }" var="dealList" >
							<tr>
								<td width="250px">${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
								<td width="300px">${dealList.dl_price }</td>
								<td width="100px">${dealList.dl_flr }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${dl_ty == '전세'}">
						<c:forEach items="${dealListByArea }" var="dealList" >
							<tr>
								<td width="250px">${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
								<td width="300px">${dealList.dl_depos }</td>
								<td width="100px">${dealList.dl_flr }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${dl_ty == '월세'}">
						<c:forEach items="${dealListByArea }" var="dealList" >
							<tr>
								<td width="250px">${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
								<td width="300px">${dealList.dl_depos}</td>
								<td width="300px">${dealList.dl_rnt}</td>
								<td width="100px">${dealList.dl_flr }</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>	
	</div>
</div>
