<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/detail.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery.raty.js"></script>

<div id="mask"></div>	
<div class="row">
	<div id="mapWrap">
		<!-- 지도-->
		<div id="map"></div>
		<!-- 지도 오버레이(지역분석으로 이동) -->
		<div class="toLocal">
			<img src="https://via.placeholder.com/100x100?text=toLocal" />
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
				<span>찜하기</span> <img src="/img/heart.png" width="25px" height="25px"/>
				<br/>
				<h4>최근 x명이 해당 매물을 찜 했습니다.</h4>
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
						<a class="nav-link tag-yellow areatab" data-toggle="tab" aira-expanded="true" href="#">${sel }</a>
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
			<img src="https://via.placeholder.com/1100x200"/>
		</div>
		<div>
			<img src="https://via.placeholder.com/1100x200"/>
		</div>
		<div id="review">
			<div>	
				<button type="button" class="btn openMask" >글쓰기</button>
				<div class="window reviewWindow" id="reviewWindow">
					<form id="reviewFrm" action="/detail/insertReview" method="post">
						<div class="notice-pop">
							<div>
								<h2>리뷰 쓰기</h2>
								<hr/>
							</div>
							<div> 
								<input type="hidden" name="post_mem" value="${nowLogin.mem_no }"/>
								<input type="hidden" name="post_brd" value="1"/>
								<input type="hidden" name="post_gu" value="${selectArticleVo.artcl_gu}"/>
								<input type="hidden" name="post_dong" value="${selectArticleVo.artcl_dong}"/>
								<input type="hidden" name="post_zip" value="${selectArticleVo.artcl_zip}"/>
								<input type="hidden" name="post_rd" value="${selectArticleVo.artcl_rd}"/>
							</div>
							<div class="form-group">
								<label>제목</label>
								<input type="text" class="form-control" name="post_ttl" placeholder="제목을 입력하세요">
							</div>	
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="10" name="post_cntnt" ></textarea>
							</div>
							<div id="star" ></div>
								<input type="hidden" id="starRating" name="post_star" value="3"/>
							<div>
								<input type="button" class="btn" id="insertReview" value="작성" />
								<input type="button" class="btn" id="cancelReview" class="close" value="취소" />
							</div>
						</div>
					</form>
				</div>
			</div>	
			<c:forEach items="${selectReview }" var="postVo" varStatus="status">
				<div class="reviewWrapper">
					<div class="titleWrapper">
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
							<img src="https://via.placeholder.com/200" />
							<img src="https://via.placeholder.com/200" />
						</div>
						<div class="reviewText">
							<p>${postVo.post_cntnt }
							</p>
						</div>
						<div class="reviewModify">
							<button>수정</button><button>삭제</button>
						</div>
						<div class="replyWrapper">
							<div class="reply">
								fewfw*** : 야호호오오오ㅗ오오옹 <br/>
								fed2***  : 야호돚도롲돌졷ㄹ<br/>
							</div>
							<div class="writeReply">
								<input type="text" /> <button>입력</button>
							</div>
						</div>
					</div>
				</div>		
			</c:forEach>
		</div>

	</div>
</div>


<script src="/js/detail.js"></script>