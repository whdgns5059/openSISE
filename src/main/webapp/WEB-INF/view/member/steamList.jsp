<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<script>
$(document).ready(function(){
	$(".img").on("click", function(){
		if(this.src == "http://localhost:8081/img/heart-outline.png"){
			this.src = ("../img/heart.png");
		}else{
			this.src = ("../img/heart-outline.png");
			location.href = '/mypage/steamListUpdate?favor_no='+this.value;
					
		/* 	$.ajax({
				contentType : "application/json; charset=utf-8",
			    url:"/mypage/steamListUpdate",
			    type: "POST",
			    data : {favor_no : this.value},
			    dataType : "json",
			    success:function(dt){
			    	var html="";
			    	html += "<input type='image' src='../img/heart.png' width='15' height='15' class='img' value='${steam.favor_no}'>";
			    	
			    	 $("#img").html("");
			         $("#img").html(html);
			    }
				
		}; */
	};

	});
});
</script>
</head>

<body>
<div class="admin-title">
	<h1>찜 목록 <img src="../img/heart.png" width="45px" height="45px" /></h1>
		<div class="hr2">
			<table border="1">
				<tr>
					<th>매물명</th>
					<th>매물정보</th>
					<th>찜 <img src="../img/heart.png" width="18px" height="18px" />
					</th>
				</tr>
				<c:forEach items="${steamVo}" var="steam">
						<tr>
							<td>${steam.artcl_nm}</td>
							<td>${steam.artcl_gu}${steam.artcl_dong}${steam.artcl_zip}${steam.artcl_rd}</br>
								<c:choose>
									<c:when test="${steam.dl_rnt!= 0}">
									${steam.dl_rnt} 원
									</c:when> 
									<c:when test="${steam.dl_depos != 0}">
									${steam.dl_price} 원
									</c:when>
									<c:when test="${steam.dl_price != 0}">
									${steam.dl_price} 원
									</c:when>
								</c:choose></td>
							<td >
							<input type="image" src="../img/heart.png" width="15" height="15" class="img" value="${steam.favor_no}">						
							</td>
						</tr>
					</c:forEach>
			</table>
		</div>
</div>
</body>
</html>