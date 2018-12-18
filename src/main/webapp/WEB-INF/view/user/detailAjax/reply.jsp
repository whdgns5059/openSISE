<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<table>
		
		<c:forEach items="${replyList }" var="rlist">
			<tr>	
				<td width="200px"> <label>${rlist.mem_email }</label></td>
				<td width="400px"> <label>${rlist.rpl_cntnt }</label></td>
				<td width="200px"> <label>${rlist.rpl_date }</label></td>
				<td width="100px"><input type="hidden" name="rpl_no" value="${rlist.rpl_no }"/>
				<label class="labelred">x</label> </td>
			</tr>
		</c:forEach>
	</table>

	
</div>