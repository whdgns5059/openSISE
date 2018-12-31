<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>    
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<head>
<script type="text/javascript">
	function getUserList(page) {
		var pageSize = 10;
		console.log("page :" + page);

		$.ajax({
			type : "GET",
			url : "/admin/userPageListAjax",
			data : "page=" + page + "&pageSize=" + pageSize,
			success : function(data) {
				var html ="";
				$.each(data.pageUserList, function(idx, user){
					html +="<tr class='memList'>";
					html +="<th>"+user.mem_no+"</th>";
					html +="<th>"+user.mem_nm+"</th>";
					html +="<th>"+user.mem_email+"</th>";
					html += "<th>"+user.mem_date+"</th>";
					html +="</tr>";
				});
				
				$("#userList").html("");
				$("#userList").html(html);
				
			}
		});
	}
	
	$(document).ready(function(){
		$("#ex").hide();
		$(".memList").on("click",function(){
			var mem_no = this.children[0].innerText;
			var mem_nm = this.children[1].innerText;
			var mem_email = this.children[2].innerText;
			var mem_date = this.children[3].innerText;
			var mem_gndr = this.children[4].innerText;
			var mem_age = this.children[5].innerText;
			var job_nm = this.children[6].innerText;
			//var mem_interest = this.children[6].innerText;
			var mem_exdate = this.children[7].innerText;
			var mem_lvl = this.children[8].innerText;
			
			$("#mem_no").html(mem_no);
			$("#mem_nm").html(mem_nm);
			$("#mem_email").html(mem_email);
			$("#mem_date").html(mem_date);
			$("#mem_gndr").html(mem_gndr);
			$("#mem_age").html(mem_age);
			$("#job_nm").html(job_nm);
			$("#mem_exdate").html(mem_exdate);
			$("#mem_lvl").html(mem_lvl);
			
			//form 실행
			$(".modal").modal("show");
		});

	});
	
	$(document).ready(function(){
		$("#interest").on("click",function(){
			$(".modal2").modal("show");
		});
	});
	
	$(document).ready(function(){
		$("#close").on("click",function(){
			$.modal("close");
		});
	});
	
	$(document).ready(function(){
		$("#back").on("click",function(){
			$(".modal").modal("show");
		});

	});
	
	//검색 버튼 클릭시 분류 별 검색
	$("#search").on("click", function() {
		var searchNm = $("#searchNm").val();
		var selBox = $("#selBox").val();
		
		$.ajax({
			type : "POST",
			url : "/admin/search",
			date : {searchNm : searchNm, selBox : selBox},
			success : function(data){
				$("#yd").html("");
				$("#yd").html(data);
			}
		});
	});
</script>

<style type="text/css">
.bg-danger {
    background-color: #f3af3d !important;
}
.table {
    width: 100%;
    border: 1px solid #f3af3d;
  }
.modal a.close-modal {
    position: absolute;
    top: 2.5px;
    right: 1.5px;
    isplay: block;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
    background-image: 
}
.hidden{
	display:none;
}
</style>
</head>

