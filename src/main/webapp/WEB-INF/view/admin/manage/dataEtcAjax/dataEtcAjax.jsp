<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="info">
	<tbody id="tbody">
		<c:if test="${instiAttrList !=null }">
			<!-- 값을 가져오는 반복문 -->
			<c:forEach items="${instiAttrList }" var="instiAttr_List"
				varStatus="status">
				<c:choose>
					<c:when
						test="${instiAttrList[status.index].groupno != instiAttrList[status.index-1].groupno}">
						<tr>
							<td><input type="checkbox" name="chk"
								value="${instiAttr_List.groupno }" class="instiattr" /></td>
							<td>${instiAttr_List.iattr_val}</td>
							<td style="display: none;">${instiAttr_List.iattr_no }</td>
					</c:when>
					<c:when
						test="${instiAttrList[status.index].groupno == instiAttrList[status.index-1].groupno}">
						<c:if
							test="${instiAttrList[status.index].groupno == instiAttrList[status.index+1].groupno}">
							<td>${instiAttr_List.iattr_val}</td>
						</c:if>
						<c:if
							test="${instiAttrList[status.index].groupno != instiAttrList[status.index+1].groupno}">
							<td>${instiAttr_List.iattr_val}</td>
							<td style="display: none;">${instiAttr_List.iattr_pare }</td>
							</tr>
						</c:if>
					</c:when>
				</c:choose>
			</c:forEach>
		</c:if>
	</tbody>
</table>

<!-- <div class="insti"> -->
<!-- 	<input type="hidden" id="iattr_pare" value="0" name="iattr_pare" /> <input -->
<%-- 		type="hidden" value="${iattr_insti }" name="iattr_insti" /> --%>
<!-- </div> -->