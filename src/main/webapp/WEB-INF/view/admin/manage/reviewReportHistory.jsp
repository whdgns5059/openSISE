<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#noReportList{
	margin-left: 190px;
}

#but{
    margin-left: 230px;
    line-height: 495px;
}

.btns {
    width: 87px;
    border: 1px solid #f7c97b;
    border-width: 1px;
    border-bottom: 4px solid #dc8c07;
    color: white;
    text-transform: uppercase;
    background-color: #e8a93f;
    font-weight: 400;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    
}

.btns:hover{
	color: #f1ebe0;
    text-decoration: none;
    cursor: pointer;
}


</style>
<div>
	<br>
	<h3 align="center">�Ű� ���� ��ȸ</h3>
	</br>
	<div class="form-group">
		<table class="table">
			<tr>
				<th>�Ű� ��ȣ</th>
				<th>�Ű� ��¥</th>
				<th>�Ű� ����</th>
				<th>�Ű� �з�</th>
				<th>ó�� ����</th>
			</tr>
			<c:forEach items="${reportList}" var ="report">
				<tr>
					<td>${report.rpt_no}</td>
					<td><fmt:formatDate value="${report.rpt_date}" pattern="yyyy-MM-dd"/></td>
					<td>${report.rpt_cntnt}</td>
					<td>${report.rpt_cf_nm}</td>
					<c:choose>
						<c:when test="${report.rpt_exst == 'Y'}">
							<td>ó�� �Ϸ�</td>						
						</c:when>
						<c:when test="${report.rpt_exst == 'N'}">
							<td>ó�� �̿Ϸ�</td>						
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${reportSize == 0}">
			<span id="noReportList">�Ű� ������ �����ϴ�</span>
		</c:if>
	</div>
</div>
<div id="but">
	<button class="btns" id="pre">����</button>
</div>
