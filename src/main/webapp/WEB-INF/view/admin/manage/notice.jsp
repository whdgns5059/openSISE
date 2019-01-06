<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- pagination -->
<link href="/css/pagination.css" rel="stylesheet">

<style type="text/css">
/* 마스크 띄우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window {
    left: 50%;
    width: 1000px;
    height: 700px;
    background-color: #FFF;
    z-index: 10000;
    border-radius: 20px;
    position: fixed;
    margin-left: -25%;
    top: 50%;
    margin-top: -350px;
    overflow: auto;
    padding: 30px 20px 20px 20px;
    display: none;
}
.modify { 
    left: 50%; 
    width: 700px; 
    height: 650px; 
    background-color: #FFF; 
    z-index: 10000; 
    border-radius: 20px; 
    position: fixed; 
    margin-left: -25%; 
    top: 50%; 
    margin-top: -350px; 
    overflow: auto; 
    padding: 30px 20px 20px 20px; 
    display: none; 
} 
.window h2{
    float: left;
    display: contents;
}
.close{
	font-size: 14px;
	color: black;
}
.notice-pop{
 	margin: 0 auto;
    width: 850px;
    height: 566px;
	overflow:scroll;
	overflow-x:hidden; 
	overflow-y:auto;
}
.notice-tbl{
    margin: 0 auto;
    width: 830px;
    height: 20px;
}
.notice-content{
	padding: 8px 90px !important;
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
    margin-bottom: 10px;
    float:left;
}
#submit {
	width: 80px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    color: #808080;
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
    cursor: pointer;
    float:right;
}
#selBox {
	margin-right: 10px;
	width: 100px;
	height: 30px;
	border: 1px solid #d8d8d8;
	border-radius: 5px;
	color: #808080;
	font-family: 'Noto Sans KR', sans-serif;
	float:left;
}
#searchNm{
	margin-right: 10px;
	width: 300px;
    height: 30px;
    border: 1px solid #d8d8d8;
    border-radius: 5px;
    float:left;
}
.rptCfBtn{
	width: 70px;
	background: white;
	margin-right: 5px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 13px;
	font-weight: 500;
}

.noticeList{
	cursor: pointer;
}

</style>

<script src="/SE2/js/HuskyEZCreator.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
// 		$(".postClick").on("click",function(){
// 			var post_no = $(this).children()[3].innerText;
// 			alert(post_no);
// 			$("#posts_no").val(post_no);
// 			// .submit();
// 			$("#psDetail").submit();
// 		});
		$(".insertPost").on("click",function(){
			$("#insertPost").submit();
		});
		
		$("#searchbtn").on("click",function(){
			$("#searchForm").submit();
		});
		
		//검은 막 띄우기
		$(".table").on('click', '.openMask', function(e) {
			action='listView';
			
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$(".window .close").click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$("#mask, .window").hide();
		});
		
		$("#myModal .close").click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$("#mask, #myModal").hide();
		});

		//검은 막을 눌렀을 때
		$("#mask").click(function() {
			$(this).hide();
			$(".window").hide();
			$("#myModal").hide();

		});


		//삭제하기 버튼 클릭
		$("button[name='delete']").click(function(e){
// 			alert("delete");
			alert("삭제하시겠습니까?");
			action='delete';
			
			var row=$(this).parent().parent().parent();
			var tr = row.children();
			
			var post_no = tr.eq(3).text();
			
			$.ajax({
				type : "POST",
				url : "/manage/notice/deleteNotice",
				data : "post_no="+post_no,
				success : function(data){
// 					//공지사항리스트
// 					var html = data;
					
// 					// 지우는 작업
// 					$(".table").html("");
// 					// 다시 입히는 방법 
// 					$(".table").html(html);
				}

			});
			
			
		location.reload();
		});
		
		//수정하기 버튼 클릭
		$("button[name='modify']").click(function(e){
			action='modify';
// 			type='PUT';
// 			bno=this.value;
			
			//content 담기
			var row=$(this).parent().parent().parent();
			var tr = row.children();
			
			var post_no = tr.eq(3).text();
			var title = tr.eq(1).text();
			var contents = tr.eq(5).text();
			
			$("#modal-title").text("수정하기");
			
			$("#title").val(title);
			$("#contents").val(contents);
			
			e.preventDefault();
			wrapWindowByMask();
			
			
			$("#modalSubmit").click(function(){
// 				alert("수정");
				
				//수정된 값 담기
				if(title !=null){
					title = $("#title").val();
				}
				
				if(contents != null){
					contents = $("#contents").val();
				}
				
				$.ajax({
						type : "POST",
						url : "/manage/notice/updateNotice",
						data : "post_no="+post_no+"&post_ttl="+title+"&post_cntnt="+contents,
						success : function(data){
							//공지사항리스트
// 							var html = "";
// 							$.each(data.pageNoticeList , function(idx , noticeVo,pageVo){
// 								html += "<tr class='noticeList'>";
// 								html += "<td>"+pageVo.rnum+"</td>";
// 								html += "<td class='openMask'>"+noticeVo.post_ttl +"</td>";
// 								html +=	"<td>"+noticeVo.post_date +"</td>";
// 								html +=	"<td style='display: none;'>"+noticeVo.post_no+"</td>";
// 								html += "</tr>";
// 							});
// 							// 지우는 작업
// 							$("#noticeModify").html("");
// 							// 다시 입히는 방법 
// 							$("#noticeModify").html(html);
							location.reload();
							
							//모달창으로 공지사항 상세보기
							var modalView = "";
							$.each(data.pageNoticeList , function(idx , noticeVo){
								modalView += "<tr>";
								modalView += "	<td style='width: 30px;'>"+noticeVo.rnum+"</td>";
								modalView += "	<td  class='test'  onclick='noticeFade("+noticeVo.post_no+")'>"+noticeVo.post_ttl +"</td>";
								modalView += "	<td>"+noticeVo.post_date +"</td>";
								modalView += "	<td style='display: none;'>"+noticeVo.post_no +"</td>";
								modalView += "	<td>";
								modalView += "		<div class='btn-group'>";
								modalView += "			<button name='modify' value='"+noticeVo.post_no+"' class='btn' style='width: 70px;'>수정</button>";
								modalView += "			<button name='delete' value='"+noticeVo.post_no+"' class='btn' style='width: 70px;'>삭제</button>";
								modalView += "		</div>";
								modalView += "	</td>";
								modalView += "	<td style='display: none;'>"+noticeVo.post_cntnt+"</td>";
								modalView += "</tr>";
								modalView += "<tr>";
								modalView += "	<td colspan='4' id='"+noticeVo.post_no+"' class='notice-content post_cntnt' style='display: none;' >"+noticeVo.post_cntnt+"</td>";
								modalView += "</tr>";
							});
							// 지우는 작업
							$("#ListView").html("");
							// 다시 입히는 방법 
							$("#ListView").html(modalView);
						
						}
					
				});
			});
			
		});
		
   
	});
	
	
	//<![CDATA[
    function wrapWindowByMask(){
    	
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
 
        //윈도우(팝업창) 띄운다.
        if(action == 'listView'){
	        $(".window").show();
	        $("#myModal").hide();
        }else if(action=='modify'){
        	$("#myModal").show();
        	$(".window").hide();
        }
        
    }
    
    // 공지사항 window 내용 fade 효과
    $(".notice-tbl").on('click', '.test', function(id){
    	noticeFade(id);
    });
    
    function noticeFade(id){
		var the = "#" + id;
		$(the).fadeToggle("fast");
	}
</script>
   
<div class="admin-title">
	<h2>공지사항</h2>
	<div class="hr2">
	</div>
	<div>
		<div style="display: inline;">
			<form action="/manage/notice/searchNotice" style="width: 100%;">
				<select id="selBox" name="selBox">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="all">전체</option>
				</select>
				<input type="text" id="searchNm" name="searchNm"/>
				<input type="submit" name="search" id="search" value="검색">
			</form>
			<form action="/manage/notice/insertView">
				<input id="submit" type="submit" value="공지등록">
			</form>
		</div>
		<table class="table" >
			<thead>
				<tr class="openMask">
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody id="noticeModify">
				<c:forEach items="${pageNoticeList }" var="noticeVo" varStatus="status">
					<tr class="noticeList">
						<td>${noticeVo.rnum }</td>
						<td class="openMask">${noticeVo.post_ttl }</td>
						<td>${noticeVo.post_date }</td>
						<td style="display: none;">${noticeVo.post_no}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 페이징 -->
	<div class="text-center">
		<ul class="pagination">
			<c:choose>
				<c:when test="${page==1 }">
					<li class="disabled"><a href="#" aria-label="Previous"
						tabindex="-1"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>

				</c:when>
				<c:when test="${page!=1 }">
					<li><a
						href="/manage/notice/notice?page=1&pageSize=10"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="/manage/notice/notice?page=${page-1 }&pageSize=10">Previous</a>
					</li>
				</c:when>
			</c:choose>

			<!-- 기본page -->
			<c:set var="pageCnt" value="${pageCnt }" />
			<c:forEach begin="1" end="${pageCnt }" var="p">

				<li><a
					href="/manage/notice/notice?page=${p}&pageSize=10">${p }</a></li>
			</c:forEach>
			<!-- 기본page -->

			<li class="page-item">
				<c:choose>
					<c:when test="${page==pageCnt }">
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Next</a></li>
						<li class="disabled"><a href="#" aria-label="Next" tabindex="-1"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>
					<c:when test="${page!=pageCnt }">
						<li class="page-item"><a class="page-link"
							href="/manage/notice/notice?page=${page+1 }&pageSize=10">Next</a>
						</li>
						<li><a
							href="/manage/notice/notice?page=${pageCnt }&pageSize=10"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
				</c:choose></li>

		</ul>
	</div>

	<div class="notice">

		<!-- 공지사항 팝업용  -->
		<div id="mask"></div>
		<div class="window">
			<h2>공지사항</h2>
			<a href="#" class="close">닫기X</a>
			<hr />
			<div class="notice-pop">
				<table class="table notice-tbl">
							<thead>
								<tr>
									<td style="width: 30px;">no.</td>
									<td>제목</td>
									<td colspan="2">작성일</td>
								</tr>
								
			<!-- 공지사항 반복될 구간 START -->		
							<tbody id="ListView">		
								<c:forEach items="${pageNoticeList }" var="noticeVo" varStatus="status">
									<tr>
										<td style="width: 30px;">${status.count }</td>
										<td  class="test"  onclick="noticeFade('${noticeVo.post_no}')">${noticeVo.post_ttl }</td>
										<td>${noticeVo.post_date }</td>
										<td style="display: none;">${noticeVo.post_no }</td>
										<td>
											<div class="btn-group">
												<button name="modify" value="${noticeVo.post_no }" class="btn rptCfBtn" >수정</button>
												<button name="delete" value="${noticeVo.post_no }" class="btn rptCfBtn" >삭제</button>
											</div>
										</td>
										<td style="display: none;">${noticeVo.post_cntnt }</td>
									</tr>
									<tr>
										<td colspan="4" id="${noticeVo.post_no}" class="notice-content post_cntnt" style="display: none;" >${noticeVo.post_cntnt }</td>
									</tr>
								</c:forEach>
							</tbody>	
			<!-- 공지사항 반복될 구간 END -->	
							</thead>
						</table>
			</div>
		</div>
		<!-- 공지사항 수정 팝업용 -->
		<div class="modify" id="myModal" role="dialog">
			<div class="modal-dialog">
				
				<!-- content -->
				<div class="modal-content">
					<div class="modal-header">
						<h4 id="modal-title" class="modal-title"></h4>
						<button type="button" class="close" >닫기&times;</button>
					</div>
					<div class="modal-body">
						<table class="table">
							<tr>
								<td>제목</td>
								<td><input class="form-control" id="title" type="text"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea class="form-control" id="contents" rows="10"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button id="modalSubmit" type="button" class="btn" style="background-color: white;">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>