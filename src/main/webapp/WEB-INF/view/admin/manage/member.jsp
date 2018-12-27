<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>    
<head>
<script type="text/javascript">

	//page인자를 받아서
	//해당 페이지에 속하는 사용자리스트 정보를 가져온다
	function getUserList(page) {
		var pageSize = 10;
		console.log("page :" + page);

		//ajax call
		//사용자 리스트 데이터만 가져오기
		//html(as-is) --> json(to-be) 데이터를 받는 형태로 변경

		$.ajax({
			type : "GET",
			url : "/admin/userPageListAjax",
			data : "page=" + page + "&pageSize=" + pageSize,
			//=> page=1&pageSize=10
			success : function(data) {
				// data.pageUserList, data.pageCnt가 들어있다.
				//data(사용자 json 데이터)를 바탕으로
				//사용자 리스트를 갱신하는 작업

				//1. 기존 리스트를 삭제
				//2. data를 이용하여 table 태그(tr)를 작성
				//3. 기존 리스트 위치에다가 붙여넣기
				//data.userList
				var html ="";
				$.each(data.pageUserList, function(idx, user){
					html +="<tr>";
					html +="<th>"+user.mem_no+"</th>";
					html +="<th>"+user.mem_nm+"</th>";
					html +="<th>"+user.mem_email+"</th>";
					html +="<th>"+user.mem_date+"</th>";
					html +="</tr>";
				});
				
				$("#userList").html("");
				$("#userList").html(html);
				
			 	/* var pageNav = ""; 
				for(var i=1; i<data.pageCnt+1; i++){
					pageNav += "<li><a href=\"javascript:getUserList(" +i+ ") \">"+i+"</a></li>";
				}
				$("#nav").html("");
				$("#nav").html(pageNav); */
			}
		});
	}
</script>

<style type="text/css">


.bg-danger {
    background-color: #f3af3d !important;
 
}
.table {
    width: 100%;
    border: 1px solid #f3af3d;
  }

</style>
</head>
<div class="admin-title">
	<h2>회원 목록 관리</h2></br>
	
	<table class="table table-hover "  style="border-radius: 50px !important;">
		<thead>
		  	<tr class="bg-danger ">
				<th>회원 번호</th>
				<th>회원 닉네임</th>
				<th>회원 이메일</th>
				<th>가입일자</th>
			</tr>
		</thead>
		
		<tbody id="userList">
			<c:forEach items="${pageUserList}" var="page">
			<tr>
				<th>${page.mem_no}</th>
				<th>${page.mem_nm}</th>
				<th>${page.mem_email}</th>
				<th>${page.mem_date}</th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div class="text-center" id="nav" >

			<ul class="pagination">
				<li><a href="javascript:getUserList(1);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach begin="1" end="${pageCnt}" var="p">
					<li><a href="javascript:getUserList(${p});">${p}</a></li>
				</c:forEach>
				
				<li><a href="javascript:getUserList(${pageCnt});"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</div>
	
	
	
</div>



</html>