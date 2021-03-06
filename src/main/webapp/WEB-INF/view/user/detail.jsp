<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link href="/css/detail.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery.raty.js"></script>


<div id="mask"></div>	
<div class="row">
	<div id="mapWrap">
		<img alt="뒤로가기" src="../../img/back.png" id="image">
		<!-- 지도-->
		<div id="map"></div>
		<!-- 지도 오버레이(지역분석으로 이동) -->
		<div class="toLocal">
			<img src="/img/to_local.png" width="280" height="200"/>
		</div>
		<ul id="category">
			<li id="BK9" data-order="0"> 
				<span class="category_bg bank"></span>
				은행
			</li>       
			<li id="MT1" data-order="1"> 
				<span class="category_bg mart"></span>
				마트
			</li>  
			<li id="PM9" data-order="2"> 
				<span class="category_bg pharmacy"></span>
				약국
			</li>  
			<li id="OL7" data-order="3"> 
				<span class="category_bg oil"></span>
				주유소
			</li>  
			<li id="CE7" data-order="4"> 
				<span class="category_bg cafe"></span>
				카페
			</li>  
			<li id="CS2" data-order="5"> 
				<span class="category_bg store"></span>
				편의점
			</li>      
		</ul>
	</div>	
	<div class="detailcontainer">
		<div>
			<c:choose>
				<c:when test="${articleVo.building eq 'apt'}">
					<h1 class="buildingName">${selectArticleVo.artcl_complx } 아파트 (${dl_ty})</h1>  
				</c:when>
				<c:when test="${articleVo.building eq 'office'}">
					<h1 class="buildingName">${selectArticleVo.artcl_complx } (${dl_ty})</h1>  
				</c:when>
				<c:otherwise>
					<h1 class="buildingName">${selectArticleVo.artcl_rd} (${dl_ty})</h1>  
				</c:otherwise>
			</c:choose>
			<hr/>
		</div>
		<div class="info">
			<div>
				<%-- 매물 디테일 정보 --%>
				<input type="hidden" id="mem_no" value="${nowLogin.mem_no }"/>
				<input type="hidden" id="artcl_gu" name ="artcle_gu" value="${selectArticleVo.artcl_gu }"/>
				<input type="hidden" id="artcl_dong" name ="artcle_dong" value="${selectArticleVo.artcl_dong }"/>
				<input type="hidden" id="artcl_zip" name ="artcle_zip" value="${selectArticleVo.artcl_zip }"/>
				<input type="hidden" id="artcl_rd" name ="artcle_rd" value="${selectArticleVo.artcl_rd }"/>
				<input type="hidden" id="loc" name="searchName" value="${articleVo.searchName}"/>
				<input type="hidden" id="dl_ty" name ="dl_ty" value="${articleVo.dl_ty}"/>
				<input type="hidden" id="buildingss" name ="building" value="${articleVo.building}"/>
				
				<span class="bldInfo">${selectArticleVo.artcl_gu} ${selectArticleVo.artcl_dong} ${selectArticleVo.artcl_zip}</span><br/>
				<span class="bldInfo">${selectArticleVo.artcl_rd}</span>  <br/>
				<span class="bldInfo">준공년도 : ${selectArticleVo.artcl_const_y }년</span>
				<input type="hidden" id="lat" value="${selectArticleVo.artcl_lat }"/>
				<input type="hidden" id="lng" value="${selectArticleVo.artcl_lng}"/>
			</div>
			<div class="like">
				<input type="hidden" id="favor_no" value="${selFavor.favor_no }" />
				<span class="bldInfo redLike">찜하기</span> 
				<img id="likely" src="/img/heart-outline.png" class="heartimg" width="20px" height="20px"/> <br/>
				<span id="favorCount" class="bldInfo bldInfo2">${favorCount }명이 해당 매물을 찜 했습니다.</span>
			</div>
		</div>
		<div>
			<hr/>
		</div>
		<div>
			<div class="area">
				<ul class="nav nav-tabs tab-yellow">
					<c:forEach items="${selectAreas }" var="sel">
						<li role="presentation" class="active">
						<a class="nav-link tag-yellow areatab" data-toggle="tab" aira-expanded="true" href="#"><input type="hidden" class="selVal" value="${sel }"/><fmt:formatNumber value="${sel/3.3 }" pattern=".0"/>평</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="chartajax">
			</div>
		</div>
		<div>
			<div id="radarChartDiv">
			</div>	
		</div>
		<div>
			<hr/>
		</div>
		<div id="review">
			<div>
				<button type="button" class="btn openMask" >리뷰 작성</button>
				<div class="window reviewWindow" id="reviewWindow">
					<form id="reviewFrm" action="/detail/insertReview" method="post" enctype="multipart/form-data">
						<div class="notice-pop">
							<div>
								<h2>리뷰 작성</h2>
								<hr/>
							</div>
							<div class="starDiv">
								<label class="floatLeft">시세 별점 &nbsp;&nbsp;&nbsp;</label>
								<div id="star"  class="floatLeft"></div>
								<input type="hidden" id="starRating" name="post_star" value="3"/>
							</div>
							<div> 
								<input type="hidden" name="post_mem" value="${nowLogin.mem_no }"/>
								<input type="hidden" name="post_brd" value="1"/>
								<input type="hidden" name="post_gu" value="${selectArticleVo.artcl_gu}"/>
								<input type="hidden" name="post_dong" value="${selectArticleVo.artcl_dong}"/>
								<input type="hidden" name="post_zip" value="${selectArticleVo.artcl_zip}"/>
								<input type="hidden" name="post_rd" value="${selectArticleVo.artcl_rd}"/>
								<input type="hidden" name="dl_ty" value="${dl_ty }"/>
							</div>
							<div class="form-group">
								<label>제목</label>
								<input type="text" class="form-control" name="post_ttl" id="post_ttl" placeholder="제목을 입력하세요">
							</div>	
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="10"  id="post_contnt" name="post_cntnt" ></textarea>
							</div>
							<div class="modal-file">
								<label>파일 첨부</label>
								<input type="button" class="plusfile" value="+"/>
								<input type="button" class="minusfile" value="-"/>
								<div class="inputDiv">
									<input type="file" class="post_img" name="post_img" id="post_img1" />
								</div>
							</div>
							
							<div class="sendDiv">
								<input type="button" class="btn close btnYN" id="cancelReview" class="close" value="취소" />
								<input type="button" class="btn btnYN" id="insertReview" value="작성" />
							</div>
						</div>
					</form>
				</div>
			</div>	
				<c:choose>
					<c:when test="${fn:length(selectReview) == 0 }">
						<div class="noreivew">
							<h3>리뷰가 없습니다.</h3>
							<h4>새 리뷰를 작성하여 정보를 공유하세요!</h4>
						</div>	
					</c:when>
				<c:otherwise>
					<c:forEach items="${selectReview }" var="postVo" varStatus="status">
						<c:if test="${postVo.post_exst eq 'N' }" >
						<div class="reviewWrapper">
							<div class="titleWrapper">
								<div class="reviewNo">${postVo.post_no }</div>
								<div class="reviewTitle">${postVo.post_ttl}</div>
								<div class="reviewWriter">${postVo.mem_nm} </div>
								<div class="reviewDate">
									${fn:substring(postVo.post_date, 0, 10)  }
								</div>
							</div>
							<div class="reviewDetailWrapper">
								<div class="starDivWrapper">
									<div class="starReview"></div>
									<div style="padding:0 !important;">
										<input class="reviewStarInput" id="reviewStarRating" type="hidden" value="${postVo.post_star }"/>
									</div>
									<!-- REPORT 신고 START -->
									<div class="reportDiv">
										<img src="/img/alert.png" width="40" height="40" style="float: right; margin-right: 50px;"/>
										<input class="rpt_post" value="${postVo.post_no }" type="hidden" />
									</div>
									<!-- REPORT 신고 END -->
								</div>
								<div class="photo">
								</div>
								<div class="reviewText">
									<p>${postVo.post_cntnt }
									</p>
								</div>
								<c:if test="${postVo.post_mem eq nowLogin.mem_no}" >
									<div class="reviewModify row">
										<div class="updateReview">
											<input type="hidden" class="post_no" name="post_no" value="${postVo.post_no }"/>
											<input type="hidden" class="dl_ty" name="dl_ty" value="${dl_ty }"/>
											<button class="btn">수정</button>
										</div>
										<div class="deleteReview">
											<input type="hidden" class="post_no" name="post_no" value="${postVo.post_no }"/>
											<input type="hidden" class="dl_ty" name="dl_ty" value="${dl_ty }"/>
											<button class="btn">삭제</button>
										</div>
									</div>
								</c:if>
								<div class="floatclear"></div>
								<div style="padding-right: 40px;">
									<hr/>
								</div>
								<div class="replyWrapper">
									<input type="hidden" class="post_noChk" value="${postVo.post_no }"/>
									<div class="reply">
									</div>
									<div class="writeReply form-inline">
										<div class="form-group replyinsertDiv insrtDiv">
												<input type="text" class="form-control replyInput" name="rpl_cntnt" placeholder="댓글을 작성해 주세요"/>
												<input type="hidden" class="post_no" value="${postVo.post_no }"/>
										</div>
										<input type="button" class="insertReply btn" value="댓글작성"/>
									</div>
								</div>
							</div>
						</div>		
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<form action="/main/main" id="frmt">
		<input type="hidden" name="searchName" value="${articleVo.searchName}">
		<input type="hidden" name="building" value="${articleVo.building}">
		<input type="hidden" name="dl_ty" value="${articleVo.dl_ty}">
	</form>
</div>
<script>
//이미지 클릭 시 이전 페이지로 이동
$("#image").on("click",function(){
	$("#frmt").submit();
});
</script>

<script src="/js/detail.js"></script>