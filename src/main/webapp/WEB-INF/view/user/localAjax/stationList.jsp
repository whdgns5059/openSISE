<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.table_container {margin-top: 40px; margin-left : 100px; width: 500px;}
	.bus_tp {width:100px;}
	.sttn_lat {display:none;}
	.sttn_lng {display:none;}

</style>
  
<div class="table_container">
	<table class="table table-hover table-stripe table-condensed">
		<thead>
			<tr>
				<th colspan="3" class="orange">
					<strong>버스 정보</strong>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="sttn_nm">
				<td colspan="2">
					<span class="sttn_nm_span">${stationList[0].sttn_nm}</span>
					<input type="hidden" class="sttn_id" value="${stationList[0].sttn_id }"/>
				</td>
				<td class="sttn_lat">${stationList[0].sttn_lat }</td>
				<td class="sttn_lng">${stationList[0].sttn_lng }</td>
			</tr>
			<tr class="${stationList[0].sttn_id}_detail detail">
				<td class="bus_tp">
					${stationList[0].bus_tp}
				</td>
				<td colspan="2">${stationList[0].bus_no}</td>
			</tr>
			<c:forEach items="${stationList }" var="sttn" begin="1" varStatus="s">
				<c:if test="${sttn.sttn_id != stationList[s.index-1].sttn_id}">
					<tr class="sttn_nm">
						<td colspan="2">
							<span class="sttn_nm_span">${sttn.sttn_nm }</span>
							<input type="hidden" class="sttn_id" value="${sttn.sttn_id }"/>
						</td>
						<td class="sttn_lat">${sttn.sttn_lat }</td>
						<td class="sttn_lng">${sttn.sttn_lng }</td>
					</tr>
				</c:if>
				<tr class="${sttn.sttn_id}_detail detail">
					<td class="bus_tp">${sttn.bus_tp}</td>
					<td colspan="2">${sttn.bus_no }</td>
				</tr>
			</c:forEach>
		</tbody>
	
	</table>

</div>


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	