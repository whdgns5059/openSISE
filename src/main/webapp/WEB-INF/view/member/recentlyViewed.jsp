<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$(".img").on("click", function(){
		location.href = '/mypage/recently?artcl_index='+this.value;
	});


$('.artcl_nm').click(function(){
	
	var artcl_gu   = this.parentElement.getElementsByClassName('artcl_gu')[0].value
	var artcl_dong = this.parentElement.getElementsByClassName('artcl_dong')[0].value;
	var artcl_zip  = this.parentElement.getElementsByClassName('artcl_zip')[0].value;
	var artcl_rd   = this.parentElement.getElementsByClassName('artcl_rd')[0].value;
	var favor_ty   = this.parentElement.getElementsByClassName('favor_ty')[0].value;
	
	location.href = '/detail/info?artcl_gu='+artcl_gu+'&artcl_dong='+artcl_dong+'&artcl_zip='+artcl_zip+'&artcl_rd='+artcl_rd+'&dl_ty='+favor_ty;
	
});
});

</script>
</head>
<body>
	<div class="admin-title">
		<h1>최근본 매물</h1>
		<div class="hr2" style="margin: 26px 0 30px -20px;"></div>
		<p>매물명을 클릭하면 상세보기로 이동합니다</p>
			<table class="table">
				<thead>
					<tr>
						<th>매물명</th>
						<th>매물주소</th>
						<th>매매종류</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${searchList == null }">
						<tr>
							<td><h3>최근 본 매물이 없습니다.</h3></td>
						</tr>
					</c:if>
					<c:forEach items="${searchList }" var="sel" varStatus="s">
						<tr>
							<td class="artcl_nm">${sel.artcl_complx}${sel.artcl_nm }
								<input type="hidden" name="artcl_index" value="${s.index }"/>
								<input type="hidden" name="artcl_gu" class="artcl_gu" value="${sel.artcl_gu }" /> 
								<input type="hidden"  name="artcl_dong" class="artcl_dong" value="${sel.artcl_dong }" />
								<input type="hidden" name="artcl_zip" class="artcl_zip" value="${sel.artcl_zip }" />
								<input type="hidden"  name="artcl_rd" class="artcl_rd" value="${sel.artcl_rd }" />
								<input type="hidden"  name="artcl_dl_ty" class="favor_ty" value="${sel.artcl_dl_ty}" />
							</td>
							<td>${sel.artcl_gu },${sel.artcl_dong},${sel.artcl_zip },${sel.artcl_rd }</td>
							<td>${sel.artcl_dl_ty }</td>
							<td><input type="image" src="../img/closeBtn.png" width="15" height="15" class="img" value="${s.index}"></td>
						</tr>
					</c:forEach>
				</tbody>


			</table>


		</div>

</body>
</html>