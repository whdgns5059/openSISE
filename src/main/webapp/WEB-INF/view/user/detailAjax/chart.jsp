<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="info">
	<div>
		<h3>최신 거래가</h3>
		<table>
		<c:forEach items="${recentTradeList }" var="tlist" end="2">
			<tr>
				<td> <span class="orangetext">${tlist.dl_price } 만원</span> </td>
				<td class="textright" width="40px"> ${ tlist.dl_flr} 층</td>
				<td> &nbsp; ${tlist.dl_cont_ym} </td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<div>
		<h3>1년 평균 매매가</h3>
		<span class="orangetext">${avgTradeVo.avg_price } 만원</span>
	</div>
</div>
<div>
<hr/>
</div>
<div>
	<c:forEach items="${monthlyAvg}" var="avg">
		<input type="hidden" class="avg_dl_price" value="${avg.dl_price}" />
		<input type="hidden" class="avg_dl_cont_ym" value="${avg.dl_cont_ym}" />
	</c:forEach>
	<div id="monthlyAvg"></div>
</div>
<div>
	<table class="table table-striped">
		<thead>
			<tr>
				<td>거래일</td>
				<td>거래금액</td>
				<td>층</td>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${dealListByArea }" var="dealList" begin="0" end="6">
			<tr>
				<td>${dealList.dl_cont_ym }월  ${dealList.dl_cont_d }</td>
				<td>${dealList.dl_price }</td>
				<td>${dealList.dl_flr }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>	
</div>

<script src="/js/detailchart.js"></script>
