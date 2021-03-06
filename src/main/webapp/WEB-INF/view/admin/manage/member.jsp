<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- pagination -->
<link href="/css/pagination.css" rel="stylesheet">

<head>
<script type="text/javascript">
	function getUserList(page) {
		var pageSize = 10;
		console.log("page :" + page);

		$.ajax({
			type : "GET",
			url : "/admin/userPageListAjax",
			data : "page=" + page + "&pageSize=" + pageSize ,
			success : function(data) {
				var html ="";
				$.each(data.pageUserList, function(idx, user){
					html +="<tr class='memList'>";
					html +="<td>"+user.mem_no+"</td>";
					html +="<td>"+user.mem_nm+"</td>";
					html +="<td>"+user.mem_email+"</td>";
					let mem_date = new Date(user.mem_date);
					html += "<td>"+mem_date.getFullYear()+"-"+(mem_date.getMonth()+1)+"-"+mem_date.getDate()+"</td>";
					html +="<td class='hidden'>";
						if(user.mem_gndr == null){
							html+= '<label for="memGndr" class="control-label" >선택안함</label>';
						}else if (user.mem_gndr != null) {
							html += '<label for="memGndr" class="control-label" >';
							 if(user.mem_gndr == 'F'){
								 html += '여자';
							 }else if (user.mem_gndr == 'M') {
								 html += '남자';
							}
							html += '</label>';
						}
					html += "</td>";
					 
					html += "<td class='hidden'>";
						if(user.mem_age == '0'){
							html += '<label for="mem_age" class="control-label">선택안함</label>';
						}else if (user.mem_age != null ) {
							html += '<label for="mem_age" class="control-label">'+user.mem_age+'</label>';
						}
					html += "</td>";
					
					html += "<td class='hidden'>";
						if(user.job_nm == null){
							html += '<label for="mem_job" class="control-label">선택안함</label>';
						}else if (user.job_nm != null) {
							html += '<label for="mem_job" class="control-label">'+user.job_nm+'</label>';
						}
					let mem_exdate = new Date(user.mem_exdate);
					html += "</td>";
					html += "<td class='hidden'>"+mem_exdate.getFullYear()+"-"+(mem_exdate.getMonth()+1)+"-"+mem_exdate.getDate()+"</th>";
						if(user.mem_exdate == null){
							html += '<label for="mem_exdate" class="control-label">없음</label>';
						}
					html += "</td>";
					html += "<td class='hidden'>"+user.mem_lvl+"</td>";
					html += "<td class='hidden'>"
						if(user.nm == null){
							html += '<label for="nm" class="control-label" >선택안함</label>';
						}else if(user.nm){
							html += '<label for="nm" class="control-label" >${page.nm}</label>';
						}
					
					html += "</td>";
					html += "</tr>";
					
				});
				
				$("#userList").html("");
				$("#userList").html(html);
				
				/* var pageNav = ""; 
				for(var i=1; i<data.pageCnt+1; i++){
					pageNav += "<li><a href=\"javascript:getUserList(" +i+ ") \">"+i+"</a></li>";
				} */
				
				
				html += "<ul class='pagination'>";
				if(user==1){
					html += "<li> <a href='javascript:getUserList(1);' aria-label='Previous'>&laquo;</span> </a> </li>";
				}else {
					html += "<li class='page-item disabled'><a class='page-link' href='javascript:getUserList(1)'>&lt;</a></li>";
				}
				
				if(user!=1){
					html += "<li><a href='javascript:getUserList(1);' aria-label='Previous'>&laquo;</span></a></li>";
				}else {
					html += "<li class='page-item'><a class='page-link'	href='javascript:getUserList(1);'>&lt;</a></li>";
				}
				
				for (var p = 0; p < 11; p++) {
					html += "<li><a href='javascript:getUserList(p);'>p</a></li>";
				}
				
				html += "<li class='page-item'>";
				if(user==pageCnt){
					html += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1'>Next</a></li>";
					html += "<li class='disabled'><a href='#' aria-label='Next' tabindex='-1'><span aria-hidden='true'>&laquo;</span></a></li>";
				}else if (user!=pageCnt) {
					html += "<li class='page-item'><a class='page-link'	href='javascript:getUserList("+(pageSize+10)+");'>&gt;</a></li>";
					html += "<li class='page-item'><a href='javascript:getUserList(pageCnt);' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
					
				html += "</ul>";
				
				$("#nav").html("");
				$("#nav").html(pageNav);
				
			}
		});
	}
	
	function getUserSearchList(page, key, value) {
		var pageSize = 10;
		console.log("page :" + page);

		$.ajax({
			type : "GET",
			url : "/admin/userPageListAjax",
			data : "page=" + page + "&pageSize=" + pageSize + "&key=" + key + "&value="+ value,
			success : function(data) {
				var html ="";
				$.each(data.pageUserList, function(idx, user){
					html +="<tr class='memList'>";
					html +="<th>"+user.mem_no+"</th>";
					html +="<th>"+user.mem_nm+"</th>";
					html +="<th>"+user.mem_email+"</th>";
					let mem_date = new Date(user.mem_date);
					html += "<th>"+mem_date.getFullYear()+"-"+(mem_date.getMonth()+1)+"-"+mem_date.getDate()+"</th>";
					html +="<th class='hidden'>";
						if(user.mem_gndr == null){
							html+= '<label for="memGndr" class="control-label" >선택안함</label>';
						}else if (user.mem_gndr != null) {
							html += '<label for="memGndr" class="control-label" >';
							 if(user.mem_gndr == 'F'){
								 html += '여자';
							 }else if (user.mem_gndr == 'M') {
								 html += '남자';
							}
							html += '</label>';
						}
					html += "</th>";
					
					html += "<th class='hidden'>";
						if(user.mem_age == '0'){
							html += '<label for="mem_age" class="control-label">선택안함</label>';
						}else if (user.mem_age != null ) {
							html += '<label for="mem_age" class="control-label">'+user.mem_age+'</label>';
						}
					html += "</th>";
					
					html += "<th class='hidden'>";
						if(user.job_nm == null){
							html += '<label for="mem_job" class="control-label">선택안함</label>';
						}else if (user.job_nm != null) {
							html += '<label for="mem_job" class="control-label">'+user.job_nm+'</label>';
						}
					let mem_exdate = new Date(user.mem_exdate);
					html += "</th>";
					html += "<th class='hidden'>"+mem_exdate.getFullYear()+"-"+(mem_exdate.getMonth()+1)+"-"+mem_exdate.getDate()+"</th>";
						if(user.mem_exdate == null){
							html += '<label for="mem_exdate" class="control-label">없음</label>';
						}
					html += "</th>";
					html += "<th class='hidden'>"+user.mem_lvl+"</th>";
					
					html += "<th class='hidden'>"
						if(user.nm == null){
							html += '<label for="nm" class="control-label">선택안함 </label>';
						}else if(user.nm != null){
							html += '<label for="nm" class="control-label" >${page.nm}</label>';
						}
					html += "</th>";
					
					html +="</tr>";
					
				});
				
				$("#userList").html("");
				$("#userList").html(html);
				
				/* var pageNav = ""; 
				for(var i=1; i<data.pageCnt+1; i++){
					pageNav += "<li><a href=\"javascript:getUserList(" +i+ ") \">"+i+"</a></li>";
				} */
				
				
				html += "<ul class='pagination'>";
				if(user==1){
					html += "<li> <a href='javascript:getUserSearchList(1, "+ key +");' aria-label='Previous'>&laquo;</span> </a> </li>";
				}else {
					html += "<li class='page-item disabled'><a class='page-link' href='javascript:getUserSearchList(1, "+ key +")'>&lt;</a></li>";
				}
				
				if(user!=1){
					html += "<li><a href='javascript:getUserSearchList(1, "+ key +");' aria-label='Previous'>&laquo;</span></a></li>";
				}else {
					html += "<li class='page-item'><a class='page-link'	href='javascript:getUserSearchList(1, "+ key +");'>&lt;</a></li>";
				}
				
				for (var p = 0; p < 11; p++) {
					html += "<li><a href='javascript:getUserSearchList(p, "+ key +");'>p</a></li>";
				}
				
				html += "<li class='page-item'>";
				if(user==pageCnt){
					html += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1'>Next</a></li>";
					html += "<li class='disabled'><a href='#' aria-label='Next' tabindex='-1'><span aria-hidden='true'>&laquo;</span></a></li>";
				}else if (user!=pageCnt) {
					html += "<li class='page-item'><a class='page-link'	href='javascript:getUserSearchList("+(pageSize+10)+", , "+ key +");'>&gt;</a></li>";
					html += "<li class='page-item'><a href='javascript:getUserSearchList(pageCnt, "+ key +");' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
					
				html += "</ul>";
				
				$("#nav").html("");
				$("#nav").html(pageNav);
				
			}
		});
	}
	
	var level = null;
	
	$(function() {
	//$(document).ready(function(){
		$("#ex").hide();
		$("#userList").on("click",".memList",function(){
			level = this;
			
			var mem_no = this.children[0].innerText;
			var mem_nm = this.children[1].innerText;
			var mem_email = this.children[2].innerText;
			var mem_date = this.children[3].innerText;
			var mem_gndr = this.children[4].innerText;
			var mem_age = this.children[5].innerText;
			var job_nm = this.children[6].innerText;
			var mem_exdate = this.children[7].innerText;
			var mem_lvl = this.children[8].innerText;
			var nm = this.children[9].innerText;
			
			$("#mem_no").html(mem_no);
			$("#mem_nm").html(mem_nm);
			$("#mem_email").html(mem_email);
			$("#mem_date").html(mem_date);
			$("#mem_gndr").html(mem_gndr);
			$("#mem_age").html(mem_age);
			$("#job_nm").html(job_nm);
			$("#mem_exdate").html(mem_exdate);
			$("#mem_lvl").html(mem_lvl);
			$("#mem_interest").html(nm);
			
			//form 실행
			$('#ex').removeClass('modal');
			$(".modal").modal("show");
			
		});
		
		$("#Declaration").on("click", function() {
			$("#mem_email2").val($("#mem_email").html());
			$("#lvl").val($("#mem_lvl").html());
			console.log(level);
			level.children[8].innerText = level.children[8].innerText-1;
			//form 실행
			$("#fmm").submit();
		});
	});
	
	$(document).ready(function(){
		$("#interest").on("click",function(){
			$(".modal2").modal("show");
		});
	});
	
	$(document).ready(function(){
		$("#close").on("click",function(){
			$(".modal2").modal("c,lose");
		});
		
		$("#back").on("click",function(){
			$(".modal").modal("show");
		});
		
		$('#search').click(function(){
		
			var key = $('#selBox').val();
			var value = $('#searchNm').val();

			getUserSearchList(1, key, value);
		});
	});
	
</script>

<style type="text/css">
.selDiv { text-align: right; align-content: right; margin-bottom: 30px; margin-right: 444px;}
#selBox { 
	width: 100px;
    height: 28px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
}

#searchNm {
	margin-right: 10px;
    width: 300px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
}

