<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/detail.css" rel="stylesheet">

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
			<img src="https://via.placeholder.com/1150x200"/>
		</div>
		<div>
			<img src="https://via.placeholder.com/1150x200"/>
		</div>
		<div>
			<img src="https://via.placeholder.com/1150x200"/>
		</div>
		<div>
			<img src="https://via.placeholder.com/1150x200"/>
		</div>
		<div>
			<img src="https://via.placeholder.com/1150x200"/>
		</div>
	</div>
</div>


<script src="/js/detail.js"></script>