<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.tab-yellow .nav-link, .tab-yellow .nav-link.disabled, .tab-yellow .nav-link.disabled:hover, 
.tab-yellow .nav-link.disabled:focus{
	border-color: #f4b344;
}
.tab-yellow {
	border-color: #f4b344;
}
.tab-yellow .nav-link:hover, .tab-yellow .nav-link:focus {
	background: #f4b344;
}
.tab-green .nav-link, .tab-green .nav-link.disabled, .tab-green .nav-link.disabled:hover, 
.tab-green .nav-link.disabled:focus{
	border-color: #aad035;
}
.tab-green {
	border-color: #aad035;
}
.tab-green .nav-link:hover, .tab-green .nav-link:focus {
	background: #aad035;
}
#map {width : 650px !important; height:1000px;}
</style>
<div class="middleCategory">
	<ul class="nav nav-tabs tab-yellow">
		<c:forEach items="${instiList}" var="insti">
			<li class="nav-item"><a class="nav-link tab-yellow show middleCategory" data-toggle="tab" href="#signDaily" >${insti.insti_nm}</a></li>
		</c:forEach>
	</ul>
</div>
<div class="content">

</div>