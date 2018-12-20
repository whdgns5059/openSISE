<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="info">
	<div>
		<h3>최신 거래가</h3>
		<table>
			<c:choose>	
				<c:when test="${dl_ty == '매매' }">
					<tr>
						<td>매매금</td>
						<td>층수</td>
						<td>거래년월</td>
					</tr>
					<c:forEach items="${recentTradeList }" var="tlist" end="2">
						<tr>
							<td> <span class="orangetext">${tlist.dl_price } 만원</span> </td>
							<td class="textright" width="40px"> ${ tlist.dl_flr} 층</td>
							<td> &nbsp; ${tlist.dl_cont_ym} </td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${dl_ty == '전세' }">
					<tr>
						<td>전세금</td>
						<td>층수</td>
						<td>거래년월</td>
					</tr>
					<c:forEach items="${recentTradeList }" var="tlist" end="2">
						<tr>
							<td> <span class="orangetext">${tlist.dl_depos } 만원</span> </td>
							<td class="textright" width="40px"> ${ tlist.dl_flr} 층</td>
							<td> &nbsp; ${tlist.dl_cont_ym} </td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${dl_ty == '월세' }">
					<tr>
						<td>보증금</td>
						<td>월세</td>
						<td>층수</td>
						<td>거래년월</td>
					</tr>
					<c:forEach items="${recentTradeList }" var="tlist" end="2">
						<tr>
							<td><span class="orangetext">${tlist.dl_depos} 만원</span> </td>
							<td><span class="orangetext">${tlist.dl_rnt} 만원</span> </td>
							<td class="textright" width="40px"> ${ tlist.dl_flr} 층</td>
							<td> &nbsp; ${tlist.dl_cont_ym} </td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
	<div>
		<c:choose>
			<c:when test="${dl_ty == '매매' }">
				<h3>1년 평균 매매가</h3>
				<span class="orangetext">${avgTradeVo.avg_price } 만원</span>
			</c:when>
			<c:when test="${dl_ty == '전세' }">
				<h3>1년 평균 전세가</h3>
				<span class="orangetext">${avgTradeVo.avg_depos} 만원</span>
			</c:when>
			<c:when test="${dl_ty == '월세' }">
				<h3>1년 평균 월세가</h3>
				<span>보증금</span>	<span class="orangetext">${avgTradeVo.avg_depos} 만원</span><br/>
				<span>월세</span> <span class="orangetext">${avgTradeVo.avg_rnt} 만원</span>
			</c:when>
		</c:choose>
	</div>
</div>
<div>
<hr/>
</div>
<div>
		<c:choose>
			<c:when test="${dl_ty == '매매' }">
				<c:forEach items="${monthlyAvg}" var="avg">
					<input type="hidden" class="avg_dl_price" value="${avg.dl_price}" />
					<input type="hidden" class="avg_dl_cont_ym" value="${avg.dl_cont_ym}" />
				</c:forEach>
			</c:when>
			<c:when test="${dl_ty == '전세' }">
				<c:forEach items="${monthlyAvg}" var="avg">
					<input type="hidden" class="avg_dl_depos" value="${avg.dl_depos}" />
					<input type="hidden" class="avg_dl_cont_ym" value="${avg.dl_cont_ym}" />
				</c:forEach>
			</c:when>
			<c:when test="${dl_ty == '월세' }">
				<c:forEach items="${monthlyAvg}" var="avg">
					<input type="hidden" class="avg_dl_depos" value="${avg.dl_depos}" />
					<input type="hidden" class="avg_dl_rnt" value="${avg.dl_rnt}" />
					<input type="hidden" class="avg_dl_cont_ym" value="${avg.dl_cont_ym}" />
				</c:forEach>
			</c:when>
		</c:choose>
	<div id="monthlyAvg"></div>
</div>
<div>
	<hr/>
</div>
<div>
	<table class="table table-striped">
		<thead>
			<c:choose>
				<c:when test="${dl_ty == '매매'}">
					<tr>
						<td>거래일</td>
						<td>매매가</td>
						<td>층</td>
					</tr>
				</c:when>
				<c:when test="${dl_ty == '전세'}">
					<tr>
						<td>거래일</td>
						<td>전세가</td>
						<td>층</td>
					</tr>
				</c:when>
				<c:when test="${dl_ty == '월세'}">
					<tr>
						<td>거래일</td>
						<td>보증금</td>
						<td>월세</td>
						<td>층</td>
					</tr>
				</c:when>
			</c:choose>
		</thead>	
		<tbody>
			<c:choose>
				<c:when test="${dl_ty == '매매'}">
					<c:forEach items="${dealListByArea }" var="dealList" begin="0" end="6">
						<tr>
							<td width="250px">${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
							<td width="300px">${dealList.dl_price }</td>
							<td width="100px">${dealList.dl_flr }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${dl_ty == '전세'}">
					<c:forEach items="${dealListByArea }" var="dealList" begin="0" end="6">
						<tr>
							<td width="250px">${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
							<td width="300px">${dealList.dl_depos }</td>
							<td width="100px">${dealList.dl_flr }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${dl_ty == '월세'}">
					<c:forEach items="${dealListByArea }" var="dealList" begin="0" end="6">
						<tr>
							<td width="250px">${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
							<td width="300px">${dealList.dl_depos}</td>
							<td width="300px">${dealList.dl_rnt}</td>
							<td width="100px">${dealList.dl_flr }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>	
</div>

<script src="/js/detailchart.js"></script>
