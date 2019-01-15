<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div id="lngLat">
	<input type="hidden" id="listSize" value="${buildingSaleListSize}" />
 </div>
<!-- 매물리스트  -->
	<div class="articles">
		<form action="/detail/info" id="frmDetail">
			<input type="hidden" id="artcl_gu" name="artcl_gu">
			<input type="hidden" id="artcl_dong" name="artcl_dong">
			<input type="hidden" id="artcl_zip" name="artcl_zip">
			<input type="hidden" id="artcl_rd" name="artcl_rd">
			<input type="hidden" id="ty" name="dl_ty" value ="${dlType}">
			<input type="hidden" id="sea" name="searchName" value ="${searchName}">
		</form>
		<c:choose>
			<c:when test="${buildingSaleListSize != 0}">
				<c:forEach items="${buildingSaleList}" var="build">
					<div class="article">
					<input type="hidden" class="lat" value="${build.artcl_lat}">
					<input type="hidden" class="lng" value="${build.artcl_lng}">
					<input type="hidden" id="gu" value="${build.artcl_gu}">
					<input type="hidden" id="dong" value="${build.artcl_dong}">
					<input type="hidden" id="zip" value="${build.artcl_zip}">
					<input type="hidden" id="rd" value="${build.artcl_rd}">
						<c:choose>
							<c:when test="${build.artcl_bc == 'apt'}">
								<h4>${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${build.artcl_bc == 'multi'}">
								<h4>${build.artcl_rd}</h4>
							</c:when>
							<c:when test="${build.artcl_bc == 'multip'}">
								<h4>${build.artcl_nm}</h4>
							</c:when>
							<c:when test="${build.artcl_bc == 'single'}">
								<h4>${build.artcl_rd}</h4>
							</c:when>
							<c:when test="${build.artcl_bc == 'office'}">
								<h4>${build.artcl_complx}</h4>
							</c:when>
							<c:when test="${build.artcl_bc == 'store'}">
								<h4>${build.artcl_rd}</h4>
							</c:when>
						</c:choose>
						<label class="address">대전광역시 ${build.artcl_gu} ${build.artcl_dong} ${build.artcl_rd} ${build.artcl_rd_detail}</label><br />
						<!-- 평균 시세는 근 3개월 간의 시세를 평균으로 낸다. -->
						<c:choose>
							<c:when test="${dlType == '매매' }">
								<label class="avg-price">평당 평균가&nbsp&nbsp${build.avg_dl}만원</label>
							</c:when>
							<c:when test="${dlType == '전세' }">
								<label class="avg-price">평균 전세가 &nbsp&nbsp${build.dl_depos}만원</label>
							</c:when>
							<c:when test="${dlType == '월세' }">
								<label class="avg-price">평균 보증금&nbsp ${build.dl_depos}만원 <br> 평균 월세가 &nbsp ${build.dl_rnt}만원</label>
							</c:when>
						</c:choose>
						<br>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<div id="noSearchImage">
				<img src="../../img/magnifying_glass.png" id="glassImg"> <br>
				<span id="noSearchText">해당 매물의 검색결과가 존재하지 않습니다</span>
			</div>
		</c:otherwise>
		</c:choose>
	</div>