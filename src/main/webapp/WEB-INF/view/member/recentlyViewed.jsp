<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="admin-title">
	<h1>최근본 매물</h1>
	<p>매물명을 클릭하면 상세보기로 이동합니다</p>
		<div class="hr2">
			<table class="table">
				<thead>
					<tr>
						<th>매물명</th>
						<th>매물주소</th>
						<th>매매종류</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${searchList }" var="sel">
						<tr>	
							<td class="artcl_nm">
								${sel.artcl_complx}${sel.artcl_nm }
								<input type="hidden" class="artcl_gu" value="${sel.artcl_gu }"/>
								<input type="hidden" class="artcl_dong" value="${sel.artcl_dong }"/>
								<input type="hidden" class="artcl_zip" value="${sel.artcl_zip }"/>
								<input type="hidden" class="artcl_rd" value="${sel.artcl_rd }"/>
								<input type="hidden" class="favor_ty" value="${sel.artcl_dl_ty}"/>
							
							</td>
							<td>${sel.artcl_gu }, ${sel.artcl_dong}, ${sel.artcl_zip }, ${sel.artcl_rd }</td>
							<td>${sel.artcl_dl_ty }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			
			</table>
		
		
		</div>
</div>

<script>
$('.artcl_nm').click(function(){
	
	var artcl_gu   = this.parentElement.getElementsByClassName('artcl_gu')[0].value
	var artcl_dong = this.parentElement.getElementsByClassName('artcl_dong')[0].value;
	var artcl_zip  = this.parentElement.getElementsByClassName('artcl_zip')[0].value;
	var artcl_rd   = this.parentElement.getElementsByClassName('artcl_rd')[0].value;
	var favor_ty   = this.parentElement.getElementsByClassName('favor_ty')[0].value;
	
	location.href = '/detail/info?artcl_gu='+artcl_gu+'&artcl_dong='+artcl_dong+'&artcl_zip='+artcl_zip+'&artcl_rd='+artcl_rd+'&dl_ty='+favor_ty;
	
});
	
</script>	