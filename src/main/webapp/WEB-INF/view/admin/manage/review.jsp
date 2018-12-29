<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(document).ready(function() {

		//tr mouseover 시 마우스 커서 모양 변경
		$("#reviewList").on("mouseover", ".content", function() {
			$(".content").css("cursor", "pointer");
		});

		// tr 클릭 시 해당 댓글의 위치로 이동
		$(".content").on("click", function() {

		});

		$("#selBox").on("change", function() {
			var selValue = $(this).val();
			if (selValue == 'date') {
				$("#searchNm").attr("type","date");
			}else{
				$("#searchNm").attr("type","text");
				$("#searchNm").val("");
			}
		});

		//검색 버튼 클릭시 분류 별 검색
		$("#search").on("click", function() {
			var searchNm = $("#searchNm").val();
			var selBox = $("#selBox").val();

			$.ajax({
				type : "POST",
				url : "/manage/review/search",
				data : {
					searchNm : searchNm,
					selBox : selBox
				},
				success : function(data) {
					$("#reviewList").html("");
					$("#reviewList").html(data);
				}
			});
		});

	});
</script>

<style>
#selBox {
	width: 100px;
	height: 25px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
}

#search {
	width: 210px;
	height: 36px;
	align-self: center;
	margin: 0;
	padding: 0;
	border: none;
	border-bottom: 2px solid #4159a9;
}

#noSearch {
	margin-left: 380px;
}
</style>

<div class="admin-title">
	<h2>리뷰관리</h2>
	<div class="hr2">
		<form action="#" id="frm" method="post">
			<select id="selBox" name="selBox">
				<option value="all">전체</option>
				<option value="email">이메일</option>
				<option value="date">날짜</option>
			</select> <input type="text" id="searchNm" name="searchNm" />
			<button type="button" class="btn btn-primary searchBtn btn-lg"
				id="search">검색</button>
		</form>
		<div id="reviewList">
			<table class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${reviewAllList}" var="review">
					<tr class="content">
						<td>${review.rownum}</td>
						<td>${review.rpl_cntnt}</td>
						<td>${review.mem_email}</td>
						<td><fmt:formatDate value="${review.rpl_date}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${reviewSize == '0'}">
				<div id="noList">
					<span id="noSearch">검색 결과가 없습니다</span>
				</div>
			</c:if>
		</div>
	</div>
</div>