#search {
	width: 60px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
    cursor: pointer;
}


.modal a.close-modal {
    position: absolute;
    top: 2.5px;
    right: 1.5px;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
}
.hidden{
	display:none;
}

#Declaration{
	font-size: 9pt;
	border-radius: 25px; 
	border: 2px solid red;
	background-color: white;
	font-family: 'Do Hyeon', sans-serif;
}


 .th{
 	color: #848484;
 }
 
 .table2{
     border: none;
    border-left: 1px solid white;
    border-right: 1px solid white;
 }

</style>
</head>

<div class="admin-title">
	<h2>회원 목록 관리</h2></br>
	<div class="selDiv">	
		<select id="selBox" name="selBox">
				<option value="no">회원 번호</option>
				<option value="nm">회원 닉네임</option>
				<option value="email">회원 이메일</option>
		</select> 
		<input type="text" id="searchNm" name="searchNm" class="searchNm"/>
		<button type="button" id="search">검색</button>
    </div>
    <div id="yd">
	<table class="table table-striped table-hover"  >
		<thead>
		  	<tr >
				<th>회원 번호</th>
				<th>회원 닉네임</th>
				<th>회원 이메일</th>
				<th>가입일자</th>
			</tr>
		</thead>
		 
		<tbody id="userList">
			<c:forEach items="${pageUserList}" var="page">
			<tr class="memList">
				<td>${page.mem_no}</td>
				<td>${page.mem_nm}</td>
				<td>${page.mem_email}</td>
				<td><fmt:formatDate value="${page.mem_date}" pattern="yyyy-MM-dd"/></td>
				<td class="hidden">
				<c:choose>
						<c:when test="${page.mem_gndr == null}">
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
				</td>
					
				<td class="hidden">
				<c:choose>
					<c:when test="${page.mem_age == '0' }">
						<label for="mem_age" class="control-label">선택안함</label>
					</c:when>
					<c:when test="${page.mem_age != null }">
						<label for="mem_age" class="control-label">${page.mem_age}</label>
					</c:when>
				</c:choose>
				</td>
				
				<td class="hidden">
				<c:choose>
					<c:when test="${page.job_nm == null }">
						<label for="mem_job" class="control-label">선택안함</label>
					</c:when>
					<c:when test="${page.job_nm != null }">
						<label for="mem_job" class="control-label">${page.job_nm}</label>
					</c:when>
				</c:choose>
				</td>
				
				<td class="hidden"><fmt:formatDate value="${page.mem_exdate}" pattern="yyyy-MM-dd"/>
				<c:choose>
					<c:when test="${page.mem_exdate == null }">
						<label for="mem_exdate" class="control-label">없음</label>
					</c:when>
				</c:choose>
				</td>
				
				<td class="hidden">${page.mem_lvl}</td>
				
				<td class="hidden" >
					<c:choose>
						<c:when test="${page.nm == null}">
							<label for="nm" class="control-label" >선택안함</label>
						</c:when>
						<c:when test="${page.nm != null}">
							<label for="nm" class="control-label" >${page.nm}</label>
						</c:when>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	 </div>  
	<div class="pagination" id="nav" >
			<ul class="pagination">
				<!-- <li>
					<a href="javascript:getUserList(1);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li> -->
				
				<!-- 페이징 앞부분 처리 -->
				<c:choose>
				<c:when test="${page==1 }">
					<li class="disabled">
						<a href="javascript:getUserList(1);" aria-label="Previous">
							 <span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="page-item disabled">
						<a class="page-link" href="javascript:getUserList(1);" tabindex="-1">&lt;</a>
					</li>
				</c:when>
				<c:when test="${page!=1 }">
					<li>
						<a href="javascript:getUserList(1);" aria-label="Previous"> 
							<span aria-hidden="true">&laquo;</span>
						</a> 
					</li>
					<li class="page-item"><a class="page-link"
						href="javascript:getUserList(1);">&lt;</a>
					</li>
				</c:when>
			</c:choose>
			
				<!-- 페이징처리 -->
				<c:forEach begin="1" end="10" var="p">
					<li><a href="javascript:getUserList(${p});">${p}</a></li>
				</c:forEach>
				<!-- ${pageCnt} -->
				
				
				<%-- <li >
					<a href="javascript:getUserList(${pageCnt});" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li> --%>
				
				<!-- 페이징 뒷부분 처리 -->
				<li class="page-item">
				<c:choose>
					<c:when test="${page==pageCnt }">
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Next</a></li>
						<li class="disabled">
							<a href="#" aria-label="Next" tabindex="-1"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:when>
					
					<c:when test="${page!=pageCnt }">
						<li class="page-item"><a class="page-link"
							href="javascript:getUserList(10);">&gt;</a>
						</li>
						<li class="page-item">
							<a href="javascript:getUserList(${pageCnt});" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:when>
				</c:choose></li>
			</ul>
		</div>
	
	<!-- Modal HTML embedded directly into document -->
			<div id="ex1" class="modal" align="center" style="margin-top: 5px;">
			<form action="/login/mailSender" id="fm" method="post"></br>
			<!-- <input type="hidden" id="memNm" name="memNm"> -->
				<h3 align="center" style="font-family: 'Do Hyeon', sans-serif;">회원상세정보</h3></br>
			<table align="center" class="table2" border="1"> 
				<tbody>
					<th class="form-group">
						<label for="mem_no" >회원번호</label>
						<label for="mem_no" class="th" id="mem_no"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_nm" >닉네임</label>
						<label for="mem_nm" class="th" id="mem_nm"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_email" >Email</label>
						<label for="mem_email" class="th" id="mem_email" ></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_gndr" >성별</label>
						<label for="mem_gndr" class="th" id="mem_gndr"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_gndr" >연령대</label>
						<label for="mem_gndr" class="th" id="mem_age"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="job_nm" >직업</label>
						<label for="job_nm" class="th" id="job_nm"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_date" >가입날짜</label>
						<label for="mem_date" class="th" id="mem_date"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_exdate" >탈퇴날짜</label>
						<label for="mem_exdate" class="th" id="mem_exdate"></label>
					</th>
				</tbody>
				<tbody>
					<th class="form-group">
						<label for="mem_lvl" >신고레벨</label>
						<label for="mem_lvl" class="th" id="mem_lvl"></label>
						<input type="button" id="Declaration" class="btns3" value="신고" />
					</th>
				</tbody>
			</table>
			  	</br>
			  	
			  	  <div  align="center" style="font-family: 'Do Hyeon', sans-serif; ">
					<input type="button" id="interest" class="btns1" value="관심사보기" />
					<input type="button" id="pass_y" class="btns2" value="비밀번호 초기화" />
					
				  </div>
				  </form>
			</div>
			
			<!-- 신고버튼 선택시 컨틀러이동 처리 -->
			<form action="/admin/declaration" id="fmm" method="post">
				<input type="hidden" id="mem_email2" name="mem_email">
				<input type="hidden" id="lvl" name="mem_lvl">
			</form>
			
			<div id="ex" class="modal2">
			<form action="/login/mailSender" id="fm" method="post">
			<!-- <input type="hidden" id="memNm" name="memNm"> -->
				</br><h3 align="center" >관심사보기</h3></br>
			  	<table>
			  		<tbody>
						<th class="form-group" >
							<label for="mem_interest" align="center" class="control-label" id="mem_interest"></label>
						</th>
					</tbody>
				</table>
				  </form>
			</div>
			
			
	
</div>
</html>