<div class="admin-title">
	<h2>회원 목록 관리</h2></br>
	
	<select id="selBox" name="selBox" class="btn">
            <option value="all">전체</option>
            <option value="email">회원 번호</option>
            <option value="nm">회원 닉네임</option>
            <option value="date">회원 이메일</option>
    </select> 
    <input type="text" id="searchNm" name="searchNm" class="btn" />
    <button type="button" class="btn btn-primary searchBtn btn-lg" id="search">검색</button>
         
    <div id="yd">
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
			<tr class="memList">
				<th>${page.mem_no}</th>
				<th>${page.mem_nm}</th>
				<th>${page.mem_email}</th>
				<th><fmt:formatDate value="${page.mem_date}" pattern="yyyy-MM-dd"/></th>
				<th class="hidden">
				<c:choose>
						<c:when test="${page.mem_gndr 3== null}">
							<label for="memGndr" class="control-label" >선택안함</label>
						</c:when>
						<c:when test="${page.mem_gndr != null}">
							<label for="memGndr" class="control-label" >
								<c:choose>
									<c:when test="${page.mem_gndr == 'F'}">
										여자
									</c:when>
									<c:when test="${page.mem_gndr == 'M'}">
										남자
									</c:when>
								</c:choose>
							</label>
						</c:when>
					</c:choose>
				</th>
					
				<th class="hidden">
				<c:choose>
					<c:when test="${page.mem_age == '0' }">
						<label for="mem_age" class="control-label">선택안함</label>
					</c:when>
					<c:when test="${page.mem_age != null }">
						<label for="mem_age" class="control-label">${page.mem_age}</label>
					</c:when>
				</c:choose>
				</th>
				
				<th class="hidden">
				<c:choose>
					<c:when test="${page.job_nm == null }">
						<label for="mem_job" class="control-label">선택안함</label>
					</c:when>
					<c:when test="${page.job_nm != null }">
						<label for="mem_job" class="control-label">${page.job_nm}</label>
					</c:when>
				</c:choose>
				</th>
				
				<th class="hidden"><fmt:formatDate value="${page.mem_exdate}" pattern="yyyy-MM-dd"/>
				<c:choose>
					<c:when test="${page.mem_exdate == null }">
						<label for="mem_exdate" class="control-label">없음</label>
					</c:when>
				</c:choose>
				</th>
				<th class="hidden">${page.mem_lvl}</th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	 </div>  
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
	
	<!-- Modal HTML embedded directly into document -->
			<div id="ex1" class="modal">
			<form action="/login/mailSender" id="fm" method="post">
			<!-- <input type="hidden" id="memNm" name="memNm"> -->
				</br><h3 align="center" >회원상세정보</h3></br>
			  	<div class="form-group">
					<label for="mem_no" >회원번호</label>
					<label for="mem_no" class="control-label" id="mem_no"></label>
				</div>
				<div class="form-group">
					<label for="mem_nm" >닉네임</label>
					<label for="mem_nm" class="control-label" id="mem_nm"></label>
				</div>
				<div class="form-group">
					<label for="mem_email" >Email</label>
					<label for="mem_email" class="control-label" id="mem_email" ></label>
				</div>
				<div class="form-group">
					<label for="mem_gndr" >성별</label>
					<label for="mem_gndr" class="control-label" id="mem_gndr"></label>
					
				</div>
				<div class="form-group">
					<label for="mem_gndr" >연령대</label>
					<label for="mem_gndr" class="control-label" id="mem_age"></label>
				</div>
				<div class="form-group">
					<label for="job_nm" >직업</label>
					<label for="job_nm" class="control-label" id="job_nm"></label>
				</div>
				<!-- <div class="form-group">
					<label for="mem_interest" >관심사</label>
					<label for="mem_interest" class="control-label" id="mem_interest"></label>
				</div>-->
				<div class="form-group">
					<label for="mem_date" >가입날짜</label>
					<label for="mem_date" class="control-label" id="mem_date"></label>
				</div>
				<div class="form-group">
					<label for="mem_exdate" >탈퇴날짜</label>
					<label for="mem_exdate" class="control-label" id="mem_exdate"></label>
				</div>
				<div class="form-group">
					<label for="mem_lvl" >신고레벨</label>
					<label for="mem_lvl" class="control-label" id="mem_lvl"></label>
				</div>
			  	</br>
			  	
			  	  <div  align="center" style="font-family: 'Do Hyeon', sans-serif; ">
					<input type="button" id="interest" class="btns1" value="관심사보기" />
					<input type="button" id="pass_y" class="btns2" value="비밀번호 초기화" />
				  </div>
				  </form>
			</div>
			
			
			<div id="ex" class="modal2">
			<form action="/login/mailSender" id="fm" method="post">
			<!-- <input type="hidden" id="memNm" name="memNm"> -->
				</br><h3 align="center" >관심사보기</h3></br>
				<!-- <div class="form-group">
					<label for="mem_interest" >관심사</label>
					<label for="mem_interest" class="control-label" id="mem_interest"></label>
				</div>-->
			  	</br>
			  	
			  	  <div  align="center" style="font-family: 'Do Hyeon', sans-serif; ">
					<input type="button" id="close" class="close_btn" value="닫기" />
					<input type="button" id="back" class="back_btn" value="뒤로가기" />
				  </div>
				  </form>
			</div>
			
			
			
			<!-- <form action="/admin/memberDetail" id="fmm" method="get">
				<input type="hidden" id="memNm" name="mem_email">
			</form> -->
	
</div>



</html>