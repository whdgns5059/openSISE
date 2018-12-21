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
		<!-- 지도-->
		<div id="map"></div>
		<!-- 지도 오버레이(지역분석으로 이동) -->
		<div class="toLocal">
			<img src="https://via.placeholder.com/100x100/fd7e14?text=TO_LOCAL" />
		</div>
	</div>	
	<div class="detailcontainer">
		<div class="info">
			<div>
				<%-- 매물 디테일 정보 --%>
				<input type="hidden" id="artcl_gu" value="${selectArticleVo.artcl_gu }"/>
				<input type="hidden" id="artcl_dong" value="${selectArticleVo.artcl_dong }"/>
				<input type="hidden" id="artcl_zip" value="${selectArticleVo.artcl_zip }"/>
				<input type="hidden" id="artcl_rd" value="${selectArticleVo.artcl_rd }"/>
				<input type="hidden" id="dl_ty" value="${dl_ty}"/>
				
				<h1>${selectArticleVo.artcl_complx }</h1>  
				<a href="#">거리뷰 보기</a><br/> 
				<span>${selectArticleVo.artcl_gu} ${selectArticleVo.artcl_dong} ${selectArticleVo.artcl_zip} / ${selectArticleVo.artcl_rd}</span>  <br/>
				<span>준공년도 : ${selectArticleVo.artcl_const_y }년</span>
				<input type="hidden" id="lat" value="${selectArticleVo.artcl_lat }"/>
				<input type="hidden" id="lng" value="${selectArticleVo.artcl_lng}"/>
			</div>
			<div class="like">
				<span>찜하기</span> 
				<img src="/img/heart.png" class="heartimg" width="20px" height="20px"/>
				<div>
					<h4>최근 x명이 해당 매물을 찜 했습니다.</h4>
				</div>
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
						<a class="nav-link tag-yellow areatab" data-toggle="tab" aira-expanded="true" href="#">${sel }<br/><fmt:formatNumber value="${sel/3.3 }" pattern=".0"/>평</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="chartajax">
			</div>
		</div>
		<div>
			<hr/>
		</div>
		<div>
			<img src="https://via.placeholder.com/1100x200"/>
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
							<div>
								<label>파일 첨부</label>
								<input type="button" class="plusfile" value="+"/>
								<input type="button" class="minusfile" value="-"/>
								<div class="inputDiv">
									<input type="file" class="post_img" name="post_img" id="post_img1" />
								</div>
							</div>
							<div class="row">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰 별점 &nbsp;&nbsp;&nbsp;</label>
								<div id="star" ></div>
									<input type="hidden" id="starRating" name="post_star" value="3"/>
									<hr/>
							</div>
							<div>
								<input type="button" class="btn" id="insertReview" value="작성" />
								<input type="button" class="btn close" id="cancelReview" class="close" value="취소" />
							</div>
						</div>
					</form>
				</div>
			</div>	
			<div>
				<hr/>
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
						<div class="reviewWrapper">
							<div class="titleWrapper">
								<div class="reviewNo">${postVo.post_no }</div>
								<div class="reviewDate">${postVo.post_date }</div>
								<div class="reviewTitle">${postVo.post_ttl}</div>
								<div class="reviewWriter">${postVo.post_mem } </div>
							</div>
							<div class="reviewDetailWrapper">
								<div class="starDivWrapper">
									<div class="starReview"></div>
									<div class="starDiv">
										<input class="reviewStarInput" id="reviewStarRating" type="text" value="${postVo.post_star }"/>
									</div>
									<div class="reportDiv"><img src="https://via.placeholder.com/30"/></div>
								</div>
								<div class="photo">
								</div>
								<div class="reviewText">
									<p>${postVo.post_cntnt }
									</p>
								</div>
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
								<div class="floatclear"></div>
								<div>
									<hr/>
								</div>
								<div class="replyWrapper">
									<input type="hidden" class="post_noChk" value="${postVo.post_no }"/>
									<div class="reply">
									</div>
									<div class="writeReply form-inline">
										<div class="form-group replyinsertDiv">
												<input type="text" class="form-control replyInput" name="rpl_cntnt" placeholder="댓글을 작성해 주세요"/>
												<input type="hidden" class="post_no" value="${postVo.post_no }"/>
										</div>
										<input type="button" class="insertReply btn"/>
									</div>
								</div>
							</div>
						</div>		
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</div>


<script src="/js/detail.js"></script>