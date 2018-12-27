<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
.window{
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
    height: 566px;
}
.notice-content{
	padding: 8px 90px !important;
}
</style>

<script src="/SE2/js/HuskyEZCreator.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$(".postClick").on("click",function(){
			var post_no = $(this).children()[3].innerText;
// 			alert(post_no);
			$("#posts_no").val(posts_id);
			// .submit();
			$("#psDetail").submit();
		});
		$(".insertPost").on("click",function(){
			$("#insertPost").submit();
		});
		
		$("#searchbtn").on("click",function(){
			$("#searchForm").submit();
		});
		
		//검은 막 띄우기
		$(".openMask").click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$(".window .close").click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$("#mask, .window").hide();
		});

		//검은 막을 눌렀을 때
		$("#mask").click(function() {
			$(this).hide();
			$(".window").hide();

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
        $(".window").show();
        
    }
    
    // 공지사항 window 내용 fade 효과
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
			<form action="">
				<select>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text"/>
				<input type="submit" name="search" id="search" value="검색">
			</form>
		</div>
		<div>
			<form action="/manage/notice/insertView">
				<input type="submit" value="공지등록">
			</form>
		</div>
		<table border="1" style="width: 800px;">
			<thead>
				<tr class="openMask">
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
					<tr class="postClick">
						<td>${status.count }</td>
						<td class="openMask">${noticeVo.post_ttl }</td>
						<td>${noticeVo.post_date }</td>
						<td style="display: none;">${noticeVo.post_no}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<form id="psDetail" action="/manage/notice/postDetail" method="get">
		<input type="hidden" id="post_no" name="post_no"/>
	</form>
	
	
	<div class="notice">

		<!-- 공지사항 팝업용  -->
		<div id="mask"></div>
		<div class="window">
			<h2>공지사항</h2>
			<a href="#" class="close">닫기X</a>
			<hr />
			<div class="notice-pop">
				<table class="table table-striped notice-tbl">
							<thead>
								<tr>
									<td style="width: 30px;">no.</td>
									<td>제목</td>
									<td>작성일</td>
								</tr>
								
			<!-- 공지사항 반복될 구간 START -->					
								<c:forEach items="${noticeList }" var="noticeVo" varStatus="status">
									<tr>
										<td style="width: 30px;">${status.count }</td>
										<td onclick="noticeFade('${noticeVo.post_no}')">${noticeVo.post_ttl }</td>
										<td>${noticeVo.post_date }</td>
									</tr>
									<tr>
										<td colspan="3" id="${noticeVo.post_no}" class="notice-content" style="display: none;" >${noticeVo.post_cntnt }</td>
									</tr>
								</c:forEach>
			<!-- 공지사항 반복될 구간 END -->	
							</thead>
						</table>
				<button>수정</button>
				<button>삭제</button>
			</div>
		</div>
	</div>
</div>